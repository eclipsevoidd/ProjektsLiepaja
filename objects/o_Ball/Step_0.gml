// 1. APPLY GRAVITY
vsp += grav;

// 2. NET FRICTION & VISUAL EFFECT
var _hoop = instance_nearest(x, y, o_hoop);
if (instance_exists(_hoop)) {
    // If the ball is inside the rim area
    if (abs(x - _hoop.x) < 20 && y > _hoop.y - 10 && y < _hoop.y + 20) {
        
        // If we haven't triggered the effect yet...
        if (!scored && vsp > 0) { // vsp > 0 ensures it's falling DOWN through the hoop
            scored = true;
            
           scored = true; // This flips the trail to yellow!
            
            // 1. Create a "Score" Pop (Burst of 10 particles)
            repeat(10) {
                var _part = instance_create_layer(_hoop.x, _hoop.y, "Instances", o_Effect); 
                // Note: You'll need to create a tiny o_Effect object that flies out and dies
            }

           
            
            show_debug_message("SWISH!"); 
        }
        
        hsp *= 0.7; // The friction that "catches" it in the net
    }
}

if (instance_exists(o_Enemy) && o_Enemy.has_ball) {
    x = o_Enemy.x + (15 * image_xscale);
    y = o_Enemy.y - 10;
    hsp = 0;
    vsp = 0;
}

// 3. COLLISION & MOVEMENT
if (place_meeting(x + hsp, y, o_Solid)) {
    hsp = -hsp * bounce;
}
x += hsp; // The ball now only moves ONCE per frame

if (place_meeting(x, y + vsp, o_Solid)) {
    if (vsp > 0) {
        while (!place_meeting(x, y + sign(vsp), o_Solid)) {
             y += sign(vsp);
        }
    }
    vsp = -vsp * bounce;
    hsp *= 0.9;
}
y += vsp; // The ball now only moves ONCE per frame

// 4. SPIN
image_angle -= hsp * 2;

// Update Trail Positions
for (var i = trail_length - 1; i > 0; i--) {
    trail_x[i] = trail_x[i - 1];
    trail_y[i] = trail_y[i - 1];
}
trail_x[0] = x;
trail_y[0] = y;