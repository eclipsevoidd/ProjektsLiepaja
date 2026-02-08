// This is a simple score trigger
if (other.vspeed > 0) { // Only count if the ball is falling DOWN
    score += 3;
    
    // Move ball slightly so it doesn't trigger score twice
    other.x = x; 
}