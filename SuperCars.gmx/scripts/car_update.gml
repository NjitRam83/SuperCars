///car_update(accelerate,steer_direction)

//arguments//
var acc     = argument0; //0: no acceleration | 1: forward acceleration | -1: brake/reverse
    steer   = argument1; //the angle the wheels should turn towards, relative to car rotation
                         //note: this value is limited by *max_wheel_angle*
var wheel_angle = 0;
var wheel_angle_set = false;
var dangle = 0;
var wheel_num = array_length_1d(wheels);
var wheel=noone;
var engine=0;

//true if the car is moving forward, false when moving backwards
var moving_forward = dot_product(phy_speed_x,phy_speed_y,
                lengthdir_x(1,-phy_rotation+90), 
                lengthdir_y(1,-phy_rotation+90)) > 0;
                
//get the force for each powered wheel
{
    //forward engine
    if(acc == 1 && phy_speed <= max_speed ) 
        engine = -engine_acc;
    //brake/reverse
    if(acc == -1) //if moving forward use brake engine
        if(moving_forward)
            engine = engine_brk;
        else if(phy_speed <= max_speed_rev)//use reverse engine
            engine = engine_rev;
}
for(var i = 0; i < wheel_num; i++) //loop through array of wheels
{
    //get wheel instance
    wheel = wheels[i];
    if(!instance_exists(wheel)) continue; //if wheel does not exist then continue with loop
    //apply engine force
    if(wheel.powered)
        with(wheel) 
            physics_apply_local_force(0,0,0,engine);
    //set the rotation(angle) for the rotatable wheels
    if(wheel.rotatable)
    {
        if(!wheel_angle_set)
        {
            //get angle of a rotatable wheel
            wheel_angle = wheel.phy_rotation - phy_rotation;
            //get the difference between car rotation and wheel rotation
            dangle = angle_difference(clamp(steer,-max_wheel_angle,max_wheel_angle),
                                            wheel_angle);
            //add difference to wheel's angle 
            wheel_angle += clamp(dangle,-wheel_angle_velocity,wheel_angle_velocity);
            //report that we have set the wheel_angle variable so we don't do it again!
            wheel_angle_set = true;
        }
        //set wheel rotation
        wheel.phy_rotation = phy_rotation + wheel_angle;
        //prevent random wheel joint physics
        wheel.phy_angular_velocity = 0;
    }
    //kill sideway speed of wheel
    with(wheel) 
        kill_sideway_speed(other.drift);
}
//kill sideway speed of car
kill_sideway_speed(drift);

//get torque value based acceleration
var torq = torque_acc; //forward torq
var max_spd = max_speed
if(acc == -1 || !moving_forward) {
    torq = -torque_rev; //reverse torque
    max_spd = max_speed_rev; //reverse max speed
}

//apply torque --- makes the car rotate faster
physics_apply_torque(torq * sign(steer) * min(phy_speed*2/max_spd,1));

//angular friction when not steering
if(wheel_angle == 0)
    phy_angular_velocity -= sign(phy_angular_velocity) * torque_damp;

//prevent excess sliding
if(phy_speed <= 0.2 && acc == 0)
{
    phy_speed_x = 0;
    phy_speed_y = 0;
}
