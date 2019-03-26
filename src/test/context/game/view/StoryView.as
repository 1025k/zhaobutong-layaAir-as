package test.context.game.view {
    
    import laya.ui.Image;
    import laya.ui.Label;
    import test.common.GameData;
	import test.common.display.BaseView;
    import ui.test.StoryUI;
	
	/**
     * ...
     * @author hoywe
     */
    public class StoryView extends BaseView {
        
        public function StoryView() {
			
            ui = new StoryUI();
            addChild(ui);
        }
        
        public function setViewPage($val:int):void {
            
            var img:Image;
            img = get('image_story_guide') as Image;
            img.skin = GameData.GuidePath + $val + '.png';
            img.size(800, 600);
            img.centerY = 0;
            
            img = get('right_panel/image_story_title') as Image;
            img.skin = "test/t" + $val + ".png";
            
            var tex:Label = get('right_panel/label_story') as Label;
            tex.text = GameData.data['level'][$val - 1]['tex'];
        }
    }
}
