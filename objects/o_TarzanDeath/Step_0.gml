timer--;
if (timer <= 0)
{
    room_restart();
    instance_destroy();
}