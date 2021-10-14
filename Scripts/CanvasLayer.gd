extends CanvasLayer

var left
var left_1

func _ready():
	left = ProjectSettings.get_setting("display/window/size/width")
	left_1= ProjectSettings.get_setting("display/window/size/height")

