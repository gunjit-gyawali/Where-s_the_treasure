extends Node

@onready var menu_music = $MenuMusic
@onready var game_music = $GameMusic


func play_menu_music():
	if game_music.playing:
		game_music.stop()

	if not menu_music.playing:
		menu_music.play()


func play_game_music():
	if menu_music.playing:
		menu_music.stop()

	if not game_music.playing:
		game_music.play()
