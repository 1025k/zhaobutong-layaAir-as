/**Created by the LayaAirIDE,do not modify.*/
package ui.test {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class GameUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1136,"height":640},"child":[{"type":"Image","props":{"y":16,"x":27,"width":338,"skin":"test/hp_bar.png","height":64}},{"type":"Button","props":{"y":428,"x":1043,"width":62,"stateNum":1,"skin":"test/btn_chance.png","name":"btn_chance","height":62}},{"type":"Image","props":{"y":16,"x":393,"width":436,"skin":"test/sorce_bar.png","height":64}},{"type":"Image","props":{"y":16,"x":859,"width":157,"skin":"test/time.png","height":64}},{"type":"Button","props":{"y":329,"x":1043,"width":62,"stateNum":1,"skin":"test/btn_share1.png","name":"btn_share","height":62}},{"type":"Button","props":{"y":527,"x":1043,"width":62,"stateNum":1,"skin":"test/btn_pause1.png","name":"btn_over","height":62}},{"type":"Box","props":{"y":22,"x":42},"child":[{"type":"Image","props":{"skin":"test/hp_back.png"}},{"type":"Image","props":{"x":60,"skin":"test/hp_back.png"}},{"type":"Image","props":{"x":121,"skin":"test/hp_back.png"}},{"type":"Image","props":{"x":182,"skin":"test/hp_back.png"}},{"type":"Image","props":{"x":245,"skin":"test/hp_back.png"}}]},{"type":"Box","props":{"y":23,"x":42,"name":"box_hp"},"child":[{"type":"Image","props":{"skin":"test/hp.png","name":"img_hp_1"}},{"type":"Image","props":{"x":60,"skin":"test/hp.png","name":"img_hp_2"}},{"type":"Image","props":{"x":121,"skin":"test/hp.png","name":"img_hp_3"}},{"type":"Image","props":{"x":182,"skin":"test/hp.png","name":"img_hp_4"}},{"type":"Image","props":{"x":246,"skin":"test/hp.png","name":"img_hp_5"}}]},{"type":"Text","props":{"y":24,"x":946,"width":50,"valign":"middle","text":"00","name":"tex_time","height":50,"fontSize":20,"align":"center"}},{"type":"Text","props":{"y":24,"x":702,"width":78,"valign":"middle","text":"0000","name":"tex_sorce","height":50,"fontSize":20,"align":"center"}},{"type":"Text","props":{"y":24,"x":512,"width":50,"valign":"middle","text":"0","name":"tex_chance","height":50,"fontSize":20,"align":"center"}},{"type":"Image","props":{"y":90,"x":30,"name":"img_page0"}},{"type":"Image","props":{"y":90,"x":530,"name":"img_page1"}},{"type":"Label","props":{"y":491,"x":1048,"text":"提示","fontSize":26,"color":"#000000"}},{"type":"Label","props":{"y":393,"x":1048,"text":"分享","name":"txt_share","fontSize":26,"color":"#000000"}},{"type":"Label","props":{"y":590,"x":1048,"text":"暂停","fontSize":26,"color":"#000000"}},{"type":"Button","props":{"y":12,"x":1041,"width":62,"stateNum":1,"skin":"test/btn_logo.png","height":70}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}