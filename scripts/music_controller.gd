extends Node2D

@onready var sound_track = {
	"TitleScreen": $TitleScreen,
	"Level 01": $Level01
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play(track: String):
	var music = sound_track[track]
	
	if !music.playing:
		stop_all()
		music.play()

func stop_all():
	for t in sound_track:
			sound_track[t].stop()

func stop(track: String):
	var music = sound_track[track]
	
	if music.playing:
		music.stop()
