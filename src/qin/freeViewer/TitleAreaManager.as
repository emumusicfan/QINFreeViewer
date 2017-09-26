package qin.freeViewer{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextFieldAutoSize;
	//import mx.events.EventDispatcher;
	public class TitleAreaManager {
		//TitleAreaManager类管理第一页的标题、作者、定弦等信息的显示。[未完成][未启用]
		public var myRootObj:Object;
		public var operatorObj;
		public var fmObj:Object;
                //
                public var title_txt:TextField=new TextField();
                //标题栏。
                //
		public function TitleAreaManager(){
			//构造方法。
                }
		public function process():void {
			this.title_txt.htmlText="<FONT SIZE='30'>"+this.myRootObj.JZP_xml.head[0].title[0]+"</FONT>";
			this.title_txt.autoSize=TextFieldAutoSize.LEFT;
			this.title_txt.x=this.fmObj.pageWidth_num*0.5-this.myRootObj.title_txt.width*0.5;
			this.operatorObj.currentPageJp.addChild(this.title_txt);
			//把标题内容加上。
                }
        }
}