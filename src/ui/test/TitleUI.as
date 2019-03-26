/**Created by the LayaAirIDE,do not modify.*/
package ui.test {
	import laya.ui.*;
	import laya.display.*; 

	public class TitleUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"height":640},"child":[{"type":"Button","props":{"y":39,"x":999,"width":74,"toggle":true,"stateNum":2,"skin":"test/btn_mute.png","name":"btn_mute","height":74}},{"type":"Image","props":{"y":333,"x":0,"width":378,"skin":"test/logo2.png","height":307}},{"type":"Image","props":{"y":3,"x":222,"width":692,"skin":"test/title.png","height":365}},{"type":"Button","props":{"y":480,"x":638,"width":216,"stateNum":2,"skin":"test/btn_start.png","name":"btn_enter","height":89}},{"type":"Button","props":{"y":480,"x":401,"width":216,"stateNum":2,"skin":"test/btn_caption.png","name":"btn_caption","height":89}},{"type":"Button","props":{"y":34,"x":47,"skin":"test/btn_BackButton.png","name":"btn_backNative","labelSize":30,"labelColors":"8F3F3D","labelAlign":"center"}},{"type":"Button","props":{"y":499,"x":1006,"width":71,"stateNum":1,"skin":"test/btn_logo.png","height":80}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}