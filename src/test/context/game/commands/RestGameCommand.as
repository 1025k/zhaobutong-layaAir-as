package test.context.game.commands {
    import org.mvc.extensions.commandCenter.api.ICommand;
    import org.mvc.framework.impl.Injector;
    import test.context.game.models.Checkpoint;
    import test.context.game.models.Game;
	
	/**
     * ...
     * @author hoywe
     */
    public class RestGameCommand implements ICommand {
        
        public function execute(...args):void {
            
            var game:Game = Injector.instance.getInstance(Game) as Game;
            var checkpoint:Checkpoint = Injector.instance.getInstance(Checkpoint) as Checkpoint;
            var resetAll:Boolean = args[0];
            if (resetAll) {
                game.replay();
            }
            else {
                game.reset();
            }
            checkpoint.reset();
        }
    }

}
