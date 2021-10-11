extends Area2D

var ship_positions = Array()
var area_size = Vector2()
var Ship = preload("res://scene/tile/Tile.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func init(ship_size:int,col_size:int,row_size:int,number:int):
	area_size = Vector2(ship_size*col_size,ship_size*row_size)
	
	randomize()
	position = Vector2(ship_size*(col_size*(number-1)),0)

	$Background.texture = load("res://asset/player_"+str(number)+".png")
	$Background.rect_size = area_size
	
	var ship_count = 0
	var pos_x = ship_size/2
	var pos_y = ship_size/2
	var col_count = 1
	var row_count = 1
	
	for i in range(col_size*row_size):
		#print("Player_"+str(number)," - ",col_count," - ",col_size)
		var ship_name = ""
		var add_ship = false
		var new_location = Vector2(pos_x,pos_y)
		var s = Ship.instance()
				
		if(ship_count < 5):
			randomize()
			if(rand_range(0,1) < 0.5):
				ship_count += 1
				add_ship = true
				ship_name = "Player_"+str(number)+"_"+str(ship_count)
				
		s.init(add_ship,number==1,ship_name)
		s.position = new_location
		#print("Ship: ",i," - ",number," - ",add_ship," - ",pos_x," - ",pos_y)
		add_child(s)
		
		if(col_count < col_size):
			col_count += 1
			pos_x +=ship_size
		else:
			if(col_count == col_size):
				col_count = 1
				pos_x = ship_size/2
				pos_y +=ship_size
