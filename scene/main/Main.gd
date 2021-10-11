extends Area2D

export var ship_size:int
export var col_size:int
export var row_size:int

onready var Field = preload("res://scene/grid/Grid.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var field1 = Field.instance()
	var field2 = Field.instance()
	field1.init(ship_size,col_size,row_size,1)
	field2.init(ship_size,col_size,row_size,2)
	add_child(field1)
	add_child(field2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
