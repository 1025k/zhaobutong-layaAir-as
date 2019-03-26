package test.context.game {
	import test.common.Config;
    import test.common.commands.CallbackChancePlusCommand;
    import test.common.signals.ShareCallback;
    import test.context.game.commands.ChanceCommand;
    import test.context.game.commands.CheckHitCommand;
    import test.context.game.commands.RestGameCommand;
    import test.context.game.models.Checkpoint;
    import test.context.game.models.Game;
    import test.context.game.signals.Collided;
    import test.context.game.signals.ResetGame;
    import test.context.game.signals.UseChance;
    import test.context.game.view.FinishView;
    import test.context.game.view.FinishViewMediator;
    import test.context.game.view.GameView;
    import test.context.game.view.GameViewMediator;
    import test.context.game.view.StoryView;
    import test.context.game.view.StoryViewMediator;
	
	/**
     * ...
     * @author hoywe
     */
    public class GameConfig extends Config {
        
        override public function configure():void {
            
            // signals
            injector.mapClass(Collided);
            
            // models
            injector.mapValue(new Game());
            injector.mapValue(new Checkpoint());
            
            // mediators
            mediatorMap.map(GameView).toMediator(GameViewMediator);
            mediatorMap.map(StoryView).toMediator(StoryViewMediator);
            mediatorMap.map(FinishView).toMediator(FinishViewMediator);
            
            // commands
            layaCommandMap.map(UseChance).toCommand(ChanceCommand);
            layaCommandMap.map(Collided).toCommand(CheckHitCommand);
            layaCommandMap.map(ResetGame).toCommand(RestGameCommand);
            
            // 分享后回调
            layaCommandMap.map(ShareCallback).toCommand(CallbackChancePlusCommand);
            
        }
    }
}
