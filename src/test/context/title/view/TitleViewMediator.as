package test.context.title.view {
    
    import laya.events.Event;
    import laya.media.SoundManager;
    import laya.ui.Button;
    import org.mvc.extensions.laya.impl.LayaMediator;
    import test.common.GameData;
    import test.common.signals.ChangeV;
	
	/**
     * ...
     * @author hoywe
     */
    public class TitleViewMediator extends LayaMediator {
        
        override public function init():void {
            
            evtMap.mapListener(view, 'click', this, onViewClicked);
            view.layoutSubviews();
		}
        
        override public function destroy():void {
            
            super.destroy();
        }
        
        private function onViewClicked($evt:Event):void {
            
            //trace('login clicked');
            var nameArr:Array;
            var clickname:String = $evt.target.name;
            if (-1 != clickname.indexOf('btn_')) {
                nameArr = clickname.split('_');
                clickname = nameArr[1];
                if ('enter' == clickname) {
                    injector.getInstance(ChangeV).dispatch('story');
                    return;
                }
                if ('caption' == clickname) {
                    
                    if (view) {
                        view.loadUI('caption');
                    }
                    return;
                }
                if ('backHome' == clickname) {
                    if (view) {
                        view.loadUI('title');
                    }
                    return;
                }
                if ('backNative' == clickname) {
                    
                    CallH5.callNative('back');
                    return;
                }
                if ('mute' == clickname) {
                    
                    GameData.mute = $evt.target.selected;
                    SoundManager.musicMuted = GameData.mute;
                    return;
                }
            }
            
        }
    }
}
