var _completed = (level < global.currentLevel && level != global.can_retry_level);
if (!is_locked && !_completed) {
    audio_play_sound(snd_blip2, 0, false, 0.1);
}