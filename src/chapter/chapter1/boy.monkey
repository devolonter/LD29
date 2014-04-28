Strict

Import src.interactable.actionablesprite
Import src.interactable.action.leave
Import src.player

Private

Import chapterassets
Import train

Public

Class Boy Extends ActionableSprite Implements ActionListener

	Field actions:StringMap<SpriteAction>
	
	Field takeTrain:Action
	
	Field train:Train

	Method New(x:Float, y:Float, train:Train)
		Super.New(x, y, ChapterAssets.SPRITE_BOY)
		Self.train = train
		
		actions = New StringMap<SpriteAction>()
		
		Local who:String = "The Boy"
		Local hasTrain:String = "Look what a train I have ! Isn't it cool? It lacks a whistle, though."
		
		takeTrain = New Action("Take away the train", Self)
		
		actions.Set("default", New SpriteAction(who + ": " + hasTrain,[Action(New LeaveAction())]))
		actions.Set("take.train", New SpriteAction(who + ": " + hasTrain,[Action(New LeaveAction()), takeTrain]))
		
		SetAction(actions.Get("default"))
	End Method
	
	Method OnInteract:Void()
		If (Player.Items.Contains("quest.train")) Then
			SetAction(actions.Get("take.train"))
		End If
	
		Super.OnInteract()
	End Method
	
	Method OnAction:Void(action:Action)
		Select action
			Case takeTrain
				Player.Items.Insert("train")
				Self.train.Kill()
				Kill()
		End Select
	End Method

End Class

