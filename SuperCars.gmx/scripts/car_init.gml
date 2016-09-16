//------Edit these values to customize car-------//
max_speed = 11;         //maximum speed car can attain
max_speed_rev = 8;      //maximum speed car can attain reversing

//these values will largely depends on the density of the car
engine_acc = 8;        //forward force, moving forward
engine_brk = 12;        //braking force
engine_rev = 10;        //reverse force, moving backward

max_wheel_angle = 25;   //the maximum angle the wheel can rotate
wheel_angle_velocity=7; //how quickly a wheel rotates

//*note: torque can be set to 0, and car will still turn!
//also angular damping greatly affects the turning capacity of the car.
torque_acc = 6;         //extra torque on the car when turning 
torque_rev = 8;         //extra torque on the car in reverse
torque_damp = 0.1;      //how quickly the car will straighten when not turning
                        //range: (0-1)
                        
drift = 0.3;            //drift control, usually between (0-1) but can be higher
                        //0: no control | 1: high control
                        
//------Leave these values alone------//
acc = 0;                //0 - no acceleration, 1 - forward, 2 - reverse
steer_dir = 0;          //the angle the wheels should be at
wheels[0] = noone;      //array to hold the wheels
