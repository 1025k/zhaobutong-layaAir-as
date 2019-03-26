package test.context.game.view {
    import laya.events.Event;
    import laya.media.SoundManager;
	import org.mvc.extensions.laya.impl.LayaMediator;
    import test.common.GameData;
    import test.common.signals.ChangeV;
    import test.context.game.models.Game;
	
	/**
     * ...
     * @author hoywe
     */
    public class StoryViewMediator extends LayaMediator {
        
        private var game:Game;
        
        override public function init():void {
            
            //trace('story mediator init');
            game = injector.getInstance(Game) as Game;
            view.setViewPage(game.levelIndex);
            evtMap.mapListener(view, 'click', this, onViewClicked);
            view.layoutSubviews();
		}
        
        override public function destroy():void {
            
            super.destroy();
        }
        
        private function onViewClicked($evt:Event):void {
            
            if ($evt.target.name == "btn_goon") {
                injector.getInstance(ChangeV).dispatch('game');
                return;
            }
            if ($evt.target.name == "btn_play") {
                SoundManager.stopAllSound();
                SoundManager.playSound(GameData.SoundPath + game.levelIndex + '.mp3');
                return;
            }
        }
        
    }

}
