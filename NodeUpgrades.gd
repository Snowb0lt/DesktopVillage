extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#GameManager for Resources
@onready var GameManager = $"../../Game Manager"

@onready var UpgradePanel = $"../../Game Manager/Menus/Upgrades"
@onready var UpgradeDesc = $"../../Game Manager/Menus/Upgrades/Upgrade Desc"
@onready var UpgradeName = $"../../Game Manager/Menus/Upgrades/Upgrade Name"
#FOR RESOURCE COSTS
@onready var WoodCostLabel = $"../../Game Manager/Menus/Upgrades/Costs/Wood/WoodCost"
@onready var StoneCostLabel = $"../../Game Manager/Menus/Upgrades/Costs/Stone/StoneCost"
@onready var GoldCostLabel = $"../../Game Manager/Menus/Upgrades/Costs/Gold/GoldCost"
@onready var PopNeededLabel = $"../../Game Manager/Menus/Upgrades/Costs/Pop/PopCost"
func _on_field_button_pressed() -> void:
	displayUpgrade("Grain Field", GameManager.buildingList[0][1], 
	"Where your villagers produce food" ,1, 1, 1, 1)

func _on_stone_button_pressed() -> void:
	pass # Replace with function body.

func _on_forest_button_pressed() -> void:
	pass # Replace with function body.

func displayUpgrade(Name, Level, Description, WoodCost, StoneCost, GoldCost, PopNeeded):
	if UpgradePanel.visible == false:
		UpgradePanel.visible = true
	
	UpgradeName.text = Name + " | " + str(Level)
	UpgradeDesc.text = Description
	WoodCostLabel.text = str(WoodCost)
	StoneCostLabel.text = str(StoneCost)
	GoldCostLabel.text = str(GoldCost)
	PopNeededLabel.text = str(PopNeeded)
