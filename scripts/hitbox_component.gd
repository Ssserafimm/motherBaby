extends Area2D

@export var health_component : HealthComponent

#Call damage function on attached Health Component
func damage(attack: Attack):
	if health_component:
		health_component.damage(attack)


func _process(delta: float) -> void:
	pass

func _ready() -> void:
	pass


func _on_damage_component_skeleton_attack() -> void:
	pass # Replace with function body.
