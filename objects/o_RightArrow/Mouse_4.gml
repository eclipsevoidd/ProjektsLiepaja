if (instance_exists(o_AboutPanel)) {
    with (o_AboutPanel) {
        image_index = (image_index < 2) ? image_index + 1 : 0; // lambda for setting correct image
    }
}