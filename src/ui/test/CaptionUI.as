/**Created by the LayaAirIDE,do not modify.*/
package ui.test {
	import laya.ui.*;
	import laya.display.*; 

	public class CaptionUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"height":640},"child":[{"type":"Image","props":{"y":47,"x":269,"width":598,"skin":"test/popup_back.png","height":564}},{"type":"Image","props":{"y":20,"x":380,"width":376,"skin":"test/caption.png","height":104}},{"type":"Button","props":{"y":495,"x":485,"width":165,"stateNum":2,"skin":"test/btn_back.png","name":"btn_backHome","height":68}},{"type":"Label","props":{"y":140,"x":373,"wordWrap":true,"width":389,"valign":"middle","underline":false,"text":"    1.在1分30秒内找出两张图片的不同。\\n    2.允许有5次点错的机会，如果5次都点错了，则游戏结束；\\n    3.点对1次，得100分；点错一次，扣除20分；点一次“提示”，扣除20分。","leading":10,"height":322,"fontSize":26,"color":"#910000","align":"left"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}