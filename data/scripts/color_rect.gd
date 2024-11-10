extends ColorRect
var timeVar = 0.0
var desiredSizeX = 0
var desiredSizeY = 0
var currentTime = 0
var durationTime = 1
var progress = 0
func _ready() -> void:
	size *= 0
	pass

func _process(delta: float) -> void:
	desiredSizeX = get_viewport().size.x / 2
	desiredSizeY = ( get_viewport().size.y / 4 ) + int($"../Handler".totalHeight)
	var done = false
	if size.x != desiredSizeX or size.y != desiredSizeY:
		if !done:
			if timeVar < durationTime:
				timeVar += delta
				progress = timeVar / durationTime
				progress = clamp(progress, 0, durationTime)
				size.x = lerp(0,desiredSizeX,progress)
				size.y = lerp(0,desiredSizeY,progress)
				
			if progress == 1:
				done = true
				timeVar = 0
				pass
			#timeVar = clamp(timeVar, 0, durationTime)
