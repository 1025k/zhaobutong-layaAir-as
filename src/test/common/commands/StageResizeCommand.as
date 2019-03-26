package test.common.commands {
	import org.mvc.extensions.commandCenter.api.ICommand;
    import org.mvc.framework.impl.Injector;
    import test.common.GameData;
    import test.common.SceneRoot;
	
	/**
     * ...
     * @author hoywe
     */
    public class StageResizeCommand implements ICommand {
        
        /* INTERFACE org.mvc.extensions.commandCenter.api.ICommand */
        
        public function execute():void {
            
            Injector.instance.getInstance(SceneRoot).resize(GameData.scale);
        }
        
    }

}
