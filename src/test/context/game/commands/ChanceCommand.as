package test.context.game.commands {
	import org.mvc.extensions.commandCenter.api.ICommand;
    import org.mvc.framework.impl.Injector;
    import test.context.game.models.Game;
	
	/**
     * ...
     * @author hoywe
     */
    public class ChanceCommand implements ICommand {
        
        
        /* INTERFACE org.mvc.extensions.commandCenter.api.ICommand */
        
        public function execute():void {
            
            var game:Game = Injector.instance.getInstance(Game) as Game;
            if (game.chance == 0) return;
            game.chance -= 1;
            if (game.sorce - 20 <= 0) {
                game.sorce = 0;
            }
            else {
                game.sorce -= 20;
            }
        }
        
    }

}
