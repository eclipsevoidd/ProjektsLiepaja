//scr_draw_rect_rotated(cx, cy, w, h, angle)
  function scr_draw_rect_rotated(_cx, _cy, _w, _h, _angle) {
      var _hw = _w / 2;
      var _hh = _h / 2;
      
      // 4 corners relative to center, then rotated
      var _cos = dcos(_angle);
      var _sin = dsin(_angle);
      
      var _x1 = _cx + (-_hw) * _cos - (-_hh) * _sin;
      var _y1 = _cy + (-_hw) * _sin + (-_hh) * _cos;
      
      var _x2 = _cx + ( _hw) * _cos - (-_hh) * _sin;
      var _y2 = _cy + ( _hw) * _sin + (-_hh) * _cos;
      
      var _x3 = _cx + ( _hw) * _cos - ( _hh) * _sin;
      var _y3 = _cy + ( _hw) * _sin + ( _hh) * _cos;
      
      var _x4 = _cx + (-_hw) * _cos - ( _hh) * _sin;
      var _y4 = _cy + (-_hw) * _sin + ( _hh) * _cos;
      
      draw_triangle(_x1, _y1, _x2, _y2, _x3, _y3, false);
      draw_triangle(_x1, _y1, _x3, _y3, _x4, _y4, false);
  }

//  Then replace "draw_rectangle_rotated" calls in the Draw Event
//  with scr_draw_rect_rotated().
// ============================================================