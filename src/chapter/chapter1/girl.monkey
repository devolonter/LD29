Strict

Import src.interactable.actionablesprite
Import src.interactable.action.leave
Import src.player
Import scripts

Private

Import chapterassets
Import train

Public

Class Girl Extends ActionableSprite Implements ActionListener

	Field actions:StringMap<SpriteAction>
	
	Field giveTrain:Action
	
	Field giveBrokenTrain:Action
	
	Field train:Train

	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_GIRL)
		
		actions = New StringMap<SpriteAction>()
		
		Local who:String = "The Girl"
		Local noTrain:String = "I would love to have such a train!"
		Local wantTrain:String = "I used to have a train like this"
		Local myTrain:String = "My train, you've found it!"
		
		giveTrain = New Action("Give the train", Self)
		giveBrokenTrain = New Action("Give the broken train", Self)
		
		actions.Set("default", New SpriteAction(who + ": " + noTrain,[Action(New TrainQuestAction())]))
		actions.Set("give.train", New SpriteAction(who + ": " + wantTrain,[Action(New LeaveAction()), giveTrain]))
		actions.Set("give.train.good", New SpriteAction(who + ": " + myTrain,[Action(New LeaveAction()), giveTrain]))
		actions.Set("give.train.broken", New SpriteAction(who + ": " + wantTrain,[Action(New LeaveAction()), giveBrokenTrain]))
		
		SetAction(actions.Get("default"))
	End Method
	
	Method OnInteract:Void()
		FlxG.Play(ChapterAssets.SOUND_GIRL)
	
		If (Player.Items.Contains("train")) Then
			If ( Not Chapter1.Boy.whistle) Then
				SetAction(actions.Get("give.train"))
			Else
				SetAction(actions.Get("give.train.good"))
			End If
			
		ElseIf(Player.Items.Contains("train.broken")) Then
			SetAction(actions.Get("give.train.broken"))
		End If
	
		Super.OnInteract()
	End Method
	
	Method OnAction:Void(action:Action)
		Select action
			Case giveTrain
				Player.Items.Remove("train")
				'FlxG.Play(ChapterAssets.SOUND_LAUGHTER)
			
				If ( Not Chapter1.Boy.whistle) Then
					Chapter1.Boy.train.Reset(480, 195 + Game.SCREEN_PADDING)
					Game.Chapter.state.RemoveInteractable(Self, True)
				
					If ( Not Player.Items.Contains("train.broken")) Then
						New ScriptBoyInYard(Game.Chapter.state.outdoors)
					Else
						Local s:FlxSound = FlxG.Play(ChapterAssets.SOUND_BOY_CRY)
						s._SetTransform(s.Volume, 1)
										
						New ScriptBoyShadow(Game.Chapter.state.outdoors)
					End If
				Else
					train = New Train(480, 195 + Game.SCREEN_PADDING)
					Game.Chapter.state.playground.AddItem(train)
					
					Game.Chapter.state.RemoveInteractable(Self, True)
					
					Local s:FlxSound = FlxG.Play(ChapterAssets.SOUND_WINDOW)
					s._SetTransform(s.Volume, 1)
					
					New ScriptSamaraFall(Game.Chapter.state.outdoors)
				End If
				
			Case giveBrokenTrain
				Game.Dialog.Push("The Girl: That's not my train!",[Action(New LeaveAction())])
				Player.Items.Insert("quest.exhange.train")
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
		New ScriptBrokenTrain(Game.Chapter.state.outdoors)
	End Method

End Class