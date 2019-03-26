/**Created by the LayaAirIDE,do not modify.*/
package ui.test {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class FinishUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"name":"box_center","height":640},"child":[{"type":"Sprite","props":{"y":0,"x":0,"alpha":0.7},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":1136,"lineWidth":1,"height":640,"fillColor":"#000000"}}]},{"type":"Box","props":{"y":125.5,"x":339,"name":"box_center"},"child":[{"type":"Image","props":{"y":-0.5,"width":458,"skin":"test/popup_back.png","height":432}},{"type":"Button","props":{"y":320,"x":228,"width":146,"stateNum":2,"skin":"test/btn_replay.png","name":"btn_replay","height":61}},{"type":"Button","props":{"y":320,"x":79,"width":146,"stateNum":2,"skin":"test/btn_back.png","name":"btn_backHome","height":61}},{"type":"Text","props":{"y":182,"x":186,"width":86,"valign":"middle","text":"0000","name":"tex_totalScore","height":55,"fontSize":20,"align":"center"}}]},{"type":"Image","props":{"y":108,"x":542,"name":"img_finish_title"}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}