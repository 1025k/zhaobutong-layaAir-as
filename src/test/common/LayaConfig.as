package test.common {
    import laya.events.Event;
    import laya.media.SoundManager;
    import laya.utils.Browser;
    import laya.utils.Log;
    import org.mvc.framework.impl.Signal;
    import test.common.commands.ChangeViewCommand;
    import test.common.commands.StageResizeCommand;
    import test.common.signals.ChangeV;
    import test.common.signals.StageResize;
	/**
     * ...
     * @author hoywe
     */
    public class LayaConfig extends Config {
        
        override public function configure():void {
            
            SoundManager.musicVolume = 0.5;
            SoundManager.soundVolume = 0.8;
            
            layaCommandMap.map(StageResize).toCommand(StageResizeCommand);
            layaCommandMap.map(ChangeV).toCommand(ChangeViewCommand);
            
            injector.getInstance(SceneRoot).init(mediatorMap);
            Laya.stage.on(Event.RESIZE, this, onResize);
            playbgm();
        }
       
        private function playbgm():void {
            
            SoundManager.playMusic(GameData.SoundPath + 'bgm.mp3');
        }
        
        public function onResize():void {
            
            injector.getInstance(StageResize).dispatch();
        }
    }
}
