package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import fl.controls.*;
    import fl.containers.*;
	import flash.net.*;
	import flash.geom.Matrix;
	import fl.core.UIComponent;
	import fl.managers.StyleManager;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	import flash.events.*;
	import flash.system.Security;
	import qin.freeViewer.*;

	import qin.jzFonts.*;
    import qin.jzFonts.droidSansFallback.*;

	
	import qin.freeConverter.FreeConverter;

	public class Main extends MovieClip {
		//文档类。
		public var main_tmr:Timer = new Timer(1000,1);
		//声明主定时器main_tmr。整个程序只有这一个定时器。
		public var configObject_co:ConfigObject = new ConfigObject();
		//接下来要声明一个用于保存设置信息的类。

		public var listener_obj:SuperKitListener = new SuperKitListener();
		//有些对象，比如FileReference类的，必须用Listener才能正常工作。

		public var file_fr:FileReference = new FileReference();
		//用于显示“打开文件”对话框。
		public var urlLoader_ul:URLLoader = new URLLoader();
		public var urlRequest_ur:URLRequest = new URLRequest();

		public var JZP_xml:XML = new XML();
		//XML类。
		public var jz_array:Array=new Array();
		//存储所有减字的引用。
		public var paper_array:Array=new Array();
		//存储对较大纸张对象的引用。
		public var currentPg_num:Number = 0;
		//当前页码。
		public var mainBg_jp:JzPaper = new JzPaper(this);
		public var mainPaper_jp:JzPaper = new JzPaper(this);
		public var mainShadow_jp:JzPaper = new JzPaper(this);
		//三张重要的大纸。
		public var title_txt:TextField=new TextField();
		//标题栏。
		//[未完成][声明移动到相关的类中]
		public var pageNumber_txt:TextField=new TextField();
		//页码栏。
		public var formatManager_fm:FormatManager = new FormatManager();
		//排版对象。注意这里的:FormatManager也许会导致[错误]。
		public var operator_op:Operator = new Operator();
		//操作员对象。
		public var formatForGlobal_tf = new TextFormat();

		//界面样式对象。[未完成][要给这个减字字体信息属性加入选择减字字体功能]
		public var currentJzFontInfo_jfi:JzFontInfo=new JzFontInfo();
		public var dataConverter_dc:DataConverter=new DataConverter();
		//
		public var controlPanel_spt:Sprite=new Sprite();
		//承载按钮等组件的容器。
		public var url_ta:TextInput=new TextInput();
		public var browse_btn:Button=new Button();
		public var fontName_cb:ComboBox=new ComboBox();
		public var fontSize_cb:ComboBox=new ComboBox();
		public var applyFormat_btn:Button=new Button();
		public var openJZP_btn:Button=new Button();
		public var page_cb:ComboBox = new ComboBox();
		public var velView_btn:Button = new Button();
		//
		public var viewConverter_btn:Button = new Button();
		public var saveFile_btn:Button = new Button();
		//界面上的一些组件……
		public var main_sp:ScrollPane=new ScrollPane();

		//主ScrollPane。
                public var loadingXML_pb:ProgressBar=new ProgressBar();
                public var processing_pb:ProgressBar=new ProgressBar();
		public var sandboxType_lb:Label=new Label();
		//沙箱状态指示器。

		//
		//下面是所有的减字部件Class对象声明。
		//减字部件Class对象声明完毕。
		//
		//
        public var myConverter_fc:FreeConverter = new FreeConverter();
		//public var jzincluder_ji:JzIncluder = new JzIncluder();
		public function Main() {
			//构造方法。
            //=========================构建界面！=========================
			//下面要摆放组件！
			this.url_ta.move(30,35);
			this.url_ta.setSize(303,22);
			//
			this.browse_btn.move(340,35);
			this.browse_btn.setSize(22,22);
			this.browse_btn.label = "...";
			//
			this.fontName_cb.move(30,60);
			this.fontName_cb.setSize(120,22);
			//
			this.fontSize_cb.move(160,60);
			this.fontSize_cb.setSize(120,22);
                        this.fontSize_cb.addItem({label:"标准字号（五号）",data:1.2})
                        this.fontSize_cb.addItem({label:"一号",data:2})
                        this.fontSize_cb.addItem({label:"二号",data:1.8})
                        this.fontSize_cb.addItem({label:"三号",data:1.6})
                        this.fontSize_cb.addItem({label:"四号",data:1.4})
                        this.fontSize_cb.addItem({label:"五号",data:1.2})
                        this.fontSize_cb.addItem({label:"六号",data:1})
                        this.fontSize_cb.addItem({label:"七号",data:0.8})
                        this.fontSize_cb.addItem({label:"八号",data:0.6})
                        this.fontSize_cb.addItem({label:"九号",data:0.4})
                        this.fontSize_cb.addItem({label:"十号",data:0.2})
			//
			this.applyFormat_btn.move(290,60);
			this.applyFormat_btn.setSize(103,22);
			this.applyFormat_btn.label = "改变版式";
			//
			this.openJZP_btn.move(400,35);
			this.openJZP_btn.setSize(90,46);
			this.openJZP_btn.label = "打开文件";
			//
			this.velView_btn.move(500,60);
			this.velView_btn.setSize(100, 22);
			this.velView_btn.toggle = true;
			this.velView_btn.label = "显示力度";
			//
			this.page_cb.move(500,36);
			this.page_cb.setSize(100,22);
			//
			this.viewConverter_btn.move(0,0);
			this.viewConverter_btn.setSize(22, 22);
			this.viewConverter_btn.label = ">";
			this.viewConverter_btn.toggle = true;
			//
			this.saveFile_btn.move(370,35);
			this.saveFile_btn.setSize(22, 22);
			this.saveFile_btn.label = "S";
			//
			this.controlPanel_spt.addChild(this.url_ta);
			this.controlPanel_spt.addChild(this.browse_btn);
			this.controlPanel_spt.addChild(this.fontName_cb);
			this.controlPanel_spt.addChild(this.fontSize_cb);
			this.controlPanel_spt.addChild(this.applyFormat_btn);
			this.controlPanel_spt.addChild(this.openJZP_btn);
			this.controlPanel_spt.addChild(this.page_cb);
			this.controlPanel_spt.addChild(this.velView_btn);
			this.controlPanel_spt.addChild(this.viewConverter_btn);
			this.controlPanel_spt.addChild(this.saveFile_btn);
			//
			this.controlPanel_spt.x = 0;
			this.controlPanel_spt.y = 0;
			this.addChild(this.controlPanel_spt);
			this.addChild(this.sandboxType_lb);
			//
			this.main_sp.move(0,105);
			this.main_sp.setSize(630,330);
			this.addChild(this.main_sp);
			//
			this.sandboxType_lb.move(465,440);
			this.sandboxType_lb.setSize(150,22);
                        //
                        this.loadingXML_pb.move(255,440);
                        this.loadingXML_pb.setSize(150,22);
			this.addChild(this.loadingXML_pb);
                        //
                        this.processing_pb.move(255,440);
                        this.processing_pb.setSize(150,22);
			this.addChild(this.processing_pb);
			
			this.myConverter_fc.x = 0;
			this.myConverter_fc.y = 0;
			this.myConverter_fc.visible = false;
			this.myConverter_fc.adjustView();
			//设定一下转换器的视觉位置。
			
			this.addChild(myConverter_fc);
            //=========================构建完毕！=========================
			//
			//其它设置……
			this.listener_obj.myRootObj = this;
			this.myConverter_fc.myRootObj = this;
			XML.ignoreWhitespace = true;
			this.formatForGlobal_tf.font = "黑体";
			this.formatForGlobal_tf.size = 12;

			//最后是每次运行本应用程序后只执行一次的代码。
			this.main_sp.source = this.mainBg_jp;
			Sprite(this.main_sp.content).addChild(this.mainShadow_jp);
			Sprite(this.main_sp.content).addChild(this.mainPaper_jp);
			//
			this.browse_btn.addEventListener(MouseEvent.CLICK,this.listener_obj.browse_btnClickHandler);
			//this.file_fr.addEventListener(Event.SELECT, this.listener_obj.file_frSelectHandler);
			//this.file_fr.addEventListener(ProgressEvent.PROGRESS, this.listener_obj.file_frProgressHandler);
			//this.file_fr.addEventListener(Event.COMPLETE,this.listener_obj.file_frCompleteHandler);
			this.openJZP_btn.addEventListener(MouseEvent.CLICK,this.listener_obj.openJZP_btnClickHandler);
			this.applyFormat_btn.addEventListener(MouseEvent.CLICK, this.listener_obj.applyFormat_btnClickHandler);
			this.velView_btn.addEventListener(MouseEvent.CLICK, this.listener_obj.velView_btnClickHandler);
			//
			this.viewConverter_btn.addEventListener(MouseEvent.CLICK, this.listener_obj.viewConverter_btnClickHandler);
			this.saveFile_btn.addEventListener(MouseEvent.CLICK,this.listener_obj.saveFile_btnClickHandler);
			//
			//this.urlLoader_ul.addEventListener(Event.OPEN,this.listener_obj.urlLoader_ulOpenHandler);
			//this.urlLoader_ul.addEventListener(ProgressEvent.PROGRESS,this.listener_obj.urlLoader_ulProgressHandler);
			//this.urlLoader_ul.addEventListener(Event.COMPLETE,this.listener_obj.urlLoader_ulCompleteHandler);
			this.urlLoader_ul.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.listener_obj.urlLoader_ulSecurityErrorHandler);
			this.urlLoader_ul.addEventListener(IOErrorEvent.IO_ERROR,this.listener_obj.urlLoader_ulIOErrorHandler);
			//
			this.loadingXML_pb.direction = ProgressBarDirection.RIGHT;
			this.loadingXML_pb.mode = ProgressBarMode.MANUAL;
			this.loadingXML_pb.minimum = 0;
			this.loadingXML_pb.maximum = this.loaderInfo.bytesTotal;
			this.loadingXML_pb.indeterminate = false;
			this.loadingXML_pb.visible = false;
			//
			this.processing_pb.direction = ProgressBarDirection.RIGHT;
			this.processing_pb.mode = ProgressBarMode.MANUAL;
			this.processing_pb.indeterminate = false;
			this.processing_pb.visible = false;
			//
			this.page_cb.addEventListener(Event.CHANGE, this.listener_obj.page_cbChangeHandler);
			//加一个切换页码相关的监听。但实际上这里加监听只是为了防止移除不存在的监听导致的错误而设置的。
			//因为下面调用的关闭文档方法会移除那个监听。
			//真正有用的加监听，在Operator类唯一实例的创建第一页的过程里。
			//
			this.closeDocument();
			this.mySetStyle();
			//重新设定全局组件样式。
			this.applyFormat_btn.enabled = false;
			//一开始要禁用重新排版的按钮，因为还没载入文件。
			//判断安全模式，在sandboxType_lbw处给用户文字提示。
			if (Security.sandboxType == "remote") {
				this.sandboxType_lb.text = "在线应用模式";
			} else if (Security.sandboxType == "localTrusted") {
				this.sandboxType_lb.text = "本地受信任应用模式";
			} else if (Security.sandboxType == "localWithFile") {
				this.sandboxType_lb.text = "本地无网络支持应用模式";
			} else if (Security.sandboxType == "localWithNetwork") {
				this.sandboxType_lb.text = "本地网络专用应用模式";
			} else {
				this.sandboxType_lb.text = "未知应用模式";
			}

		}
		//
		public function GUILocker() {
			this.openJZP_btn.enabled = false;
			this.applyFormat_btn.enabled = false;
			this.page_cb.enabled = false;
			this.velView_btn.enabled = false;
		}
		public function GUIUnlocker() {
			this.openJZP_btn.enabled = true;
			this.applyFormat_btn.enabled = true;
			this.page_cb.enabled = true;
			this.velView_btn.enabled = true;
		}
		//锁定和解锁界面的方法。
		public function JZPReceiver(JZP:XML) {
			//接收一个文档，并且打开它。
			this.JZP_xml = JZP;
			try {
				trace("XML内容是："+this.JZP_xml);
				//这里需要有if！否则打开不能解析的文件也许要出错！[未完成]
				this.applyFormat_btn.enabled = true;
				this.listener_obj.applyFormat_btnClickHandler(null);
			} catch (e:Error) {
				trace("XML内容有错误！"+e);
				this.GUIUnlocker();
				this.applyFormat_btn.enabled = false;
				//再次把“改变版式”按钮锁了。
			}
		}
		public function closeDocument() {
			//用于关闭文件。注意！不重置xml对象！[未完成]
			var tempMatrix:Matrix = new Matrix();
			tempMatrix.createGradientBox(1, this.main_sp.height, ((90/180)*Math.PI), 0, 600);
			//tempMatrix.rotate((90/180)*Math.PI);
			tempMatrix.scale(1, 0.31);
			//创建用于渐变背景的绘画的矩阵对象。
			this.page_cb.removeEventListener(Event.CHANGE, this.listener_obj.page_cbChangeHandler);
			//去掉页码切换ComboBox的事件处理器监听。加监听是在Operator类唯一实例的创建第一页的过程里。
			//
			this.mainPaper_jp.graphics.clear();
			this.mainPaper_jp.removeAllChildren();
			this.mainShadow_jp.graphics.clear();
			this.mainShadow_jp.removeAllChildren();
			//清除纸张容器对象和阴影对象的内容。
			//
			//with (this.main_sp.content) {
			Sprite(this.main_sp.content).graphics.clear();
			Sprite(this.main_sp.content).graphics.beginGradientFill("linear", [0x0000FF, 0xFFFFFF], [50, 100], [0, 0xFF], tempMatrix, "pad", "RGB", 0);
			Sprite(this.main_sp.content).graphics.drawRect(0,0,this.main_sp.width, this.main_sp.height);
			this.main_sp.update();
			//清除旧的背景，绘制关闭文档后的背景。
			//
			/*graphics.moveTo(0, 0);
			graphics.lineTo(this.main_sp.width, 0);
			graphics.lineTo(this.main_sp.width, this.main_sp.height);
			graphics.lineTo(0, this.main_sp.height);
			graphics.lineTo(0, 0);
			graphics.endFill();*/
			//}
			//绘制背景。
			this.page_cb.removeAll();
			this.page_cb.addItem({label:"典型齿轮的减字谱显示器测试版_无文档"});
			//处理页码栏。
			this.jz_array=new Array();
			this.paper_array=new Array();
			this.formatManager_fm.initialize();
			//初始化格式管理器formatManager_fm。
		}
		public function mySetStyle():void {
			//为所有组件设定样式。
			StyleManager.setStyle("textFormat",this.formatForGlobal_tf);
		}
		public function viewPageNumber(position:uint):void {
			//在正确的位置显示页码栏。
			this.pageNumber_txt.wordWrap = false;
			this.pageNumber_txt.htmlText = String("<b>第" + String(this.currentPg_num) + "页</b>");
			this.pageNumber_txt.autoSize = TextFieldAutoSize.LEFT;
			switch (position) {
				case 1 :
					this.pageNumber_txt.x = this.formatManager_fm.pgNumLeftMargin_num;
					this.pageNumber_txt.y = this.mainPaper_jp.height - this.formatManager_fm.pgNumBottomMargin_num - this.pageNumber_txt.height;
					this.pageNumber_txt.visible = true;
					break;
				case 2 :
					this.pageNumber_txt.x = this.mainPaper_jp.width * 0.5 - this.pageNumber_txt.width * 0.5;
					this.pageNumber_txt.y = this.mainPaper_jp.height - this.formatManager_fm.pgNumBottomMargin_num - this.pageNumber_txt.height;
					this.pageNumber_txt.visible = true;
					break;
				case 3 :
					this.pageNumber_txt.x = this.mainPaper_jp.width - this.formatManager_fm.pgNumRightMargin_num - this.pageNumber_txt.width;
					this.pageNumber_txt.y = this.mainPaper_jp.height - this.formatManager_fm.pgNumBottomMargin_num - this.pageNumber_txt.height;
					this.pageNumber_txt.visible = true;
					break;
				case 4 :
					this.pageNumber_txt.x = this.formatManager_fm.pgNumLeftMargin_num;
					this.pageNumber_txt.y = this.mainPaper_jp.height * 0.5 - this.pageNumber_txt.height * 0.5;
					this.pageNumber_txt.visible = true;
					break;
				case 5 :
					this.pageNumber_txt.visible = false;
					break;
				case 6 :
					this.pageNumber_txt.x = this.mainPaper_jp.width - this.formatManager_fm.pgNumRightMargin_num - this.pageNumber_txt.width;
					this.pageNumber_txt.y = this.mainPaper_jp.height * 0.5 - this.pageNumber_txt.height * 0.5;
					this.pageNumber_txt.visible = true;
					break;
				case 7 :
					this.pageNumber_txt.x = this.formatManager_fm.pgNumLeftMargin_num;
					this.pageNumber_txt.y = this.formatManager_fm.pgNumTopMargin_num;
					this.pageNumber_txt.visible = true;
					break;
				case 8 :
					this.pageNumber_txt.x = this.mainPaper_jp.width * 0.5 - this.pageNumber_txt.width * 0.5;
					this.pageNumber_txt.y = this.formatManager_fm.pgNumTopMargin_num;
					this.pageNumber_txt.visible = true;
					break;
				case 9 :
					this.pageNumber_txt.x = this.mainPaper_jp.width - this.formatManager_fm.pgNumRightMargin_num - this.pageNumber_txt.width;
					this.pageNumber_txt.y = this.formatManager_fm.pgNumTopMargin_num;
					this.pageNumber_txt.visible = true;
					break;
			}
			this.mainPaper_jp.addChild(this.pageNumber_txt);
			//添加页码栏。
			//添加标题栏的操作是在生成第一个实际页面的时候。
		}



	}


}