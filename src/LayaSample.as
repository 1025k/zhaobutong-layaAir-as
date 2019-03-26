package {
    import laya.display.BitmapFont;
    import laya.display.Stage;
    import laya.display.Text;
    import laya.net.Loader;
    import laya.ui.ProgressBar;
    import laya.utils.Browser;
    import laya.utils.Handler;
    import laya.utils.Log;
    import laya.utils.Stat;
    import laya.webgl.WebGL;
    import org.mvc.extensions.layaCommandMap.LayaCommandMapExtension;
    import org.mvc.extensions.mediatorMap.MediatorMapExtension;
    import org.mvc.framework.impl.Context;
    import test.common.GameData;
    import test.common.LayaConfig;
    import test.common.SceneRoot;
    import test.context.game.GameConfig;
    import test.context.title.TitleConfig;
	public class LayaSample {
		
        private var progressBar:ProgressBar;
        
		public function LayaSample() {
            
            // 自适应分辨率
            GameData.init();
            
			Laya.init(GameData.renderW, GameData.renderH, WebGL);
			
			Laya.stage.scaleMode = Stage.SCALE_EXACTFIT;
            Laya.stage.screenMode = Stage.SCREEN_HORIZONTAL;
            Laya.stage.alignV = Stage.ALIGN_MIDDLE;
			Laya.stage.alignH = Stage.ALIGN_CENTER;
            Stat.show();
            //Log.enable();
            Log.print("准备加载");
            Log.print("onAndroid " + Browser.userAgent);
			Laya.stage.bgColor = "#FFFCB3";
            Browser.window.addEventListener("resize", onWindowResize);
            Laya.loader.load([GameData.ResPath + "loader/progress_time.png", GameData.ResPath + "loader/progress_time$bar.png"], 
                                                                    Handler.create(this, this.onLoadComplete));
		}
        
        private function onLoadComplete():void {
            
            showProgressBar();
            onProLoaded();
        }
        
        private function onProLoaded():void {
            
            var res:Array = new Array();
            
            res.push({url: GameData.DataPath, type:Loader.JSON } );
            res.push({url: GameData.BmpFontPath, type: Loader.XML}, {url: GameData.BmpFontPath.replace(".xml", ".png"), type: Loader.IMAGE});
			res.push({url: GameData.BmpFontPath2, type: Loader.XML}, {url: GameData.BmpFontPath2.replace(".xml", ".png"), type: Loader.IMAGE});
            res.push({ url: "assets/test.json", type:Loader.ATLAS });
            res.push({ url: GameData.ResPath + "bg.png", type:Loader.IMAGE });
            res.push({ url: "test/popup_back.png", type:Loader.IMAGE });
            res.push({ url: "test/title-com.png", type:Loader.IMAGE });
            res.push( { url: "test/title.png", type:Loader.IMAGE } );
            
            for (var i:int = 1; i <= GameData.Level; i++) {
                res.push({ url: GameData.GuidePath + i + '.png', type:Loader.IMAGE });
                res.push({ url: GameData.LevelPath + i + '.png', type:Loader.IMAGE });
                res.push( { url: GameData.LevelPath + i + '-.png', type:Loader.IMAGE } );
                // 每关声音加载
                res.push({ url: GameData.SoundPath + i + '.mp3', type:Loader.SOUND });
            }
            
            res.push( { url: GameData.SoundPath + "bgm.mp3", type:Loader.SOUND } );
            res.push( { url: GameData.SoundPath + "wrong.mp3", type:Loader.SOUND } );
            res.push( { url: GameData.SoundPath + "right.mp3", type:Loader.SOUND } );
            Laya.loader.load(res, null, Handler.create(this, onLoading, null, false));
        }
        
        private function registerBitmapFont():void {
            
            var bitmapFont:BitmapFont = new BitmapFont();
			bitmapFont.parseFont(Loader.getRes(GameData.BmpFontPath), Loader.getRes(GameData.BmpFontPath.replace(".xml", ".png")));
			bitmapFont.setSpaceWidth(10);
			Text.registerBitmapFont(GameData.BmpFntName, bitmapFont);
            
			bitmapFont = new BitmapFont();
			bitmapFont.parseFont(Loader.getRes(GameData.BmpFontPath2), Loader.getRes(GameData.BmpFontPath2.replace(".xml", ".png")));
			bitmapFont.setSpaceWidth(10);
			Text.registerBitmapFont(GameData.BmpFntName2, bitmapFont);
        }
        
        private function init():void {
            
            new Context().install(MediatorMapExtension, LayaCommandMapExtension)
            .configure(new SceneRoot())
            .configure(LayaConfig, TitleConfig, GameConfig)
            .init();
            
            Log.print("加载完毕");
        }
        
        private function showProgressBar():void {
            
            progressBar = new ProgressBar(GameData.ResPath + "loader/progress_time.png");
            progressBar.scaleX = progressBar.scaleY = GameData.scale;
            progressBar.centerX = 0;
            progressBar.centerY = 0;
            progressBar.value = 0;
            Laya.stage.addChild(progressBar);
        }
        
        private function onLoading($val:Number):void {
            
			progressBar.value = $val;
			if (progressBar.value >= 1) {
				progressBar.value = 1;
                registerBitmapFont();
                progressBar.removeSelf();
                progressBar = null;
                GameData.data = Laya.loader.getRes(GameData.DataPath);
                GameData.inApp = (Browser.userAgent.lastIndexOf(GameData.AppUA) > -1);
                init();
                onWindowResize();
			}
        }
        
        private function onWindowResize():void {
            
            GameData.init();
            Laya.stage.width = GameData.renderW;
			Laya.stage.height = GameData.renderH;
        }
	}
}
