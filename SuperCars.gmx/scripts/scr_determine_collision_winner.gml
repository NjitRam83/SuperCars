var car1 = argument0;
var car2 = argument1;

var car1quadrant = scr_direction_to_quadrant(car1.direction);
var car2quadrant = scr_direction_to_quadrant(car2.direction);

if(car1quadrant == car2quadrant)
{
    switch(car1quadrant)
    {
        case 0:
            return car1.y < car2.y;
            break;
        case 1:
            return car1.x < car2.x;
            break;
        case 2:
            return car1.y > car2.y;
            break;
        case 3:
            return car1.x > car2.x;
            break;
    }
}

return -1;
