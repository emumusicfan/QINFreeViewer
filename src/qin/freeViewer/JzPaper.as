package qin.freeViewer{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.getDefinitionByName;
	import qin.jzFonts.droidSansFallback.*;
	public class JzPaper extends Sprite {

		//JzPaper类包装了Sprite类。JzPaper类是为了使用方便和便于移植而定义的。整个曲谱区域的背景、谱纸、单页、减字都是它的实例。
		//但是，减字部首不是。它们是直接继承自Sprite类的。
		public var myRootObj:Object = root;
		public var ownedJzParts_array:Array = new Array();
		public var metaVel_num:Number = 127;
		//保存这个字对应的力度值（如果有）。取值范围0-127从而兼容midi，使用Number类型从而可以带小数。
		public function JzPaper(myRootObj:Object) {
			super();
			this.myRootObj = myRootObj;
			this.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
		}
		public function rollOverHandler(event:MouseEvent):void {
		//处理鼠标指上去时候的事件，例如显示力度。[未完成]
            //this.myRootObj.sandboxType_lb.text=this.metaVel_num;
        }
		public function mouseOutHandler(event:MouseEvent):void {
		//处理鼠标指上去时候的事件，例如显示力度。[未完成]
            //this.myRootObj.sandboxType_lb.text="";
        }
		public function createEmptyChild(insName:String):Object {
			trace("//创建一个空的子jzPaper实例，当作大的纸张。");
			trace(this.myRootObj);
			var index:uint = 0;
			index = this.myRootObj.paper_array.push(new JzPaper(this.myRootObj));
			this.myRootObj.paper_array[index - 1].name = insName;
			return this.addChild(this.myRootObj.paper_array[index - 1]);
		}
		public function createSingleCharacterPaper(insName:String):Object {
			trace("//创建一个空的单字容器，也是jzPaper实例。");
			trace(this.myRootObj);
			var index:uint = 0;
			index = this.myRootObj.jz_array.push(new JzPaper(this.myRootObj));
			this.myRootObj.jz_array[index - 1].name = insName;
			return this.addChild(this.myRootObj.jz_array[index - 1]);
		}
		public static function strToUnicode(strValue:String):String {
			var strUnicode:String = "";
			for ( var i:int = 0; i < strValue.length; ++i )  
			{  
				strUnicode = strUnicode + "u" + String(strValue.charCodeAt(i));  
			}  
			return strUnicode;  
		}  
		public function createJzPart(partName:String, insName:String,x:Number,y:Number,width:Number,height:Number):Object {
			//创建一个减字部件子对象，其字体由formatManager_fm类中字体名称相关属性指定。
			//var partClass:Class = getDefinitionByName("qin.jzFonts.droidSansFallback.JzFont_DroidSansFallback_"+partName ) as Class;
			var partClass:Class = getDefinitionByName("qin.jzFonts.droidSansFallback.JzFont_" + this.myRootObj.formatManager_fm.fontName_str + "_" + strToUnicode(partName)) as Class;
			
			

			var index:uint = 0;
			trace("上一个"+partName+"part！");
			index = this.ownedJzParts_array.push(new partClass());
			this.ownedJzParts_array[index - 1].name = insName;
			this.ownedJzParts_array[index - 1].x=x;
			this.ownedJzParts_array[index - 1].y=y;
			this.ownedJzParts_array[index - 1].width=width;
			this.ownedJzParts_array[index - 1].height=height;
			return this.addChild(this.ownedJzParts_array[index - 1]);

		}
		public function moveMyselfTo(newParent:DisplayObjectContainer):Sprite {
			trace("//改变自身所属的父对象。");
			newParent.addChild(this);
			return this;
		}
		public function removeAllChildren():JzPaper {
			//移除自身包含的所有JzPaper实例。
			while (this.numChildren > 0) {
				if (this.getChildAt(0) is JzPaper) {
					//如果显示子对象是JzPaper类的实例，或者是继承自JzPaper的类的实例，就调用它的removeAllChildren方法。
					JzPaper(this.getChildAt(0)).removeAllChildren();
				}
				this.removeChildAt(0);
			}
			this.ownedJzParts_array.splice(0);
			//移除对自身包含的所有减字部首的引用。
			return this;
		}
	}
}