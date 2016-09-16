//get the x and y compenent of the object's x axis (sideway axis)
var axis_x = lengthdir_x(1,-phy_rotation+0);
    axis_y = lengthdir_y(1,-phy_rotation+0);
    
//project phy_speed to the axis and return the magnitude
return dot_product(axis_x,axis_y,phy_speed_x,phy_speed_y);
