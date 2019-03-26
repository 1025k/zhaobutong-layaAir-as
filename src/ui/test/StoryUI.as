/**Created by the LayaAirIDE,do not modify.*/
package ui.test {
	import laya.ui.*;
	import laya.display.*; 

	public class StoryUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"height":640},"child":[{"type":"Image","props":{"y":20,"x":50,"name":"image_story_guide"}},{"type":"Sprite","props":{"y":27,"x":891,"width":242,"name":"right_panel","height":598},"child":[{"type":"Label","props":{"y":91,"x":9,"wordWrap":true,"width":182,"valign":"top","padding":"10,5,5,10","name":"label_story","leading":12,"height":410,"fontSize":28,"color":"#000000","align":"left"}},{"type":"Image","props":{"y":-0.5,"x":-5,"name":"image_story_title"}},{"type":"Button","props":{"y":510,"x":-2,"width":201,"stateNum":2,"skin":"test/btn_goon.png","name":"btn_goon","height":80}},{"type":"Button","props":{"y":96,"x":20,"width":42,"stateNum":2,"skin":"test/btn_mute.png","name":"btn_play","height":46}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}