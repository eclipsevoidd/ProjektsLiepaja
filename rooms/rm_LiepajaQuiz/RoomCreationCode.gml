enum quizState {
	Intro,
	Game,
	End,
}

var _assets = [s_PlusOne, s_QuizBG, s_QuizPanel, s_QMark, s_Tilts];
sprite_prefetch_multi(_assets);

global.state = quizState.Intro;