package  {
    import laya.utils.Browser;
    import laya.utils.Log;
    import laya.utils.Utils;
    import org.mvc.framework.impl.Injector;
    import org.mvc.framework.impl.Signal;
    import test.common.signals.ShareCallback;
	/**
     * ...
     * @author hoywe
     */
    public class CallH5 {
        
        public function CallH5() {
            
        }
        
        // CallH5.callback();
        public static function callback($args):void {
            
            Log.print("回调到 callback： " + $args);
            var signal:Signal = Injector.instance.getInstance(ShareCallback) as Signal;
            if (signal) {
                signal.dispatch();
            }
        }
        /**
         * 叫原生 JS: webView.loadUrl("javascript CallH5.callback("+"'"+msg+"'"+")");
         * @param	...$args
         */
        
        public static function callNative(...$args):void {
            
            var args:Array = Utils.copyArray([], $args);
            var param:String = args.join(",");
            //trace("测试回调");
            //callback();
            //return;
            // CallH5.callNative('back');
            // CallH5.callNative('share');
            
            Log.print("call 原生参数： " + param);
            
            if (Browser.onAndriod) {
                //   JAVA中定义标识.method
                __JS__("AppModel.call(param)");
                return;
            }
            if (Browser.onIOS) {
                __JS__("window.webkit.messageHandlers.AppModel.postMessage( {body: param} )");
                return;
            }
        }
        
    }

}
