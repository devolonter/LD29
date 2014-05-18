Strict

Import src.chapter

Private

Import chapterassets
Import boy
Import girl
Import train
Import scripts
Import blood

Public

Class Chapter1 Extends Chapter

	Global Boy:Boy
	
	Global Girl:Girl

	Method New(state:PlayState)
		Super.New(state)
		
		ChapterAssets.Init()
		ChapterAssets.Load()
	End Method
	
	Method Create:Void()
		Super.Create()
		
		Chapter1.Boy = New Boy(100, Game.SCREEN_PADDING + 135, New Train(220, Game.SCREEN_PADDING + 250))
		Chapter1.Girl = New Girl(400, Game.SCREEN_PADDING + 130)
		
		state.playground.AddItem(Chapter1.Boy)
		state.playground.AddItem(Chapter1.Girl)
		
		state.playground.AddItem(Chapter1.Boy.train)
	End Method
	
	Method Activate:Void()
		'note: TODO Remove this check
		If (state.park.background) Then
			state.park.background.Image = Assets.SCENE_PARK
			state.RemoveInteractable(state.park.triggerGoToOutdoors)
		End If
	End Method

End Class
