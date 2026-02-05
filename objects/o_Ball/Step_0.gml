// 1. APPLY GRAVITY

vspeed += grav;

// 2. HORIZONTAL COLLISION (Walls, Backboard, Rim Sides)

if (place_meeting(x + hspeed, y, o_Solid)) {
    hspeed = -hspeed * bounce;
}

// 3. VERTICAL COLLISION (Floor, Top of Rim)

if (place_meeting(x, y + vspeed, o_Solid)) {

    if (vspeed > 0) {

        while (!place_meeting(x, y + sign(vspeed), o_Solid)) {
            y += sign(vspeed);
        }
    }
    
    vspeed = -vspeed * bounce;
    
    hspeed *= 0.9;
}

// 4. SPIN THE BALL
image_angle += hspeed * 2;

// 5. FINAL MOVEMENT
x += hspeed;
y += vspeed;