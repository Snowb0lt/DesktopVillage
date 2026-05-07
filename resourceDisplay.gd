extends Node2D

@onready var resourceLabelList = [
	$"Resource Screen/Food/FoodCount",
	$"Resource Screen/Wood/WoodCount",
	$"Resource Screen/Stone/StoneCount",
	$"Resource Screen/Gold/GoldCount",
	$"Resource Screen/Pop/PopCount"
]

func _ready() -> void:
	for label in resourceLabelList:
		label.text = "0"

func updateResourceDisplay(resourcePosition, resourceAmount):
	#print(resourcePosition)
	resourceLabelList[resourcePosition].text = str(resourceAmount)
