with(o_QuizButton) {
	image_xscale = o_QuestionPanel.image_xscale * 0.85;
	image_alpha = (o_QuestionPanel.image_xscale * 0.8) * o_QuestionPanel.image_alpha + opac; // ĻOTI HACKY, bet strādā
}