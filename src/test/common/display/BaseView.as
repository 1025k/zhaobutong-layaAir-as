package test.common.display {
    
    import laya.display.Node;
	import laya.display.Sprite;
    import laya.ui.View;
    import test.common.GameData;
    import test.utils.StringUtils;
	
	/**
     * ...
     * @author hoywe
     */
    public class BaseView extends Sprite {
        
        private var _ui:View;
        
        public function get ui():View {
            return _ui;
        }
        
        public function set ui(value:View):void {
            _ui = value;
        }
        
        public function BaseView() {
            
        }
        
        public function get($path:String):Node {
            
			if (ui && !StringUtils.isNullOrEmpty($path)) {
                
				var arr:Array = $path.split("/");
				var node:Node = ui;
                var i:int = 0;
				for (i; i < arr.length; i++) {
					node = node.getChildByName(arr[i]);
					if (!node) {
						trace("can not find child: " + arr[i]);
						break;
					}
				}
				return node;
			}
			return null;
		}
        
        public function layoutSubviews():void {
            
            if (ui) {
                ui.scaleX = ui.scaleY = GameData.scale;
                ui.centerX = ui.centerY = 0;
            }
        }
    }

}
