bob += 2;
x -= spd;
y += sin(degtorad(bob)) * 0.5;
if (flash > 0) flash--;

if (x < exit_x) {
    with (o_gameController) { enemies_escaped++; score_val += pts_escaped; }
    var _t = instance_create_layer(x, y, "Instances", o_txt);
    _t.text = string(o_gameController.pts_escaped); _t.col = c_orange;
    instance_destroy();
}