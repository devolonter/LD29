Strict

Import src.interactable.actionablesprite
Import src.interactable.action.leave
Import src.player

Private

Import chapterassets
Import train
Import scripts

Public

Class Boy Extends ActionableSprite Implements ActionListener, FlxTweenListener

	Field actions:StringMap<SpriteAction>
	
	Field takeTrain:Action
	
	Field giveWhistle:Action
	
	Field exchangeTrain:Action
	
	Field train:Train
	
	Field fadeTween:NumTween
	
	Field whistle:FlxSprite

	Method New(x:Float, y:Float, train:Train)
		Super.New(x, y, ChapterAssets.SPRITE_BOY)
		Self.train = train
		
		actions = New StringMap<SpriteAction>()
		
		Local who:String = "The Boy"
		
		Local hasTrain:String = "Look what a train I have ! Isn't it cool? It lacks a whistle, though."
		Local questionWhistle:String = "Do you have my whistle?"
		
		takeTrain = New Action("Take away the train", Self)
		giveWhistle = New Action("Give the whistle", Self)
		exchangeTrain = New Action("Make an exchange", Self)
		
		actions.Set("default", New SpriteAction(who + ": " + hasTrain,[Action(New LeaveAction())]))
		actions.Set("take.train", New SpriteAction(who + ": " + hasTrain,[Action(New LeaveAction()), takeTrain]))
		actions.Set("exchange.train", New SpriteAction(who + ": " + hasTrain,[Action(New LeaveAction()), exchangeTrain, takeTrain]))
		
		actions.Set("question.whistle", New SpriteAction(who + ": " + questionWhistle,[Action(New LeaveAction())]))
		actions.Set("give.whistle", New SpriteAction(who + ": " + questionWhistle,[Action(New LeaveAction()), giveWhistle]))
		
		SetAction(actions.Get("default"))
		
		fadeTween = New NumTween(Self)
		AddTween(fadeTween)
	End Method
	
	Method Update:Void()
		Super.Update()
		
		If (fadeTween.active) Then
			Alpha = fadeTween.value
			
			If (whistle) Then
				whistle.Alpha = fadeTween.value
			End If
		End If
	End Method
	
	Method Draw:Void()
		Super.Draw()
		
		If (whistle) Then
			whistle.Draw()
		End If
	End Method
	
	Method OnInteract:Void()
		FlxG.Play(ChapterAssets.SOUND_BOY)
	
		If (Player.Items.Contains("train.broken")) Then
			If (Player.Items.Contains("quest.exhange.train")) Then
				If (Player.Items.Contains("quest.find.whistle")) Then
					If (Player.Items.Contains("whistle")) Then
						SetAction(actions.Get("give.whistle"))
					Else
						SetAction(actions.Get("default"))
					End If
					
				Else
					SetAction(actions.Get("exchange.train"))
				End If
			Else
				SetAction(actions.Get("default"))
			End If
		ElseIf(Player.Items.Contains("quest.train")) Then
			SetAction(actions.Get("take.train"))
		ElseIf(Player.Items.Contains("whistle")) Then
			SetAction(actions.Get("give.whistle"))
		End If
	
		Super.OnInteract()
	End Method
	
	Method OnAction:Void(action:Action)
		Select action
			Case takeTrain
				FlxG.Play(ChapterAssets.SOUND_BOY_CRY)
				Player.Items.Remove("quest.train")
			
				Player.Items.Insert("train")
				Self.train.Kill()
				Kill()
				
			Case giveWhistle
				Player.Items.Remove("whistle")
				
				If (Player.Items.Contains("train.broken")) Then
					Player.Items.Remove("train.broken")
					train.LoadGraphic(ChapterAssets.SPRITE_TRAIN_FIXED)
					AddWhistle()
					
					Player.Items.Insert("train")
					Game.Chapter.state.RemoveInteractable(Self, True)
					
					FlxG.Play(ChapterAssets.SOUND_WHISTLE)
				Else
					fadeTween.Tween(1, 0, 3, Ease.SineOut)
					Game.Chapter.state.Block()
					
					FlxG.Play(ChapterAssets.SOUND_WHISTLE)
				End If
				
			Case exchangeTrain
				Game.Dialog.Push("The Boy: Bring me the whistle and we'll have a deal",[Action(New LeaveAction())])
				Player.Items.Insert("quest.find.whistle")
				
				New ScriptDeadGirl(Game.Chapter.state.outdoors)
				
		End Select
	End Method
	
	Method OnTweenComplete:Void(tween:FlxTween)
		Select tween
			Case fadeTween
				Kill()
				Game.Chapter.state.Unblock()
				
				Local s:FlxSound = FlxG.Play(ChapterAssets.SOUND_WHISTLE)
				s._SetTransform(s.Volume, -1)
				
				New ScriptGirlDisapear(Game.Chapter.state.playground)
				
		End Select
	End Method
	
	Method Kill:Void()
		Super.Kill()
		
		If (whistle) Then
			whistle.Kill()
		End If
	End Method
	
	Method AddWhistle:Void()
		whistle = New FlxSprite(x + 63, y + 27, ChapterAssets.SPRITE_WHISTLE_ON)
	End Method

End Class

