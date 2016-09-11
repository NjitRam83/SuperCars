var car1 = argument0;
var car2 = argument1;

var car1quadrant = scr_direction_to_quadrant(car1.direction);
var car2quadrant = scr_direction_to_quadrant(car2.direction);

var car1WinsCollision = -1;

//Rear end collision
if(car1quadrant == car2quadrant)
{
    car1WinsCollision = scr_determine_collision_winner(car1, car2);
    
    if(car1WinsCollision)
    {
        car1.speed += car2.speed;
        car2.speed = 0;
    }
    else
    {
        car2.speed += car1.speed;
        car1.speed = 0;    
    }
}

// Head on collision
if(abs(car1quadrant - car2quadrant) =2)
{
    car1.speed = 0;
    car2.speed = 0;
}


//TODO: Side collisions
