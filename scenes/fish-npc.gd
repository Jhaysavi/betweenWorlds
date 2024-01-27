extends KinematicBody2D


const speed = 30
var current_state = IDLE
var dir = Vector2.RIGHT

var start_pos

func _ready():
	randomize()
	start_pos = position
	$Timer.wait_time = choose([0.5, 1, 1.5]) 
	$Timer.start()

enum{
	IDLE,
	NEW_DIR,
	MOVE
}
func _process(delta):
	
	if current_state == 0:
		$Sprite/AnimatedSprite.play("IDLE")
	if current_state == 1:
		$Sprite/AnimatedSprite.play("IDLE")
	if current_state == 2:
		$Sprite/AnimatedSprite.play("walk")
		
		
	match current_state:
		IDLE:
			pass
		NEW_DIR:
			dir = choose([Vector2.RIGHT,Vector2.UP,Vector2.LEFT,Vector2.DOWN])
		MOVE:
			move(delta)

func move(delta):
	position += dir * speed * delta
	
	if dir.x ==1:
		$Sprite/AnimatedSprite.flip_h = false
	elif dir.x == -1:
		$Sprite/AnimatedSprite.flip_h = true

		
	if position.x >= start_pos.x + 20:
		position.x = start_pos.x + 19.9
	elif position.x >= start_pos.x - 20:
		position.x = start_pos.x - 19.9
	elif position.y >= start_pos.y + 20:
		position.y = start_pos.y + 19.9
	elif position.y >= start_pos.y - 20:
		position.y = start_pos.y - 19.9
	

func choose(array):
	array.shuffle()
	return array.front()


func _on_Timer_timeout():
	$Timer.wait_time = choose([0.5, 1, 1.5])
	current_state = choose([IDLE,NEW_DIR,MOVE])
