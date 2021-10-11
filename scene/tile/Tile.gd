extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ship_name
var is_ship

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init(is_ship:bool,face_right:bool,name):
	self.is_ship = is_ship
	if(self.is_ship):
		self.ship_name = name
		var number = randi() % 12
		$SpriteShip.texture = load("res://asset/ship_"+str(number)+".png")
		if(face_right):
			$SpriteShip.rotate(PI/2)
		else:
			$SpriteShip.rotate(3*PI/2)
			$SpriteShip.visible = false

func _on_Panel_pressed():
	#print("Ship clicked!!!")
	if is_ship:
		$AnimatedStatus.animation = "point"
		$AnimatedStatus.visible = true
		$AnimatedStatus.play()
		yield($AnimatedStatus, "animation_finished")
		$SpriteShip.visible = true
	else:
		$AnimatedStatus.animation = "wrong"
		$AnimatedStatus.visible = true
