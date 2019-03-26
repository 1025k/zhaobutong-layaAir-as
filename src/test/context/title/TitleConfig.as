package test.context.title {
    
    import test.common.Config;
    import test.common.signals.ChangeV;
    import test.context.title.view.TitleView;
    import test.context.title.view.TitleViewMediator;
	/**
     * ...
     * @author hoywe
     */
    public class TitleConfig extends Config {
        
        override public function configure():void {
            
            mediatorMap.map(TitleView).toMediator(TitleViewMediator);
            injector.getInstance(ChangeV).dispatch('title');
        }
    }

}
