if (isAnimating) {
    animCounter++;

    if (animCounter >= 10) {
        image_index += animationDirection;
        animCounter = 0;

        if (image_index >= 2) {
            animationDirection = -1;
            image_index = 2;
        } else if (image_index <= 0) {
            animationDirection = 1;
            image_index = 0;
            isAnimating = false;
        }
    }
}

if (throwTrash) {
    isAnimating = true;
    
    o_scoreLiepajasRAS.totalScore--;

    if (o_itemInventoryLiepajasRAS.sprite_index == s_paperLiepajasRAS) {
        o_scoreLiepajasRAS.correctlySortedTrash++;
    }

    o_itemInventoryLiepajasRAS.sprite_index = -1;
	throwTrash = false;
}

