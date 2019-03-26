package test.context.game.models {
    
    import laya.display.Sprite;
	import org.mvc.framework.impl.Model;
	
	/**
     * ...
     * @author hoywe
     */
    public class Checkpoint extends Model {
        
        public var hit_ok:String = "hit_ok";
        public var hit_miss:String = "hit_miss";
        
        private var _hitTarget:Sprite;
        
        public function get hitTarget():Sprite {
            return _hitTarget;
        }
        
        public function set hitTarget(value:Sprite):void {
            _hitTarget = value;
        }
        
        private var _hitX:Number;
        
        public function get hitX():Number {
            return _hitX;
        }
        private var _hitY:Number;
        
        public function get hitY():Number {
            return _hitY;
        }
        
        public var showRect:Object;
        
        private var _coordinate:Array;
        
        public function get coordinate():Array {
            return _coordinate;
        }
        
        public function set coordinate(value:Array):void {
            _coordinate = value;
        }
        
        public function addHitAndCheck($x:Number, $y:Number):void {
            
            _hitX = $x;
            _hitY = $y;
            hitCheck() ? dispatch(hit_ok) : dispatch(hit_miss);
        }
        
        public function getHitObject():Object {
            
            var length:int = coordinate.length;
            if (length == 0) return null;
            var obj:Object = coordinate[0];
            return obj;
        }
        
        public function hitCheck():Boolean {
            
            if (!coordinate) return false;
            
            var dx:Number;
            var dy:Number;
            var dist:Number;
            var area:Number;
            for (var i:int = 0; i < coordinate.length; i++) {
                dx = _hitX - (coordinate[i].x + (coordinate[i].w >> 1));
                dy = _hitY - (coordinate[i].y + (coordinate[i].h >> 1));
                dist = Math.sqrt (dx * dx + dy * dy);
                area = ((coordinate[i].w > coordinate[i].h ? coordinate[i].w : coordinate[i].h) >> 1);
                if (dist < area) {
                    showRect = coordinate[i];
                    coordinate.splice(i, 1);
                    return true;
                }
            }
            
            return false;
        }
        
        public function reset():void {
            _hitX = 0;
            _hitY = 0;
            coordinate = [];
        }
        
        public function Checkpoint() {
            
            _hitX = 0;
            _hitY = 0;
        }
        
    }

}
