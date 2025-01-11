extends Node2D
class_name HealthComponent

@export var max_Health := 3
var current_Health : float

#Take damage and call death function when health reaches 0
func damage(attack: Attack):
	var is_critical := false
	current_Health -= attack.attack_damage
	DamageNumbers.display_number(attack.attack_damage, self.global_position, is_critical)
	print(get_parent().name + " was hit!")
	if current_Health <= 0:
		if get_parent().has_method("die"):
			print(get_parent().name + " died! :C")
			get_parent().die() #calls any func named "die" in entity's script



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_Health = max_Health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
