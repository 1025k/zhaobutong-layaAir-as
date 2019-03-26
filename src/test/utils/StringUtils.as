package test.utils
{
	public class StringUtils
	{
		public static function splitStrToIntArr(str:String, splitStr:String="+"):Array
		{
			var res:Array = new Array();
			var arr:Array = str.split(splitStr);
			for(var i:int=0; i<arr.length; i++)
			{
				res[i] = parseInt(arr[i]);
			}
			return res;
		}
		
		public static function splitStrToNumberArr(str:String, splitStr:String="+"):Array
		{
			var res:Array = new Array();
			var arr:Array = str.split(splitStr);
			for(var i:int=0; i<arr.length; i++)
			{
				res[i] = arr[i] as Number;
			}
			return res;
		}
		
		public static function trim(str:String):String 
		{
			if(str == null)
				return str;
			return str.replace(/([ ]{1})/g,"");
		}
		
		public static function isNullOrEmpty(str:String):Boolean
		{
			if(str != null)
			{
				str = trim(str);
				if(str.length > 0)
					return false;
			}
			return true;
		}
		
	}
}
