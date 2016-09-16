///scr_add_point(array,index,x1,y1,x2,y2)

//description//
/*
    adds x1,y1,x2,y2 information to an array at the specified index
    returns the edited array, which you must set
*/

//arguments//
var a = argument0;  //the array to use
var i = argument1;  //the index in the array to store point information
var x1 = argument2; //the x1 position of the point
var y1 = argument3; //the y1 position of the point
var x2 = argument4; //the x2 position of the point
var y2 = argument5; //the y2 position of the point

a[i,0] = x1;
a[i,1] = y1;
a[i,2] = x2;
a[i,3] = y2;

return a;
