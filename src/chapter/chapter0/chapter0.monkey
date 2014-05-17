Strict

Import src.chapter
Import src.assets

Private

Import chapterassets
Import key
Import door
Import credits

Public

Class Chapter0 Extends Chapter

	Method New(state:PlayState)
		Super.New(state)
		
		ChapterAssets.Init()
		ChapterAssets.Load()
	End Method
	
	Method Create:Void()
		Super.Create()

		Game.Creak = FlxG.Play(Assets.SOUND_CREAK,, True)
		
		state.park.AddItem(New Key(490, 353))
		state.park.AddItem(New Door(560, 181))
		state.park.AddItem(New CreditsButton(315, 65 + Game.SCREEN_PADDING))
		
		state.SetSubState(state.park)
	End Method
	
	Method Activate:Void()
		state.park.background.Image = Assets.SCENE_TITLE
		state.RemoveInteractable(state.park.triggerGoToOutdoors)
	End Method

End Class
