package test.common {
    import org.mvc.extensions.layaCommandMap.api.ILayaCommandMap;
    import org.mvc.extensions.mediatorMap.api.IMediatorMap;
	import org.mvc.framework.api.IConfig;
    import org.mvc.framework.api.IInjector;
    import org.mvc.framework.impl.Injector;
	
	/**
     * ...
     * @author hoywe
     */
    public class Config implements IConfig {
        
        /**
         * 全局注入反射实例
         */
        protected var injector:IInjector = Injector.instance;
        /**
         * 视图控制器
         */
        protected var mediatorMap:IMediatorMap = Injector.instance.getInstance('MediatorMap');
        /**
         * 命令总线
         */
        protected var layaCommandMap:ILayaCommandMap = Injector.instance.getInstance('LayaCommandMap');
        
        
        /* INTERFACE org.mvc.framework.api.IConfig */
        
        public function configure():void {
            
        }
        
    }

}
