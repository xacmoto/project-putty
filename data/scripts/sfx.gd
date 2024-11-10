extends AudioStreamPlayer2D
@onready var streamer = $"."
var audioIndex = [null, preload("res://data/audio/dada.ogg"), preload("res://data/audio/flip.ogg"), preload("res://data/audio/tick.ogg"), preload("res://data/audio/balloon.ogg")]
@export var CurrentSound = 1
var Playing = true
var Cached = false
var a = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(CurrentSound)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("Playing ",Playing)
	#print("Cached ", Cached)
	#print(streamer.get_playback_position())
	if CurrentSound > 0 and Playing:
		if Cached == false:
			#print("new sound")
			streamer.stream = audioIndex[CurrentSound]
			streamer.play()
			a = CurrentSound
			Cached = true
		if streamer.get_playback_position() >= streamer.stream.get_length():
			#print("finished sound")
			Playing = false
			Cached = false
			CurrentSound = 0
		elif a != CurrentSound:
			streamer.stop()
			#print("sound changed")
			Cached = false
		if streamer.playing == false:
			Playing = false
			Cached = false
