///car_add_wheel(xoff,yoff,rotatable,powered,object_index)
//description//
/*
    creates a wheel and all neccessary joints 
    and adds it to the wheels array of the car
*/

//arguments//
var xoff = argument0, //x position relative to car position
    yoff = argument1, //y position relative to car position
    rot  = argument2, //whether this wheel will rotate
    pow  = argument3, //whether force will be applied to this wheel
    idx  = argument4; //the object index that will be used in instance_create
    
//get a position in the array
var i = array_length_1d(wheels);
if(wheels[0] == noone)
    i = 0; //first position!
    
//create wheel instance
wheels[i] = instance_create(x+xoff,y+yoff,idx);

//create joint
var joint;
if(rot) //revolute joint if wheel is rotatable
    joint = physics_joint_revolute_create(id,wheels[i],wheels[i].x,wheels[i].y,
                                -max_wheel_angle,max_wheel_angle,true,0,0,0,0);
else //prismatic joint for a unrotatable wheel
    joint = physics_joint_prismatic_create(id,wheels[i],wheels[i].x,wheels[i].y,
                                    1,0,0,0,1,0,0,0,0);
//save wheel information
wheels[i].powered = pow;
wheels[i].joint = joint;
wheels[i].rotatable = rot;

//return wheel object
return wheels[i];
