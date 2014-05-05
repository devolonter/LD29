Strict

Import flixel

Import dialog

Import scene.park
Import scene.outdoors
Import scene.playground

Import interactable.gotoscene
Import interactable.action.leave

Import chapter.chapter0
Import chapter.chapter1

Class PlayState Extends FlxState

	Field park:Park
	
	Field outdoors:Outdoors
	
	Field playground:Playground
	
	Field interactable:FlxGroup
	
	Field pointer:FlxPoint
	
	Method New()
		persistentUpdate = True
	End Method
	
	Method Create:Void()
		interactable = New FlxGroup()
		
		pointer = New FlxPoint()
	
		park = New Park(Self)
		outdoors = New Outdoors(Self)
		playground = New Playground(Self)

		Game.Dialog = New Dialog()
		Add(Game.Dialog)
	
		Game.Chapter = New Chapter0(Self)
		Game.Chapter.Create()
	End Method
	
	Method Update:Void()
		Super.Update()
		
		If (Game.Dialog.visible Or _blocked) Then
			If ( Not _blocked) Then
				If (FlxG.Mouse.JustPressed() And Not Game.Dialog.actions[1].visible) Then
					Game.Dialog.Pop()
				End If
			End If
			
			Return
		End If
		
		FlxG.Mouse.GetScreenPosition(Null, pointer)
		
		Local interact:Interactable

		For Local b:FlxBasic = EachIn interactable
			interact = Interactable(b)
			If ( Not interact.Enabled()) Continue
		
			If (FlxObject(b).OverlapsPoint(pointer)) Then
				If (interact.IsActive()) Then
					If (FlxG.Mouse.JustPressed()) Then
						interact.OnInteract()
						Return
					End If
				Else
					interact.OnFocus()
				End If
				
			ElseIf(interact.IsActive()) Then
				interact.OnBlur()
			End If
		Next
	End Method
	
	Method DoDraw:Void()
		If (GetSubState() = Null) Then
			Draw()
			Return
		End If

		GetSubState().Draw()
		Draw()
	End Method
	
	Method AddInteractable:Void(interactable:Interactable)
		Local b:FlxBasic = FlxBasic(interactable)
	
		If (b And FlxObject(b)) Then
			interactable.Flush()
			Self.interactable.Add(b)
		End If
	End Method
	
	Method RemoveInteractable:Void(interactable:Interactable, disable:Bool = False)
		If (disable) interactable.Disable()
		Self.interactable.Remove(FlxBasic(interactable))
	End Method
	
	Method ClearInteractable:Void()
		interactable.Clear()
	End Method
	
	Method Block:Void()
		_blocked = True
	End Method
	
	Method Unblock:Void()
		_blocked = False
	End Method
	
	Method Reset:Void()
		#Rem
		ClearInteractable()
		park.items.Clear()
		outdoors.items.Clear()
		playground.items.Clear()
		#End
		
		Game.Creak.Kill()
		FlxG.Music.Stop()
		
		Player.Items.Clear()
		FlxG.SwitchState(New PlayState())
	End Method
	
	Private
	
	Field _blocked:Bool

End Class