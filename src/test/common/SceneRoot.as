package test.common {
    
    import laya.media.SoundManager;
    import laya.ui.Image;
    import laya.ui.View;
    import org.mvc.extensions.mediatorMap.api.IMediatorMap;
    import org.mvc.framework.impl.Injector;
    import laya.display.Sprite;
	/**
     * ...
     * @author hoywe
     */
    public class SceneRoot {
        
        private var _mediatorMap:IMediatorMap;
        
        private var _scene:Sprite;
        
        private var _view:Sprite;
        
        private var _imgBG:Image;
        
        public function get view():View {
            return _view;
        }
       
        public function get scene():View {
            return _scene;
        }
        
        public function init(mediatorMap:IMediatorMap):void {
            
            _mediatorMap = mediatorMap;
            _imgBG = new Image(GameData.ResPath + 'bg.png');
            _scene = new Sprite();
            _scene.addChild(_imgBG);
            Laya.stage.addChild(_scene);
            
        }
        
        public function resize($scale:Number):void {
            
            if (_imgBG) {
                _imgBG.width = Laya.stage.width;
                _imgBG.height = Laya.stage.height;
            }
            
            if (view) {
                view.width = Laya.stage.width;
                view.height = Laya.stage.height;
                Laya.timer.once(1, view, view.layoutSubviews);
            }
        }
        
        public function changeView(view:View):void {
            
            destroyCurrentView();
            if(_mediatorMap) {
                _mediatorMap.mediate(view);
            }
            _scene.addChild(view);
            _view = view;
            resize();
        }
        
        private function destroyCurrentView():void {
            
            SoundManager.stopAllSound();
            
            if (view) {
                if (_mediatorMap) {
                    _mediatorMap.unmediate(view);
                }
                view.destroy();
                view.removeSelf();
               //_scene.removeChild(view);
               view = null;
            }
        }
        
    }

}
