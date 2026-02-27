// Scoring handled in o_Ball. Just prevent double-triggers.
if (other.vspeed > 0) {
    other.x = x;
}