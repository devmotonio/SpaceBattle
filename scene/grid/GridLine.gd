extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var tilemap_rect = get_parent().area_size
onready var tilemap_cell_size = Vector2(60,60)
onready var color = Color(0.0, 1.0, 0.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()

func _draw():
	#print("_draw")
	#print("tilemap_rect.y: "+str(tilemap_rect.y),"tilemap_rect.x: "+str(tilemap_rect.x))
	for y in range(0, tilemap_rect.y):
		draw_line(Vector2(0, y * tilemap_cell_size.y), 
		Vector2(tilemap_rect.x * tilemap_cell_size.x, y * tilemap_cell_size.y), color)
		#print("y: "+str(y))
	for x in range(0, tilemap_rect.x):
		draw_line(Vector2(x * tilemap_cell_size.x, 0), 
		Vector2(x * tilemap_cell_size.x, tilemap_rect.y * tilemap_cell_size.y), color)
		#print("x: "+str(x))
