package test.common.commands {
    import laya.display.Sprite;
	import org.mvc.extensions.commandCenter.api.ICommand;
    import org.mvc.framework.impl.Injector;
    import test.common.SceneRoot;
    import test.context.game.view.FinishView;
    import test.context.game.view.GameView;
    import test.context.game.view.StoryView;
    import test.context.title.view.TitleView;
	
	/**
     * ...
     * @author hoywe
     */
    public class ChangeViewCommand implements ICommand {
        
        
        public function execute(...$args):void {
            
            var view:Sprite;
            
            switch ($args[0]) {
                
                case "title":
                    view = new TitleView();
                    break;
                case "story":
                    view = new StoryView();
                    break;
                case "game":
                    view = new GameView();
                    break;
                case "finish":
                    view = new FinishView();
                    break;
            }
            
            Injector.instance.getInstance(SceneRoot).changeView(view);
        }
        
    }

}
