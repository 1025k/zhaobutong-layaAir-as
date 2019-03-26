package test.context.game.commands {
    import laya.media.SoundManager;
	import org.mvc.extensions.commandCenter.api.ICommand;
    import org.mvc.framework.impl.Injector;
    import test.common.GameData;
    import test.common.signals.ChangeV;
    import test.context.game.models.Game;
	
	/**
     * ...
     * @author hoywe
     */
    public class CheckHitCommand implements ICommand {
        
        
        /* INTERFACE org.mvc.extensions.commandCenter.api.ICommand */
        
        public function execute(...args):void {
            
            var game:Game = Injector.instance.getInstance(Game) as Game;
            
            var isok:Boolean = args[0];
            if (isok) {
                SoundManager.playSound(GameData.SoundPath + 'right.mp3');
                game.sorce += 100;
                game.resultIndex += 1;
                if (game.resultIndex == GameData.ResultNum) {
                    game.stop();
                    if (game.levelIndex == GameData.Level) {
                    //if (game.levelIndex == 2) {
                        game.isfinish = true;
                    }
                    else {
                        game.levelIndex++;
                    }
                }
            }
            else {
                SoundManager.playSound(GameData.SoundPath + 'wrong.mp3');
                if (game.sorce - 20 <= 0) {
                    game.sorce = 0;
                }
                else {
                    game.sorce -= 20;
                }
                game.missNum --;
            }
        }
        
    }

}
