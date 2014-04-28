Strict

Import src.chapter
Import src.assets

Private

Import chapterassets

Public

Class Chapter0 Extends Chapter

	Method New(state:PlayState)
		Super.New(state)
'		
'		ChapterAssets.Init()
'		ChapterAssets.Load()
	End Method
	
	Method Create:Void()
		Super.Create()
		state.park.background.Image = Assets.SCENE_TITLE
		state.SetSubState(state.park)
	End Method

End Class
