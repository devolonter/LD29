Strict

Import actionablesprite
Import src.interactable.action.take


Class TakeableSprite Extends ActionableSprite Implements ActionListener
	
	Method New(x:Float = 0, y:Float = 0, simpleGraphic:String = "")
		Super.New(x, y, simpleGraphic)
		
		_action = New SpriteAction()
		_action.actions =[Action(New TakeAction(Self))]
		
		SetAction(_action)
	End Method
	
	Method Name:Void(name:String) Property
		_action.message = name
	End Method
	
	Method OnAction:Void(action:Action)
		Kill()
	End Method
	
	Private
	
	Field _action:SpriteAction

End Class