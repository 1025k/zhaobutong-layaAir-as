package test.context.title.view {
    import laya.ui.Button;
    import laya.utils.Browser;
    import test.common.GameData;
    import test.common.display.BaseView;
    import ui.test.CaptionUI;
	import ui.test.TitleUI;
	
	/**
     * ...
     * @author hoywe
     */
    public class TitleView extends BaseView {
        
        protected var uitype:String = "";        
        public function TitleView()
        {
            uitype = 'title';
            loadUI(uitype);
        }
        
        public function loadUI($uiType:String):void {
            
            if ($uiType != 'title' && $uiType != 'caption') {
                trace("就俩类型，title/caption!! 没别的，是不是TMD传错了");
                return;
            }
            
            this.uitype = $uiType;
            
            if (ui) {
                ui.removeSelf();
                ui = null;
            }
            if ($uiType == 'title') {
                ui = new TitleUI();
                setBackVisible();
                setMuteBtnState(GameData.mute);
            }
            else if ($uiType == 'caption') {
                ui = new CaptionUI();
            }
            
            addChild(ui);
            layoutSubviews();
        }
        
        private function setBackVisible():void {
            
            var button:Button = get("btn_backNative") as Button;
            if (GameData.inApp) {
                button.visible = true;
            }
            else {
                button.visible = false;
            }
        }
        
        public function setMuteBtnState(val:Boolean ):void {
            
            var button:Button = get("btn_mute") as Button;
            button.selected = val;
        }
        
        override public function layoutSubviews():void {
            
            ui.scaleX = ui.scaleY = GameData.scale;
            //if (uitype == 'title') {
                //ui.bottom = 0;
            //}
            //else {
                //ui.centerY = 0;
            //}
            ui.centerX = 0;
            ui.centerY = 0;
        }
    }
}
