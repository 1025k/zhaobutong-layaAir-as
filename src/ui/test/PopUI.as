/**Created by the LayaAirIDE,do not modify.*/
package ui.test {
	import laya.ui.*;
	import laya.display.*; 

	public class PopUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"height":640},"child":[{"type":"Sprite","props":{"y":0,"x":0,"alpha":0.7},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":1136,"lineWidth":1,"height":640,"fillColor":"#000000"}}]},{"type":"Box","props":{"y":165,"x":403,"name":"box_center"},"child":[{"type":"Image","props":{"width":329,"skin":"test/popup_back.png","height":310}},{"type":"Button","props":{"y":59,"x":75,"width":179,"stateNum":2,"skin":"test/btn_pause_back.png","name":"btn_backHome","height":84}},{"type":"Button","props":{"y":165,"x":75,"width":179,"stateNum":2,"skin":"test/btn_goon.png","name":"btn_backGame","height":84}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}