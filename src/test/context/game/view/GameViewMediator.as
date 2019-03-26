package test.context.game.view {
    import laya.events.Event;
    import laya.maths.Point;
    import laya.media.SoundManager;
    import laya.utils.Browser;
    import laya.utils.Log;
    import laya.utils.Utils;
	import org.mvc.extensions.laya.impl.LayaMediator;
    import test.common.GameData;
    import test.common.signals.ChangeV;
    import test.context.game.models.Checkpoint;
    import test.context.game.models.Game;
    import test.context.game.signals.Collided;
    import test.context.game.signals.UseChance;
	
	/**
     * ...
     * @author hoywe
     */
    public class GameViewMediator extends LayaMediator {
        
        private var game:Game;
        private var checkpoint:Checkpoint;
        
        override public function init():void {
            
            //trace('game mediator init');
            game = injector.getInstance(Game);
            checkpoint = injector.getInstance(Checkpoint);
            var dataArr:Array = GameData.data['level'][game.levelIndex - 1]['rectangles'];
            checkpoint.coordinate = Utils.copyArray([], dataArr);
            
            evtMap.mapListener(view, 'click', this, onViewClicked);
            evtMap.mapMEvt(game.timeChanged, this, onTimeChanged);
            evtMap.mapMEvt(game.chanceChanged, this, onChanceChanged);
            evtMap.mapMEvt(game.resultChanged, this, onResultChanged);
            evtMap.mapMEvt(game.sorceChanged, this, onScoreChanged);
            evtMap.mapMEvt(game.levelChanged, this, onLevelChanged);
            evtMap.mapMEvt(game.overOrComplete, this, onGameOverOrComplete);
            evtMap.mapMEvt(checkpoint.hit_ok, this, onHitOK);
            evtMap.mapMEvt(checkpoint.hit_miss, this, onHitMiss);
            
            Laya.stage.on('visibilitychange', this, onHidden);
            
            view.setViewPage(game.levelIndex);
            view.setChance(game.chance);
            view.setSorce(game.sorce);
            view.layoutSubviews();
            game.reset();
            game.start();
		}
        
        private function onHidden():void {
            
            if (!Laya.stage.isVisibility) {
                view.showPause();
                game.stop();
            }
        }
        
        private function onGameOverOrComplete():void {
            
            Laya.timer.once(1000, this, onChangeFinishView);
        }
        
        private function onChangeFinishView():void {
            
            injector.getInstance(ChangeV).dispatch('finish');
        }
        
        private function onLevelChanged():void {
            
            Laya.timer.once(1000, this, onNext);
        }
        
        private function onNext():void {
            injector.getInstance(ChangeV).dispatch('story');
        }
        
        private function onScoreChanged():void {
            view.setSorce(game.sorce);
        }
        
        private function onResultChanged():void {
            view.setResult(game.resultIndex);
        }
        
        private function onHitMiss():void {
            view.setSorceAni(checkpoint.hitTarget, checkpoint.hitX, checkpoint.hitY, false);
            injector.getInstance(Collided).dispatch(false);
        }
        
        private function onHitOK():void {
            view.setSorceAni(checkpoint.hitTarget, checkpoint.hitX, checkpoint.hitY, true);
            view.setGraphics(checkpoint.showRect);
            injector.getInstance(Collided).dispatch(true);
        }
        
        private function onChanceChanged():void {
            
            view.setChance(game.chance);
        }
        
        private function onTimeChanged():void {
            
            view.setTime(game.counter);
        }
        
        override public function destroy():void {
            
            view.destroy();
            super.destroy();
        }
        
        private function onViewClicked($evt:Event):void {
            
            var cname:String = $evt.target.name;
            //trace($evt.target);
            if (cname.indexOf('img_') != -1) {
                checkpoint.hitTarget = $evt.target;
                checkpoint.addHitAndCheck($evt.target.mouseX, $evt.target.mouseY);
            }
            
            if (cname == "btn_over") {
                game.stop();
                view.showPause();
                return;
            }
            
            if (cname == "btn_share") {
                game.stop();
                view.showPause();
                CallH5.callNative('share');
                return;
            }
            
            if (cname == "btn_chance") {
                if (game.chance == 0) return;
                view.setChanceAni(checkpoint.getHitObject());
                injector.getInstance(UseChance).dispatch();
            }
            
            if (cname == "btn_backHome") {
                injector.getInstance(ChangeV).dispatch('finish');
                return;
            }
            
            if (cname == "btn_backGame") {
                view.hidePause();
                game.start();
                return;
            }
        }
        
    }

}
