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
		
		actions.Set("default", New SpriteAction(who + ": " + hasTrain,[Action(New LeaveAction())]))
		actions.Set("take.train", New SpriteAction(who + ": " + hasTrain,[Action(New LeaveAction()), takeTrain]))
		actions.Set("question.whistle", New SpriteAction(who + ": " + questionWhistle,[Action(New LeaveAction())]))
		actions.Set("question.whistle", New SpriteAction(who + ": " + questionWhistle,[Action(New LeaveAction()), giveWhistle]))
		
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
		If (Player.Items.Contains("quest.train")) Then
			SetAction(actions.Get("take.train"))
		End If
	
		Super.OnInteract()
	End Method
	
	Method OnAction:Void(action:Action)
		Select action
			Case takeTrain
				Player.Items.Remove("quest.train")
			
				Player.Items.Insert("train")
				Self.train.Kill()
				Kill()
				
			Case giveWhistle
				Player.Items.Remove("whistle")
				fadeTween.Tween(1, 0, 3, Ease.SineOut)
				
				Game.Chapter.state.Block()
		End Select
	End Method
	
	Method OnTweenComplete:Void(tween:FlxTween)
		Select tween
			Case fadeTween
				Kill()
				Game.Chapter.state.Unblock()
				
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

