package qin.freeViewer{
	public class DataConverter {
		public function getHui(huiwei:String):String{
			//取得可能是小数形式的徽位字符串，返回其整数部分的字符串。
                        if ((huiwei != "") && (String(Number(huiwei)) != "NaN") && (Number(huiwei) != Infinity) && (Number(huiwei) != -Infinity)){
			        return String(Math.floor(Number(huiwei)));
                        }else{
                                return "blank";
                        }
		}
		public function getFen(huiwei:String):String{
			//取得可能是小数形式的徽位字符串，返回其第一位小数部分的字符串。
                        if ((huiwei != "") && (String(Number(huiwei)) != "NaN") && (Number(huiwei) != Infinity) && (Number(huiwei) != -Infinity)){
			        return String(Math.round((Number(huiwei)%1)*10));
                        }else{
                                return "blank";
                        }
		}
		public function getFingering(fingering:String):String{
			//取得指法字符串，返回标准化的指法字符串。[未完成]
			return fingering;
		}
	    public function getVel(rawVel:String):Number{
			//取得力度字符串，返回标准化的力度数字。[未完成]
			if (String(Number(rawVel)) == "NaN") {
				//如果没有取得有效的力度值，那么返回最大力度值127。
				return 127;
			}else if (Number(rawVel) > 127) {
				//如果力度大于127，那么就返回127。
				return 127;
			}else if (Number(rawVel) < 0) {
				//如果力度大于127，那么就返回127。
				    return 0;
			}else {
                 //若都正常，就返回值。
			     return Number(rawVel);
			}
		}
	}
}