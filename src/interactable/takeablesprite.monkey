Strict

Import actionablesprite
Import src.interactable.action.take


Class TakeableSprite Extends ActionableSprite Implements ActionListener
	
	Method New(x:Float = 0, y:Float = 0, simpleGraphic:String = "")
		Super.New(x, y, simpleGraphic)
		_action =[Action(New TakeAction(Self))]
	End Method
	
	Method Name:Void(name:String) Property
		SetAction(name, _action)
	End Method
	
	Method OnAction:Void(action:Action)
		Kill()
	End Method
	
	Private
	
	Field _action:Action[]

End Class