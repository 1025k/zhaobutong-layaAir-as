package test.context.game.view {
    
    import laya.display.Sprite;
    import laya.display.Text;
    import laya.ui.Box;
    import laya.ui.Button;
    import laya.ui.Image;
    import laya.ui.View;
    import laya.utils.Browser;
    import laya.utils.Ease;
    import laya.utils.Handler;
    import laya.utils.Tween;
    import test.common.GameData;
	import test.common.display.BaseView;
    import ui.test.GameUI;
    import ui.test.PopUI;
	
	/**
     * ...
     * @author hoywe
     */
    public class GameView extends BaseView {
        
        private var pop:View;
        private var graphContainer:Sprite;
        
        public function GameView() {
			
            ui = new GameUI();
            ui.addChild(graphContainer = new Sprite());
            pop = new PopUI();
            setShareVisible();
            addChild(ui);
            layoutSubviews();
        }
        
        override public function layoutSubviews():void {
            
            ui.scaleX = ui.scaleY = GameData.scale;
            ui.centerX = ui.centerY = 0;
            if (pop && pop.parent) {
                var box:Box = pop.getChildByName("box_center");
                pop.centerX = pop.centerY = box.centerX = box.centerY = 0;
                box.scaleX = box.scaleY = GameData.scale;
            }
        }
        
        public function setViewPage($val:int):void {
            // 456,500  70 104
            get('tex_time').font = GameData.BmpFntName;
            get('tex_sorce').font = GameData.BmpFntName;
            get('tex_chance').font = GameData.BmpFntName;
            
            var img:Image;
            img = get('img_page0') as Image;
            img.mouseEnabled = true;
            img.skin = GameData.LevelPath + $val + '.png';
            img.size(490, 540);
            img = get('img_page1') as Image;
            img.mouseEnabled = true;
            img.skin = GameData.LevelPath + $val + '-.png';
            img.size(490, 540);
            
            var box:Box = get('box_hp') as Box;
            
            for (var i:int = 1; i <= GameData.ResultNum; i++) {
                box.getChildByName('img_hp_' + i).visible = false;
            }
        }
        
        private function setShareVisible():void {
            
            if (GameData.inApp) {
                get("btn_share").visible = get("txt_share").visible = true;
            }
            else {
                get("btn_share").visible = get("txt_share").visible = false;
            }
        }
        
        public function destroy():void {
            
            if (graphContainer) {
                graphContainer.destroy();
                graphContainer.removeSelf();
                graphContainer = null;
            }
        }
        
        public function showPause():void {
            if (pop && pop.parent) {
                return;
            }
            addChild(pop);
            layoutSubviews();
        }
        
        public function hidePause():void {
            
            if (pop && pop.parent) {
                pop.removeSelf();
            }
        }
        
        public function setSorce(val:Number):void {
            var timeTex:Text = get('tex_sorce') as Text;
            timeTex.text = String(val);
        }
        
        public function setChance(val:Number):void {
            var timeTex:Text = get('tex_chance') as Text;
            timeTex.text = String(val);
        }
        
        public function setTime(val:Number):void {
            
            var timeTex:Text = get('tex_time') as Text;
            timeTex.text = String(val);
        }
        
        public function setResult(val:int):void {
            if (val != 0) {
                get('box_hp/img_hp_' + val).visible = true;
            }
        }
        
        public function setGraphics($rect:Object):void {
            
            var temp:Sprite = graphContainer.getChildByName('chanceAni') as Sprite;
            if (temp) {
                Tween.clearTween(temp);
                temp.removeSelf();
                temp = null;
            }
            var newW:Number = $rect.w;
            var newH:Number = $rect.h;
            
            //var r:Number = Math.max(newW, newH);
            //var ratioX:Number = newW / r;
            //var ratioY:Number = newH / r;
            var quan1:Sprite = new Sprite();
            quan1.scaleX = quan1.scaleY = 0.2;
            //quan.scaleX = ratioX;
            //quan.scaleY = ratioY;
            graphContainer.addChild(quan1);
            //quan.loadImage('test/quan.png', -30, -30, 60, 60);
            quan1.loadImage('test/quan.png', -(newW >> 1), -(newH >> 1), newW, newH);
            quan1.pos(get('img_page0').x + $rect.x + (newW >> 1), get('img_page0').y + $rect.y + (newH >> 1));
            Tween.to(quan1, { scaleX: 1.2, scaleY: 1.2 }, 200, Ease.expoOut);
            
            var quan2:Sprite = new Sprite();
            quan2.scaleX = quan2.scaleY = 0.2;
            graphContainer.addChild(quan2);
            quan2.loadImage('test/quan.png', -(newW >> 1), -(newH >> 1), newW, newH);
            quan2.pos(get('img_page1').x + $rect.x + (newW >> 1), get('img_page1').y + $rect.y + (newH >> 1));
            Tween.to(quan2, { scaleX: 1.2, scaleY: 1.2 }, 200, Ease.expoOut);
        }
        
        public function setChanceAni($rect:Object):void {
            
            var newW:Number = $rect.w;
            var newH:Number = $rect.h;
            
            var sp:Sprite = new Sprite();
            sp.name = 'chanceAni';
            graphContainer.addChild(sp);
            sp.loadImage('test/tishiq.png', -118, -118);
            sp.pos(get('img_page0').x + $rect.x + (newW >> 1), get('img_page0').y + $rect.y + (newH >> 1));
            sp.scaleX = sp.scaleY = 0.5;
            setSorceAni(sp, 0, 0, false );
            Tween.to(sp, { alpha: 0 }, 1000, Ease.expoOut, Handler.create(this, onComplete, [sp]), 1500);
        }
        
        public function setSorceAni($target:Sprite, $x:Number, $y:Number, $bool:Boolean):void {
            
            var sp:Sprite = new Sprite();
            sp.loadImage('test/score_' + ($bool ? 2 : 1) + '.png', -43, -15);
            graphContainer.addChild(sp);
            if ($target != null) {
                sp.pos($target.x + $x, $target.y + $y);
            }
            else {
                sp.pos($x, $y);
            }
            Tween.to(sp, { alpha: 0, y:sp.y - 80  }, 1500, Ease.expoOut, Handler.create(this, onComplete, [sp]));
        }
        
        private function onComplete($arg:Sprite):void {
            
            var sp:Sprite = $arg as Sprite;
            sp.removeSelf();
        }
    }
}
