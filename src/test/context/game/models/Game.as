package test.context.game.models {
    
	import org.mvc.framework.impl.Model;
	
	/**
     * ...
     * @author hoywe
     */
    public class Game extends Model {
        
        public var timeChanged:String = "time_changed";
        public var chanceChanged:String = "chance_changed";
        public var sorceChanged:String = "sorce_changed";
        public var resultChanged:String = "result_changed";
        public var levelChanged:String = "level_changed";
        public var overOrComplete:String = "over_complete";
        
        private var _isfinish:Boolean = false;
        
        public function get isfinish():Boolean {
            return _isfinish;
        }
        
        public function set isfinish(value:Boolean):void {
            _isfinish = value;
            if (_isfinish) {
                dispatch(overOrComplete);
            }
        }
        
        private var _missNum:int = 0;
        
        public function get missNum():int {
            return _missNum;
        }
        
        public function set missNum(value:int):void {
            _missNum = value;
            if (missNum == 0) {
                dispatch(overOrComplete);
            }
        }
        
        public function Game()
        {
            levelIndex = 1;
            chance = 10;
            sorce = 0;
        }
        
        private var _resultIndex:int;
        
        public function get resultIndex():int {
            return _resultIndex;
        }
        
        public function set resultIndex(value:int):void {
            _resultIndex = value;
            dispatch(resultChanged);
        }
        
        private var _counter:Number;
        
        public function get counter():Number {
            return _counter;
        }
        
        public function set counter(value:Number):void {
            _counter = value;
            dispatch(timeChanged);
        }
        
        private var _sorce:Number;
        
        public function get sorce():Number {
            return _sorce;
        }
        
        public function set sorce(value:Number):void {
            _sorce = value;
            dispatch(sorceChanged);
        }
        
        private var _chance:Number;
        
        public function get chance():Number {
            return _chance;
        }
        
        public function set chance(value:Number):void {
            _chance = value;
            dispatch(chanceChanged);
        }
        
        private var _levelIndex:int;
        
        public function get levelIndex():int {
            return _levelIndex;
        }
        public function set levelIndex(value:int):void {
            _levelIndex = value;
            dispatch(levelChanged);
        }
        
        public function reset():void {
            
            missNum = 5;
            _resultIndex = 0;
            counter = 90;
        }
        
        public function replay():void {
            
            chance = 10;
            _levelIndex = 1;
            _sorce = 0;
            _isfinish = false;
            reset();
        }
        
        public function start():void {
            
            Laya.timer.loop(1000, this, onTimer);
            onTimer();
        }
        
        public function stop():void {
            Laya.timer.clear(this, onTimer);
        }
        
        private function onTimer():void {
            
            counter--;
            if (counter == 0) {
                stop();
                dispatch(overOrComplete);
            }
        }
       
    }
}
