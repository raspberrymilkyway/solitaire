extends Node2D

#???const CardHandler = preload("res://scripts/CardHandler.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	var _klondike = Klondike.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


class Klondike:
	#constant, not const b/c setup in _init but needs to be global
	var HANDSIZE
	
	var boardCards
	var handCards
	var pileCards
	var currHandIndex
	
	func _init(handsize=3):
		boardCards = []
		handCards = []
		pileCards = []
		currHandIndex = 0
		HANDSIZE = handsize
		
		initCards()
		print(handCards)
	
	func initCards():
		#at some point, this needs to move from text to Cards
		# the Card name would probably match the value from the array
		#alternately, we can just instantiate the damn scene with the basic card layout out
		# and just replace "Value" on the cards as appropriate.
		#idk, i have to fuck with the layouts to see what'd be easiest, ig
		#hmm well. actually, it'd probably be easiest to script it, so maybe a control thing for placement?
		# and then making Cards w/ script
		
		var allCards = ['HA','H1','H2','H3','H4','H5','H6','H7','H8','H9','H10','HJ','HQ','HK',
						'DA','D1','D2','D3','D4','D5','D6','D7','D8','D9','D10','DJ','DQ','DK',
						'SA','S1','S2','S3','S4','S5','S6','S7','S8','S9','S10','SJ','SQ','SK',
						'CA','C1','C2','C3','C4','C5','C6','C7','C8','C9','C10','CJ','CQ','CK']
		randomize() #random seed
		allCards.shuffle() #shuffle array
		
		boardCards = [allCards.slice(0,1), allCards.slice(1,3), allCards.slice(3,6), allCards.slice(6,10), allCards.slice(10,15), allCards.slice(15,21), allCards.slice(21,28)]
		handCards = allCards.slice(28)
		
		print(allCards)
		print(boardCards)
	
	func dealHand():
		var maxHandIndex = len(handCards)-1
		currHandIndex += HANDSIZE
		if currHandIndex > maxHandIndex:
			currHandIndex = 0
		
		print(currHandIndex)
