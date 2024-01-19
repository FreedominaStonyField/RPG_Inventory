extends Resource

class_name game_item

@export_category("Item Info")
@export var stackable:bool
@export var max_stack_size:int
@export var item_name : StringName
@export_enum("Item", "Healing", "Equipment", "Indispensable") var item_catagory: String
