package test.context.game.view {
    import laya.events.Event;
	import org.mvc.extensions.laya.impl.LayaMediator;
    import test.common.signals.ChangeV;
    import test.context.game.models.Game;
    import test.context.game.signals.ResetGame;
	
	/**
     * ...
     * @author hoywe
     */
    public class FinishViewMediator extends LayaMediator {
        
        private var game:Game;
        
        override public function init():void {
            
            //trace('finish mediator init');
            game = injector.getInstance(Game) as Game;
            view.setViewPage(game.isfinish);
            view.setTotalScore(game.sorce);
            evtMap.mapListener(view, 'click', this, onViewClicked);
            view.layoutSubviews();
        }
        
        override public function destroy():void {
            
            super.destroy();
        }
        
        private function onViewClicked($evt:Event):void {
            
            if ($evt.target.name == "btn_replay") {
                injector.getInstance(ChangeV).dispatch(game.isfinish ? 'title' : 'story');
                injector.getInstance(ResetGame).dispatch(game.isfinish);
                return;
            }
            
            if ($evt.target.name == "btn_backHome") {
                injector.getInstance(ChangeV).dispatch('title');
                injector.getInstance(ResetGame).dispatch(true);
                return;
            }
        }
        
    }

}
