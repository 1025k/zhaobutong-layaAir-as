package test.context.game.view {
    import laya.display.Text;
    import laya.ui.Box;
    import laya.ui.Image;
    import test.common.GameData;
	import test.common.display.BaseView;
    import ui.test.FinishUI;
	
	/**
     * ...
     * @author hoywe
     */
    public class FinishView extends BaseView {
        
        public function FinishView() {
			
            ui = new FinishUI();
            addChild(ui);
        }
        
        override public function layoutSubviews():void {
            
            ui.centerX = ui.centerY = 0;
            var box:Box = get('box_center');
            var img:Image = get('img_finish_title') as Image;
            box.scaleX = box.scaleY = img.scaleX = img.scaleY = GameData.scale;
            box.centerX = box.centerY = 0;
            img.centerX = 0;
            img.y = box.y;
        }
        
        public function setViewPage($bool:Boolean):void {
            
            var img:Image;
            img = get('img_finish_title') as Image;
            if ($bool) {
                img.skin = 'test/title-com.png';
            }
            else {
                img.skin = 'test/title-over.png';
            }
            get('box_center/tex_totalScore').font = GameData.BmpFntName;
        }
        
        public function setTotalScore(val:Number) {
            
            var timeTex:Text = get('box_center/tex_totalScore') as Text;
            timeTex.text = "Score: " + String(val);
        }
    }

}
