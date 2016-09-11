var dir = argument0;

if(dir >= 45 && dir < 135)
{
    return 0;
}

if(dir>= 135 && dir < 225)
{
    return 1;
}

if(dir>= 225 && dir < 315)
{
    return 2;
}

if(dir>= 315 || dir < 455)
{
    return 3;
}
