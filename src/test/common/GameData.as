package test.common {
    import laya.utils.Browser;
	/**
     * ...
     * @author hoywe
     */
    public class GameData {
        
        public static var inApp:Boolean = false;
        
        public static const AppUA:String = "xiaoluwa";
        
        public static const Level:int = 9;
        
        public static const ChenceNum:Number = 3;
        
        public static const ResultNum:Number = 5;
        
        public static const TimeCounter:Number = 60;
        
        public static const IsDebug:Boolean = false;
        
        public static const BmpFntName:String = "bmpFont";
		
		public static const BmpFntName2:String = "bmpFont2";
        
        public static const ResPath:String = "res/";
        public static const SoundPath:String = "res/sound/";
        public static const GuidePath:String = "res/guide/";
        public static const LevelPath:String = "res/level/";
        public static const DataPath:String = "res/data/data.json";
        public static const BmpFontPath:String = "res/bitmapFont/font.xml";
        public static const BmpFontPath2:String = "res/bitmapFont/font2.xml";
        
        public static var data:Object;
        
        public static var mute:Boolean = false;
        
        //渲染尺寸
		public static var renderW:int = 1136;
		public static var renderH:int = 640;
		
		//以1136*640作为设计尺寸
		public static var designW:int = 1136;
		public static var designH:int = 640;
        
        
        public static var scale:Number = 1;
        
        public static function init():void {
            
            var bw:Number;
			var bh:Number;
            
            bw = Math.max(Browser.height, Browser.width);
			bh = Math.min(Browser.height, Browser.width);
            
            //设备尺寸大于美术设计尺寸时，我们就让渲染尺寸等于美术设计尺寸，反之用设备尺寸。
            
            var scaleRatio:Number = bw / bh;
			renderW = Math.min(bw, designW);
			renderH = Math.min(bh, designH);
            
            var scaleW:Number =  bw / designW;
			var scaleH:Number =  bh / designH;
            
			if(scaleW < scaleH)
			{
				renderW = renderH * scaleRatio;
			}
			else if(scaleW > scaleH)
			{
				renderH = renderW / scaleRatio;
			}
			//1.不留黑边 2.保证渲染区域最小
			
			scaleW =  renderW / designW;
			scaleH =  renderH / designH;
			scale = Math.min(scaleW, scaleH);
        }
        
    }

}
