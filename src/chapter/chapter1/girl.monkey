Strict

Import src.interactable.actionablesprite
Import src.interactable.action.leave
Import src.player
Import scripts

Private

Import chapterassets

Public

Class Girl Extends ActionableSprite Implements ActionListener

	Field actions:StringMap<SpriteAction>
	
	Field giveTrain:Action

	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_GIRL)
		
		actions = New StringMap<SpriteAction>()
		
		Local who:String = "The Girl"
		Local noTrain:String = "I would love to have such a train!"
		Local wantTrain:String = "I used to have a train like this"
		
		giveTrain = New Action("Give the train", Self)
		
		actions.Set("default", New SpriteAction(who + ": " + noTrain,[Action(New TrainQuestAction())]))
		actions.Set("give.train", New SpriteAction(who + ": " + wantTrain,[Action(New LeaveAction()), giveTrain]))
		
		SetAction(actions.Get("default"))
	End Method
	
	Method OnInteract:Void()
		If (Player.Items.Contains("train")) Then
			SetAction(actions.Get("give.train"))
		End If
	
		Super.OnInteract()
	End Method
	
	Method OnAction:Void(action:Action)
		Select action
			Case giveTrain
				Player.Items.Remove("train")
			
				Chapter1.Boy.train.Reset(480, 195 + Game.SCREEN_PADDING)
				Game.Chapter.state.RemoveInteractable(Self, True)
				
				New ScriptBoyInYard(Game.Chapter.state.outdoors)
		End Select
	End Method

End Class

Private

Class TrainQuestAction Extends LeaveAction Implements ActionListener
	
	Method New()
		listener = Self
	End Method
	
	Method OnAction:Void(action:Action)
		Player.Items.Insert("quest.train")
	End Method

End Class