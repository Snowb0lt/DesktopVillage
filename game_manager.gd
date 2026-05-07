extends Node2D

#UI Systems
@onready var resourceUI = $Menus/Resources
#Resources to Manage
var resourceList = [ #RESOURCE NAME, AMOUNT
["Food", 0], #Sustains the population and keeps it growing.
["Wood", 0], #Wood used to construct a variety of buildings
["Stone",0], #Stone used to construct a variety of buildings
["Money",0], #The money needed to purchase upgrades and such
["Pop",1] #The village population, which is required to meet a certain threshold for various buildings and events
]

#Building Levels
var buildingList = [ #BUILDING NAME, LEVEL
["Farm", 1], #For food
["Forest", 1], #For Wood
["Quarry",1], #For Stone
["Main",1], #For Gold
["Homes",1], #For Pop
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Set Resources
	'''
	Food = 0
	Wood = 0
	Stone = 0
	Money = 0
	Pop = 1
	'''
	
	#Set Building Levels
	for building in buildingList:
		buildingList[1][1] = 1
		print("Changing ", building, " to 1")
	
	for building in buildingList:
		print(building)

func addResource(resourceBuilding, currentStock):
	var resourceAmount = currentStock
	#print("The resource buidling selected is ", resourceBuilding)
	resourceAmount += 1 * resourceBuilding[1] #Get the level of the resource building and multiply it by 1
	return resourceAmount

func measureFood(farmLevel, foodAmount, population):
	var returnedFood = foodAmount + (5 * farmLevel) - population
	return returnedFood

#UPDATE RESOURCES
func _on_update_tick_timeout() -> void:
	#Update WOOD and STONE
	for resource in range(2):
		resourceList[resource+1][1] = addResource(buildingList[resource],resourceList[resource+1][1])
		
		#print("The amount of ", resourceList[resource+1][0], " is ", resourceList[resource+1][1])
	#Update FOOD
	resourceList[0][1] = measureFood(buildingList[0][1], resourceList[0][1], resourceList[4][1])
	#print("The amount of food is ", resourceList[0][1])
	
	#Update the resource UI
	for index in range(len(resourceList)):
		resourceUI.updateResourceDisplay(index, resourceList[index][1])

@onready var ResourceMenu = $"Menus/Resources/Resource Screen"
@onready var ResourceCloseButton = $Menus/Resources/ResourceMenuClose2
@onready var ResourceOpenButton = $Menus/Resources/ResourceMenuOpen

#For the Resource Buttons
func _on_close_resource_pressed() -> void:
	ResourceMenu.visible = false
	ResourceCloseButton.visible = false
	ResourceOpenButton.visible = true

func _on_open_resource_pressed() -> void:
	ResourceMenu.visible = true
	ResourceCloseButton.visible = true
	ResourceOpenButton.visible = false
