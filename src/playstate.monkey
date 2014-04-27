Strict

Import flixel

Import dialog

Import scene.park
Import scene.outdoors
Import scene.playground

Import trigger.gotoscene

Import chapter.chapter1

Class PlayState Extends FlxState

	Field park:Park
	
	Field outdoors:Outdoors
	
	Field playground:Playground
	
	Field dialog:Dialog
	
	Field interactable:FlxGroup
	
	Field pointer:FlxPoint
	
	Method New()
		persistentUpdate = True
	End Method
	
	Method Create:Void()
		interactable = New FlxGroup()
		
		pointer = New FlxPoint()
	
		park = New Park()
		outdoors = New Outdoors()
		playground = New Playground()
		
		dialog = New Dialog()
		Add(dialog)
	
		Game.Chapter = New Chapter1(Self)
		Game.Chapter.Create()
	End Method
	
	Method Update:Void()
		Super.Update()
		
		FlxG.Mouse.GetScreenPosition(Null, pointer)

		For Local b:FlxBasic = EachIn interactable
			If (FlxObject(b).OverlapsPoint(pointer)) Then
			
				If (b.active) Then
					If (FlxG.Mouse.JustPressed()) Then
						Interactable(b).OnInteract()
						Return
					End If
				Else
					Interactable(b).OnFocus()
					b.active = True
				End If
				
			ElseIf(b.active) Then
				Interactable(b).OnBlur()
				b.active = False
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
			b.active = False
			Self.interactable.Add(b)
		End If
	End Method
	
	Method ClearInteractable:Void()
		interactable.Clear()
	End Method

End Class