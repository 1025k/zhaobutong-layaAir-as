package test.common.commands {
    import org.mvc.extensions.commandCenter.api.ICommand;
    import org.mvc.framework.impl.Injector;
    import test.context.game.models.Game;
	
	/**
     * ...
     * @author hoywe
     */
    public class CallbackChancePlusCommand implements ICommand {
        
        public function execute():void {
            
            var game:Game = Injector.instance.getInstance(Game);
            game.chance ++;
        }
        
    }

}
