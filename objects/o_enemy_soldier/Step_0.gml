bob += 4;
y += spd;
x += sin(degtorad(bob)) * 0.3;

if (y > exit_y) {
    with (o_gameController) { enemies_escaped++; score_val += pts_escaped; }
    var _t = instance_create_layer(x, y, "Instances", o_txt);
    _t.text = string(o_gameController.pts_escaped); _t.col = c_orange;
    instance_destroy();
}