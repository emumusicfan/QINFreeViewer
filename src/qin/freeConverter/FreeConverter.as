package qin.freeConverter
{
	import fl.controls.Button;
	import fl.controls.TextArea;
	import fl.events.ComponentEvent;
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.*;
	import flash.net.*;
	/**
	 * ...
	 * @author ...
	 */
	public class FreeConverter extends Sprite
	{
	  var mainDOM_dom:XML;
      //用于引用XML DOM，具体DOM在onload事件处理器中创建。
      var myXML_str:String;
      //用在搭建基本的xml字符串上。
      var mainXMLParser_psr;
      //用于引用字符串到的XML转换器（用在基本文档框架的搭建上），具体对象在onload事件处理器中创建。
      var mainXMLSerializer_xs;
      //用于引用XML到字符串的转换器，具体对象在onload事件处理器中创建。
      var jzTrack_ele:XML;
      //用于引用jz_track元素的变量。
      var info_ele:XML;
      //用于引用info元素的变量。
      var stringsArray_array:Array;
      //用于存储一行行字符串的数组。
      var lineCounter_int:int;
      //用于进行文字处理时候文字行的计数。
      var timeIndex_int:int;
      //用于引用setTimeout函数生成的索引。
      //
      var version_str:String = "0.5";
      var processInterval_int:int = 20;
      //行处理的间隔时间，以千分之一秒为单位。
	  var myfile_fr:FileReference;
	  public var myRootObj:Object;
	  //根对象的引用。
      //
      var isInfoOrIniOrText_re:RegExp;
      //用于引用负责判断一行文字是否指定曲目信息的或文字信息的正则表达式对象。
      var isCtrl_re:RegExp;
      //用于引用负责判断一行文字是否是控制类信息（如“泛起”、“泛止”、“少息”）的正则表达式对象。
      var getTitle_re:RegExp;
      //用于引用负责取得曲目标题的正则表达式对象。
      var getAuthor_re:RegExp;
      //用于引用负责取得曲目作者名的正则表达式对象。
      var getStyle_re:RegExp;
      //用于引用负责取得琴型（如“伏羲”）的正则表达式对象。
      var getMaterial_re:RegExp;
      //用于引用负责取得弦材质的正则表达式对象。
      var getPitch_re:RegExp;
      //用于引用负责取得定弦信息的正则表达式对象。
      //
      var getCtrl_re:RegExp;
      //用于引用负责取得控制信息名的正则表达式对象。
      var getCtrlValue_re:RegExp;
      //用于引用负责取得控制信息值的正则表达式对象。
      //
      var getText_re:RegExp;
      //用于引用负责取得文字信息的正则表达式对象。
      //
      var getLh1_fLv1_fingering_re:RegExp;
      //用于引用负责取得左手第一Lv1指法指法名的正则表达式对象。
      var getLh1_fLv1_huiwei_re:RegExp;
      //用于引用负责取得左手第一Lv1指法徽位的正则表达式对象。
      var getLh1_fLv2_fingering_re:RegExp;
      //用于引用负责取得左手第一Lv2指法指法名的正则表达式对象。
      var getLh1_fLv2_fingeringType2_re:RegExp;
      //用于引用负责取得左手第一Lv2“上下進退復”一类指法指法名的正则表达式对象。
      var getLh1_fLv2_huiwei_re:RegExp;
      //用于引用负责取得左手第一Lv2指法徽位的正则表达式对象。
      var getLh1_fLv3_fingering_re:RegExp;
      //用于引用负责取得左手第一Lv1指法指法名的正则表达式对象。
      var getRh1_fLv1_fingering_re:RegExp;
      //用于引用负责取得右手第一Lv1指法指法名的正则表达式对象。
      var getRh1_fLv1_stString_re:RegExp;
      //用于引用负责取得右手第一Lv1指法第一弦的正则表达式对象。
      var getRh1_fLv1_edString_re:RegExp;
      //用于引用负责取得右手第一Lv1指法第二弦的正则表达式对象。
      var getVel1_re:RegExp;
      //用于引用负责取得第一指法力度的正则表达式对象。
      //
      var getLh2_fLv1_fingering_re:RegExp;
      //用于引用负责取得左手第二Lv1指法指法名的正则表达式对象。
      var getLh2_fLv1_huiwei_re:RegExp;
      //用于引用负责取得左手第二Lv1指法徽位的正则表达式对象。
      var getLh2_fLv2_fingering_re:RegExp;
      //用于引用负责取得左手第二Lv2指法指法名的正则表达式对象。
      //var getRh2_fLv1_fingering_re:RegExp;
      //用于引用负责取得右手第二Lv1指法指法名的正则表达式对象。
      var getRh2_fLv1_stString_re:RegExp;
      //用于引用负责取得右手第二Lv1指法第一弦的正则表达式对象。
      //var getRh2_fLv1_edString_re:RegExp;
      //用于引用负责取得右手第二Lv1指法第二弦的正则表达式对象。
      var getVel2_re:RegExp;
      //用于引用负责取得第二指法力度的正则表达式对象。
      //最后两个留给“散X如一”类指法。
      //
      var lh1_fLv1_fingering_str:String;
      var lh1_fLv1_vel_str:String;
      var lh1_fLv1_stPos_str:String;
      var lh1_fLv1_edPos_str:String;
      var lh1_fLv1_stString_str:String;
      var lh1_fLv1_edString_str:String;
      var lh1_fLv1_stHuiwei_str:String;
      var lh1_fLv1_edHuiwei_str:String;
      //左手第一动作Lv1的相关变量。
      //
      var lh1_fLv2_fingering_str:String;
      var lh1_fLv2_vel_str:String;
      var lh1_fLv2_stPos_str:String;
      var lh1_fLv2_edPos_str:String;
      var lh1_fLv2_stString_str:String;
      var lh1_fLv2_edString_str:String;
      var lh1_fLv2_stHuiwei_str:String;
      var lh1_fLv2_edHuiwei_str:String;
      //左手第一动作Lv2的相关变量。
      //
      var lh1_fLv3_fingering_str:String;
      var lh1_fLv3_vel_str:String;
      var lh1_fLv3_stPos_str:String;
      var lh1_fLv3_edPos_str:String;
      var lh1_fLv3_stString_str:String;
      var lh1_fLv3_edString_str:String;
      var lh1_fLv3_stHuiwei_str:String;
      var lh1_fLv3_edHuiwei_str:String;
      //左手第一动作Lv3的相关变量。
      //
      var lh2_fLv1_fingering_str:String;
      var lh2_fLv1_vel_str:String;
      var lh2_fLv1_stPos_str:String;
      var lh2_fLv1_edPos_str:String;
      var lh2_fLv1_stString_str:String;
      var lh2_fLv1_edString_str:String;
      var lh2_fLv1_stHuiwei_str:String;
      var lh2_fLv1_edHuiwei_str:String;
      //左手第二动作Lv1的相关变量。
      //
      var lh2_fLv2_fingering_str:String;
      var lh2_fLv2_vel_str:String;
      var lh2_fLv2_stPos_str:String;
      var lh2_fLv2_edPos_str:String;
      var lh2_fLv2_stString_str:String;
      var lh2_fLv2_edString_str:String;
      var lh2_fLv2_stHuiwei_str:String;
      var lh2_fLv2_edHuiwei_str:String;
      //左手第二动作Lv2的相关变量。
      //
      var lh2_fLv3_fingering_str:String;
      var lh2_fLv3_vel_str:String;
      var lh2_fLv3_stPos_str:String;
      var lh2_fLv3_edPos_str:String;
      var lh2_fLv3_stString_str:String;
      var lh2_fLv3_edString_str:String;
      var lh2_fLv3_stHuiwei_str:String;
      var lh2_fLv3_edHuiwei_str:String;
      //左手第二动作Lv3的相关变量。
      //
      var rh1_fLv1_fingering_str:String;
      var rh1_fLv1_vel_str:String;
      var rh1_fLv1_stPos_str:String;
      var rh1_fLv1_edPos_str:String;
      var rh1_fLv1_stString_str:String;
      var rh1_fLv1_edString_str:String;
      var rh1_fLv1_stHuiwei_str:String;
      var rh1_fLv1_edHuiwei_str:String;
      //右手第一动作Lv1的相关变量。
      //
      var rh2_fLv1_fingering_str:String;
      var rh2_fLv1_vel_str:String;
      var rh2_fLv1_stPos_str:String;
      var rh2_fLv1_edPos_str:String;
      var rh2_fLv1_stString_str:String;
      var rh2_fLv1_edString_str:String;
      var rh2_fLv1_stHuiwei_str:String;
      var rh2_fLv1_edHuiwei_str:String;
      //右手第二动作Lv1的相关变量。
      //
	  var privateTimer_tmr:Timer = new Timer(null);
	  //私有定时器。
	  var inputArea_txa:TextArea = new TextArea();
	  var XMLArea_txa:TextArea = new TextArea();
	  var startButton_btn:Button = new Button();
	  var myBrowseButton_btn:Button = new Button();
	  var mySaveButton_btn:Button = new Button();

	public function FreeConverter() {
		//
		this.startButton_btn.label = "生成减字谱";
		this.startButton_btn.move(0,436);
		this.startButton_btn.setSize(202, 22);
		this.addChild(this.startButton_btn);
		//
		this.myBrowseButton_btn.label = "打开文字谱";
		this.myBrowseButton_btn.move(22,0);
		this.myBrowseButton_btn.setSize(90, 22);
		this.addChild(this.myBrowseButton_btn);
		//
		this.mySaveButton_btn.label = "保存文字谱";
		this.mySaveButton_btn.move(112,0);
		this.mySaveButton_btn.setSize(90, 22);
		this.addChild(this.mySaveButton_btn);
		//
		this.inputArea_txa.move(0,22);
		this.inputArea_txa.setSize(202, 414);
		this.addChild(this.inputArea_txa);
		//
		//
		this.XMLArea_txa.move(300,35);
		this.XMLArea_txa.setSize(350, 220);
		//this.addChild(this.XMLArea_txa);
		this.myfile_fr = new FileReference();
		//用于打开和保存文字谱的对象。
		//
		this.inputArea_txa.text += ("[title]測試" + "\r");
		this.inputArea_txa.text += ("[author]典型齒輪" + "\r");
		this.inputArea_txa.text += ("名7注挑7" + "\r");
		this.inputArea_txa.text += ("中6.5注挑6" + "\r");
		this.inputArea_txa.text += ("上5" + "\r");
		this.inputArea_txa.text += ("上3.5" + "\r");
		this.inputArea_txa.text += ("退" + "\r");
		this.inputArea_txa.text += ("上1.5" + "\r");
		this.inputArea_txa.text += ("退" + "\r");
		this.inputArea_txa.text += ("上1.5" + "\r");
		this.inputArea_txa.text += ("退" + "\r");
		this.inputArea_txa.text += ("復" + "\r");
		this.inputArea_txa.text += ("中6.5綽挑3" + "\r");
		this.inputArea_txa.text += ("進" + "\r");
		this.inputArea_txa.text += ("復" + "\r");
		this.inputArea_txa.text += ("上1.5" + "\r");
		this.inputArea_txa.text += ("名3注抹7" + "\r");
		this.inputArea_txa.text += ("大4注剔5" + "\r");
		this.inputArea_txa.text += ("食5注打2" + "\r");
		this.inputArea_txa.text += ("中6注摘3" + "\r");
		this.inputArea_txa.text += ("名7.1注擘4" + "\r");
		this.inputArea_txa.text += ("跪7注托5" + "\r");
		this.inputArea_txa.text += ("大9注撮7,5散" + "\r");
		//初始文档。
		this.initialize();
	}
	public function myOutput(myString_str:String):void {
		//输出测试。Release版应禁用。
//		this.XMLArea_txa.text += myString_str;
	}
	public function adjustView():void {
		try{
		    //本对象被添加到舞台以后才可以使用此方法！[未完成]
			/*this.inputArea_txa.move(0, 0);
		    this.inputArea_txa.setSize(200, this.stage.height - this.inputArea_txa.y - this.startButton_btn.height);
		    this.startButton_btn.move(0, this.inputArea_txa.y + this.inputArea_txa.height);
		    this.startButton_btn.setSize(this.inputArea_txa.width, 22);
			*/
			//this.inputArea_txa.move(0, 25);
		    //this.inputArea_txa.setSize(200, this.stage.height - this.inputArea_txa.y - this.startButton_btn.height);
		    //this.startButton_btn.move(0, this.inputArea_txa.y + this.inputArea_txa.height);
		    //this.startButton_btn.setSize(this.inputArea_txa.width, 22);
		    //略微调整一下布局。
		}catch (err:Error) {
			
		}
	}
	public function initialize():void {
        //this.mainDOM_dom = new XML();
        //this.mainDOM_dom.async = "false";
        //this.mainXMLParser_psr = new DOMParser();
        //this.mainXMLSerializer_xs = new XMLSerializer();
        //
        //
        this.myXML_str = "<?xml version='1.0' encoding='UTF-8'?>";
        this.myXML_str += "<JZP type='JZP_GuQin_ZHCGMQ' version='0.1'>";
        this.myXML_str += "<head>";
        this.myXML_str += "<info>";
        this.myXML_str += "</info>";
        this.myXML_str += "<initialization>";
        this.myXML_str += "<qin_setup>";
        this.myXML_str += "<string_0>";
        this.myXML_str += "<material>";
        this.myXML_str += "</material>";
        this.myXML_str += "<pitch unit='tuning'>";
        this.myXML_str += "</pitch>";
        this.myXML_str += "</string_0>";
        this.myXML_str += "</qin_setup>";
        this.myXML_str += "</initialization>";
        this.myXML_str += "</head>";
        this.myXML_str += "<tracks>";
        this.myXML_str += "<group>";
        this.myXML_str += "<jz_track>";
        this.myXML_str += "</jz_track>";
        this.myXML_str += "</group>";
        this.myXML_str += "</tracks>";
        this.myXML_str += "</JZP>";
		//
        
		this.isInfoOrIniOrText_re = /^\[\w+\](([\u4e00-\u9fa5]|\w)*)$/;
        this.getTitle_re = /^\[title\](([\u4e00-\u9fa5]|\w)*)$/;
        this.getAuthor_re = /^\[author\](([\u4e00-\u9fa5]|\w)*)$/;
        //[未完成][更多元素的识别处理]
        this.getStyle_re = /^\[style\](([\u4e00-\u9fa5]|\w)*)$/;
        this.getMaterial_re = /^\[material\](([\u4e00-\u9fa5]|\w)*)$/;
        this.getPitch_re = /^\[pitch\](([\u4e00-\u9fa5]|\w)*)$/;
        this.getText_re = /^\[text\](([\u4e00-\u9fa5]|\w)*)$/;
        //[未完成][更多元素的识别处理]
        //
        this.isCtrl_re = /^((泛起)|(泛止)|(標)|(從標再作)|(從頭再作)|(少息)|(入拍)|(入亂)|(漸慢)|(入慢)|(大慢))/;
        this.getCtrl_re = this.isCtrl_re;
        this.getCtrlValue_re = /v(alue)?=?(\d+\.\d+|\d+)$/;
        //[未完成][还有很多控制类信息]
        //
        this.getLh1_fLv1_fingering_re = /^([散大食中名跪就])/;
        this.getLh1_fLv1_huiwei_re = /^[大食中名跪](\d{1,2}\.\d+|\d{1,2})/;
        this.getLh1_fLv2_fingering_re = /(^[散大食中名跪就](\d{1,2}\.\d+|\d{1,2})?([綽注]|帶起|搯起|抓起))|(^[滸疾緩雙]?([上下進退復撞]))/;
        this.getLh1_fLv2_fingeringType2_re = /^[滸疾緩雙]?([上下進退復撞])/;
        this.getLh1_fLv2_huiwei_re = /^[滸疾緩雙]?[上下進退復](\d{1,2}\.\d+|\d{1,2})/;
        this.getLh1_fLv3_fingering_re = /^([滸疾緩雙])/;
        //
        this.getRh1_fLv1_fingering_re = /^[散大食中名跪就](\d{1,2}\.\d+|\d{1,2})?[綽注]?([\u4e00-\u9fa5]+)/;
        this.getRh1_fLv1_stString_re = /^[散大食中名跪就](\d{1,2}\.\d+|\d{1,2})?[綽注]?[\u4e00-\u9fa5]+(\d)/;
        this.getRh1_fLv1_edString_re = /^[散大食中名跪就](\d{1,2}\.\d+|\d{1,2})?[綽注]?[\u4e00-\u9fa5]+\d\,?(\d)/;
        this.getVel1_re =/v(el)?(=)?(\d{1,3}\.\d+|\d{1,3})(([\u4e00-\u9fa5]|\w)*)$/;
        //
        //
        this.getLh2_fLv1_fingering_re = /^[散大食中名跪就](\d{1,2}\.\d+|\d{1,2})?[綽注]?[\u4e00-\u9fa5]+\d\,?\d?([散大食中名跪就])/;
        this.getLh2_fLv1_huiwei_re = /^[散大食中名跪就](\d{1,2}\.\d+|\d{1,2})?[綽注]?[\u4e00-\u9fa5]+\d\,?\d?[散大食中名跪就](\d{1,2}\.\d+|\d{1,2})?/;
        this.getLh2_fLv2_fingering_re = /^[散大食中名跪就](\d{1,2}\.\d+|\d{1,2})?[綽注]?[\u4e00-\u9fa5]+\d\,?\d?(\d{1,2}\.\d+|\d{1,2})?([綽注])/;
        //
        this.getRh2_fLv1_stString_re = /(?:exp(?:exp[\u4e00-\u9fa5]|\w)*)$散(\d)如一(?:exp(?:exp[\u4e00-\u9fa5]|\w)*)/;
        this.getVel2_re =/(v(el)?=?(\d{1,3}\.\d+|\d{1,3}))?(散(\d)如一)v(el)?=?(\d{1,3}\.\d+|\d{1,3})$/;
        //
        //
		this.privateTimer_tmr.reset();
		this.privateTimer_tmr.delay = 1;
		this.privateTimer_tmr.repeatCount = 0;
		this.privateTimer_tmr.addEventListener(TimerEvent.TIMER, this.privateTimerToProcessOnce);
		//设置定时器。
		this.startButton_btn.addEventListener(MouseEvent.CLICK, this.startConversion);
		//设置启动转换的按钮功能。
		this.myBrowseButton_btn.addEventListener(MouseEvent.CLICK, this.myBrowseButton_btnHandler);
		//设置启动转换的按钮功能。
		this.mySaveButton_btn.addEventListener(MouseEvent.CLICK, this.mySaveButton_btnHandler);
		//设置启动转换的按钮功能。
		
	}
	function myBrowseButton_btnHandler(event:MouseEvent) {
		//打开文件。
		this.myfile_fr.addEventListener(Event.SELECT, this.myfile_frSelectHandler);
		this.myfile_fr.addEventListener(Event.CANCEL, this.myfile_frCancelHandler);
		this.myfile_fr.browse([new FileFilter("文字谱文件 (*.wzp)", "*.wzp"), new FileFilter("文本文件 (*.txt)", "*.txt"), new FileFilter("所有文件 (*.*)", "*.*")]);
	}
	function myfile_frSelectHandler(event:Event) {
		//确定打开文件。
		this.myfile_fr.removeEventListener(Event.SELECT, this.myfile_frSelectHandler);
		this.myfile_fr.removeEventListener(Event.CANCEL, this.myfile_frCancelHandler);
		this.myfile_fr.addEventListener(Event.COMPLETE, this.myfile_frCompleteHandler);
		this.myfile_fr.load();
	}
	function myfile_frCancelHandler(event:Event) {
		//取消打开文件。
		this.myfile_fr.removeEventListener(Event.SELECT, this.myfile_frSelectHandler);
		this.myfile_fr.removeEventListener(Event.CANCEL, this.myfile_frCancelHandler);
	}
	function myfile_frCompleteHandler(event:Event) {
		//确定打开文件。
		this.myfile_fr.removeEventListener(Event.COMPLETE, this.myfile_frCompleteHandler);
		this.inputArea_txa.text=String(myfile_fr.data);
	}
	function mySaveButton_btnHandler(event:MouseEvent) {
		//保存文件。
		this.myfile_fr.save(this.inputArea_txa.text,"newWZP.wzp");
	}
	function privateTimerToProcessOnce(event:TimerEvent) {
		//供privateTimer使用的转接器。
		this.processOnce(this.stringsArray_array[this.lineCounter_int]);
	}
	function XMLToString(xmlContent_xml:XML):String{
        //把xml内容输出成字符串。
        var xmlString:String;
        xmlString = xmlContent_xml.toString();
        xmlString = xmlString.replace(/\>\</g,">\n<");
        return xmlString;
    }
	
	function createActionElement(fingering_str:String,vel_str:String,stPos_str:String,edPos_str:String,stString_str:String,edString_str:String,stHuiwei_str:String,edHuiwei_str:String):XML{
        var temp_ele:XML;
        temp_ele = new XML("<action></action>");
        //建立一个名为“action”的元素节点。然后写入指法对应的所有属性。
        if ((fingering_str != null) && (fingering_str != undefined)){
            //如果属性值不为空，那么就写入属性值。
            temp_ele.@fingering = fingering_str;
        }else{
            //否则写入“blank”。
            temp_ele.@fingering = "blank";
        }
        if ((vel_str != null) && (vel_str != undefined)){
            //如果属性值不为空，那么就写入属性值。
            temp_ele.@vel = vel_str;
        }else{
            //否则写入“blank”。
            temp_ele.@vel = "blank";
        }
        if ((stPos_str != null) && (stPos_str != undefined)){
            //如果属性值不为空，那么就写入属性值。
            temp_ele.@st_pos = stPos_str;
        }else{
            //否则写入“blank”。
            temp_ele.@st_pos = "blank";
        }
        if ((edPos_str != null) && (edPos_str != undefined)){
            //如果属性值不为空，那么就写入属性值。
            temp_ele.@ed_pos=edPos_str;
        }else{
            //否则写入“blank”。
            temp_ele.@ed_pos="blank";
        }
        if ((stString_str != null) && (stString_str != undefined)){
            //如果属性值不为空，那么就写入属性值。
            temp_ele.@st_string=stString_str;
        }else{
            //否则写入“blank”。
            temp_ele.@st_string="blank";
        }
        if ((edString_str != null) && (edString_str != undefined)){
            //如果属性值不为空，那么就写入属性值。
            temp_ele.@ed_string=edString_str;
        }else{
            //否则写入“blank”。
            temp_ele.@ed_string="blank";
        }
        if ((stHuiwei_str != null) && (stHuiwei_str != undefined)){
            //如果属性值不为空，那么就写入属性值。
            temp_ele.@st_huiwei=stHuiwei_str;
        }else{
            //否则写入“blank”。
            temp_ele.@st_huiwei="blank";
        }
        if ((edHuiwei_str != null) && (edHuiwei_str != undefined)){
            //如果属性值不为空，那么就写入属性值。
            temp_ele.@ed_huiwei=edHuiwei_str;
        }else{
            //否则写入“blank”。
            temp_ele.@ed_huiwei="blank";
        }
        //属性写入到此结束。
        //
        return temp_ele;
        //返回生成的元素。
	}
	function singleJzConversion(singleLine_str:String):XML {
		//trace("要转换的指法文字是："+singleLine_str);
        var jz_ele:XML;
        //用来引用此方法生成的根元素节点。
        var lh_ele:XML;
        //用来引用左手元素节点。
        var rh_ele:XML;
        //用来引用右手元素节点。
        //
        var lh1_fLv1_ele:XML;
        //用来引用左手第一指法Lv1动作的元素节点。
        var lh1_fLv2_ele:XML;
        //用来引用左手第一指法Lv2动作的元素节点。
        var lh1_fLv3_ele:XML;
        //用来引用左手第一指法Lv3动作的元素节点。
        //
    	var lh2_fLv1_ele:XML;
        //用来引用左手第二指法Lv1动作的元素节点。
        var lh2_fLv2_ele:XML;
        //用来引用左手第二指法Lv2动作的元素节点。
        var lh2_fLv3_ele:XML;
        //用来引用左手第二指法Lv3动作的元素节点。
        //
        var rh1_fLv1_ele:XML;
        //用来引用左手第一指法Lv1动作的元素节点。
        var rh2_fLv1_ele:XML;
        //用来引用左手第二指法Lv1动作的元素节点。
        //
        //重置相关变量。
        this.lh1_fLv1_fingering_str=null;
        this.lh1_fLv1_vel_str=null;
    	this.lh1_fLv1_stPos_str=null;
        this.lh1_fLv1_edPos_str=null;
        this.lh1_fLv1_stString_str=null;
        this.lh1_fLv1_edString_str=null;
        this.lh1_fLv1_stHuiwei_str=null;
        this.lh1_fLv1_edHuiwei_str=null;
        //重置左手第一动作Lv1的相关变量。
        //
        this.lh1_fLv2_fingering_str=null;
        this.lh1_fLv2_vel_str=null;
        this.lh1_fLv2_stPos_str=null;
        this.lh1_fLv2_edPos_str=null;
        this.lh1_fLv2_stString_str=null;
        this.lh1_fLv2_edString_str=null;
        this.lh1_fLv2_stHuiwei_str=null;
    	this.lh1_fLv2_edHuiwei_str=null;
        //重置左手第一动作Lv2的相关变量。
        //
        this.lh1_fLv3_fingering_str=null;
        this.lh1_fLv3_vel_str=null;
        this.lh1_fLv3_stPos_str=null;
        this.lh1_fLv3_edPos_str=null;
        this.lh1_fLv3_stString_str=null;
        this.lh1_fLv3_edString_str=null;
        this.lh1_fLv3_stHuiwei_str=null;
        this.lh1_fLv3_edHuiwei_str=null;
        //重置左手第一动作Lv3的相关变量。
        //
        this.lh2_fLv1_fingering_str=null;
        this.lh2_fLv1_vel_str=null;
    	this.lh2_fLv1_stPos_str=null;
        this.lh2_fLv1_edPos_str=null;
        this.lh2_fLv1_stString_str=null;
        this.lh2_fLv1_edString_str=null;
        this.lh2_fLv1_stHuiwei_str=null;
        this.lh2_fLv1_edHuiwei_str=null;
        //重置左手第二动作Lv1的相关变量。
        //
        this.lh2_fLv2_fingering_str=null;
        this.lh2_fLv2_vel_str=null;
        this.lh2_fLv2_stPos_str=null;
        this.lh2_fLv2_edPos_str=null;
        this.lh2_fLv2_stString_str=null;
        this.lh2_fLv2_edString_str=null;
        this.lh2_fLv2_stHuiwei_str=null;
    	this.lh2_fLv2_edHuiwei_str=null;
        //重置左手第二动作Lv2的相关变量。
        //
        this.lh2_fLv3_fingering_str=null;
        this.lh2_fLv3_vel_str=null;
        this.lh2_fLv3_stPos_str=null;
        this.lh2_fLv3_edPos_str=null;
        this.lh2_fLv3_stString_str=null;
        this.lh2_fLv3_edString_str=null;
        this.lh2_fLv3_stHuiwei_str=null;
        this.lh2_fLv3_edHuiwei_str=null;
        //重置左手第二动作Lv3的相关变量。
        //
        this.rh1_fLv1_fingering_str=null;
        this.rh1_fLv1_vel_str=null;
    	this.rh1_fLv1_stPos_str=null;
        this.rh1_fLv1_edPos_str=null;
        this.rh1_fLv1_stString_str=null;
        this.rh1_fLv1_edString_str=null;
        this.rh1_fLv1_stHuiwei_str=null;
        this.rh1_fLv1_edHuiwei_str=null;
        //重置右手第一动作Lv1的相关变量。
        //
        this.rh2_fLv1_fingering_str=null;
        this.rh2_fLv1_vel_str=null;
        this.rh2_fLv1_stPos_str=null;
        this.rh2_fLv1_edPos_str=null;
        this.rh2_fLv1_stString_str=null;
        this.rh2_fLv1_edString_str=null;
        this.rh2_fLv1_stHuiwei_str=null;
    	this.rh2_fLv1_edHuiwei_str=null;
        //重置右手第二动作Lv1的相关变量。
        //

	    //接下来用正则表达式分析文字谱。
        try{
          this.lh1_fLv1_fingering_str = this.getLh1_fLv1_fingering_re.exec(singleLine_str)[1];
//alert("lh1_fLv1_fingering_str"+this.lh1_fLv1_fingering_str);
        }catch(err){
          this.myOutput("没有从“"+singleLine_str+"”中识别出左手Lv1指法。");
        }
        //
        try{
          this.lh1_fLv1_edHuiwei_str = this.getLh1_fLv1_huiwei_re.exec(singleLine_str)[1];
//alert("lh1_fLv1_edHuiwei_str"+this.lh1_fLv1_edHuiwei_str);
        }catch(err){
          this.myOutput("没有从“"+singleLine_str+"”中识别出左手Lv1徽位。");
        }
        //
        try{
          this.lh1_fLv2_fingering_str = this.getLh1_fLv2_fingering_re.exec(singleLine_str)[3]
          if (this.lh1_fLv2_fingering_str == undefined){
    	    this.lh1_fLv2_fingering_str = this.getLh1_fLv2_fingering_re.exec(singleLine_str)[5];
          }
//alert("lh1_fLv2_fingering_str"+this.lh1_fLv2_fingering_str);
        }catch(err){
          this.myOutput("没有从“"+singleLine_str+"”中识别出左手Lv2指法。");
        }
    	//
        try{
          this.lh1_fLv2_edHuiwei_str = this.getLh1_fLv2_huiwei_re.exec(singleLine_str)[1];
        }catch(err){
          this.myOutput("没有从“"+singleLine_str+"”中识别出左手Lv2徽位。");
        }
        //
        try{
          this.lh1_fLv3_fingering_str = this.getLh1_fLv3_fingering_re.exec(singleLine_str)[1];
        }catch(err){
          this.myOutput("没有从“"+singleLine_str+"”中识别出左手Lv3指法。");
        }
        //
        try{
          this.rh1_fLv1_fingering_str = this.getRh1_fLv1_fingering_re.exec(singleLine_str)[2];
//alert(this.rh1_fLv1_fingering_str);
        }catch(err){
          this.myOutput("没有从“"+singleLine_str+"”中识别出右手Lv1指法。");
        }
        //
        try{
    	  this.rh1_fLv1_stString_str = this.getRh1_fLv1_stString_re.exec(singleLine_str)[2];
//alert(this.rh1_fLv1_stString_str);
        }catch(err){
          this.myOutput("没有从“"+singleLine_str+"”中识别出右手Lv1第一弦。");
        }
        //
        try{
          this.rh1_fLv1_edString_str = this.getRh1_fLv1_edString_re.exec(singleLine_str)[2];
//alert(this.rh1_fLv1_edString_str);
        }catch(err){
          this.myOutput("没有从“"+singleLine_str+"”中识别出右手Lv1第二弦。");
        }
        //
        try{
          this.rh1_fLv1_edString_str = this.getRh1_fLv1_edString_re.exec(singleLine_str)[2];
//alert(this.rh1_fLv1_edString_str);
        }catch(err){
          this.myOutput("没有从“"+singleLine_str+"”中识别出右手Lv1第二弦。");
        }
        //
        try{
    	  this.lh2_fLv1_fingering_str = this.getLh2_fLv1_fingering_re.exec(singleLine_str)[2];
//alert("lh2_fLv1_fingering_str"+this.lh2_fLv1_fingering_str);
        }catch(err){
          this.myOutput("没有从“"+singleLine_str+"”中识别出左手第二Lv1指法。");
        }
        //
        try{
          this.lh2_fLv1_edHuiwei_str = this.getLh2_fLv1_huiwei_re.exec(singleLine_str)[2];
//alert("lh2_fLv1_edHuiwei_str"+this.lh2_fLv1_edHuiwei_str);
        }catch(err){
          this.myOutput("没有从“"+singleLine_str+"”中识别出左手第二Lv1徽位。");
        }
        //
        try{
          if ((this.lh1_fLv2_fingering_str != "帶起") && (this.lh1_fLv2_fingering_str != "搯起") && (this.lh1_fLv2_fingering_str != "抓起")){
    	    this.rh1_fLv1_vel_str = this.getVel1_re.exec(singleLine_str)[3];
//alert("this.rh1_fLv1_vel_str"+this.rh1_fLv1_vel_str); 
          }else{
            this.lh1_fLv2_vel_str = this.getVel1_re.exec(singleLine_str)[3];
          }
        }catch(err){
    	  this.myOutput("没有从“"+singleLine_str+"”中识别出第一指法力度。");
        }
        //
        try{
          this.rh2_fLv1_stString_str = this.getRh2_fLv1_stString_re.exec(singleLine_str)[1];
//alert("this.rh2_fLv1_stString_str"+this.rh2_fLv1_stString_str);
        }catch(err){
          this.myOutput("没有从“"+singleLine_str+"”中识别出右手第二Lv1第一弦。");
        }
        //
        try{
          this.rh2_fLv1_vel_str = this.getVel2_re.exec(singleLine_str)[7];
//alert("this.rh2_fLv1_vel_str"+this.rh2_fLv1_vel_str); 
        }catch(err){
          this.myOutput("没有从“"+singleLine_str+"”中识别出第二指法力度。");
    	}
        //
        //
    	jz_ele = new XML("<jz></jz>");
    	//创建这个元素的内容。
    	//[未完成][省略空白元素所用的条件判断]
    	jz_ele.@type = "sound";
    	jz_ele.@st_pos = "blank";
    	jz_ele.@ed_pos = "blank";
    	//写入减字类型属性和它的值，以及属性“起止位置”（空白值）。
    	//
	    //
        //[未完成][省略空白元素所用的条件判断，下面的同类提示省略]
        lh_ele = new XML("<l_hand></l_hand>");
    	jz_ele.appendChild(lh_ele);
        //创建“左手”元素节点。
		

        lh1_fLv1_ele = this.createActionElement(this.lh1_fLv1_fingering_str,this.lh1_fLv1_vel_str,this.lh1_fLv1_stPos_str,this.lh1_fLv1_edPos_str,this.lh1_fLv1_stString_str,this.lh1_fLv1_edString_str,this.lh1_fLv1_stHuiwei_str,this.lh1_fLv1_edHuiwei_str);
    	//lh1_fLv1_ele = 
		lh_ele.appendChild(lh1_fLv1_ele);
    	//创建左手第一指法Lv1动作元素节点。
    	lh1_fLv2_ele = this.createActionElement(this.lh1_fLv2_fingering_str,this.lh1_fLv2_vel_str,this.lh1_fLv2_stPos_str,this.lh1_fLv2_edPos_str,this.lh1_fLv2_stString_str,this.lh1_fLv2_edString_str,this.lh1_fLv2_stHuiwei_str,this.lh1_fLv2_edHuiwei_str);
    	//lh1_fLv2_ele = 
		lh1_fLv1_ele.appendChild(lh1_fLv2_ele);
    	//创建左手第一指法Lv2动作元素节点。
    	lh1_fLv3_ele = this.createActionElement(this.lh1_fLv3_fingering_str,this.lh1_fLv3_vel_str,this.lh1_fLv3_stPos_str,this.lh1_fLv3_edPos_str,this.lh1_fLv3_stString_str,this.lh1_fLv3_edString_str,this.lh1_fLv3_stHuiwei_str,this.lh1_fLv3_edHuiwei_str);
    	lh1_fLv2_ele.appendChild(lh1_fLv3_ele);
    	//创建左手第一指法Lv3动作元素节点。
        //
        lh2_fLv1_ele = this.createActionElement(this.lh2_fLv1_fingering_str,this.lh2_fLv1_vel_str,this.lh2_fLv1_stPos_str,this.lh2_fLv1_edPos_str,this.lh2_fLv1_stString_str,this.lh2_fLv1_edString_str,this.lh2_fLv1_stHuiwei_str,this.lh2_fLv1_edHuiwei_str);
        lh_ele.appendChild(lh2_fLv1_ele);
    	//创建左手第二指法Lv1动作元素节点。
        lh2_fLv2_ele = this.createActionElement(this.lh2_fLv2_fingering_str,this.lh2_fLv2_vel_str,this.lh2_fLv2_stPos_str,this.lh2_fLv2_edPos_str,this.lh2_fLv2_stString_str,this.lh2_fLv2_edString_str,this.lh2_fLv2_stHuiwei_str,this.lh2_fLv2_edHuiwei_str);
        lh2_fLv1_ele.appendChild(lh2_fLv2_ele);
    	//创建左手第二指法Lv2动作元素节点。
    	lh2_fLv3_ele = this.createActionElement(this.lh2_fLv3_fingering_str,this.lh2_fLv3_vel_str,this.lh2_fLv3_stPos_str,this.lh2_fLv3_edPos_str,this.lh2_fLv3_stString_str,this.lh2_fLv3_edString_str,this.lh2_fLv3_stHuiwei_str,this.lh2_fLv3_edHuiwei_str);
    	lh2_fLv2_ele.appendChild(lh2_fLv3_ele);
    	//创建左手第二指法Lv3动作元素节点。
    	//
    	rh_ele = new XML("<r_hand></r_hand>");
    	jz_ele.appendChild(rh_ele);
    	//创建“右手”元素节点。
        rh1_fLv1_ele = this.createActionElement(this.rh1_fLv1_fingering_str,this.rh1_fLv1_vel_str,this.rh1_fLv1_stPos_str,this.rh1_fLv1_edPos_str,this.rh1_fLv1_stString_str,this.rh1_fLv1_edString_str,this.rh1_fLv1_stHuiwei_str,this.rh1_fLv1_edHuiwei_str);
        rh_ele.appendChild(rh1_fLv1_ele);
        //创建右手第一指法Lv1动作元素节点。
        rh2_fLv1_ele = this.createActionElement(this.rh2_fLv1_fingering_str,this.rh2_fLv1_vel_str,this.rh2_fLv1_stPos_str,this.rh2_fLv1_edPos_str,this.rh2_fLv1_stString_str,this.rh2_fLv1_edString_str,this.rh2_fLv1_stHuiwei_str,this.rh2_fLv1_edHuiwei_str);
        rh_ele.appendChild(rh2_fLv1_ele);
        //创建右手第二指法Lv1动作元素节点。
        //元素组装完毕[该测试了！]
//this.XMLArea_txa.text = rh_ele;
////alert("某一个tag的名称："+singleLine_str+jz_ele.childNodes[0].childNodes[0].tagName);
//this.XMLArea_txa.text = jz_ele;
        return jz_ele;
	}
	function processOnce(singleLine_str:String) {
		//[未完成][单行文字分类]
        var temp_ele:XML;
        //用于临时存储一个个子元素。
        var jz_ele:XML;
        //用于临时存储jz元素。
		if (this.isInfoOrIniOrText_re.test(singleLine_str)){
            //如果是元数据信息……
//alert("转换info/文字："+singleLine_str);
        if (this.getTitle_re.test(singleLine_str)){
            //取得标题信息，加入文档。
            temp_ele = new XML("<title></title>")
            temp_ele.setChildren(this.getTitle_re.exec(singleLine_str)[1]);
			this.info_ele.appendChild(temp_ele);
//alert("ahahahahaha"+this.getTitle_re.exec(singleLine_str));
			//加入文本子节点。
        }else if(this.getAuthor_re.test(singleLine_str)){
            //取得作者信息，加入文档。
            temp_ele = new XML("<author></author>")
            temp_ele.setChildren(this.getAuthor_re.exec(singleLine_str)[1]);
			this.info_ele.appendChild(temp_ele);
			//加入文本子节点。
        }else if(this.getStyle_re.test(singleLine_str)){
            //取得琴样式信息，加入文档。
            temp_ele = this.mainDOM_dom.head[0].initialization[0].qin_setup[0];
            temp_ele.@style=this.getStyle_re.exec(singleLine_str)[1];
        }else if(this.getMaterial_re.test(singleLine_str)){
            //取得琴弦材质信息，加入文档。
            temp_ele = this.mainDOM_dom.head[0].initialization[0].qin_setup[0].string_0[0].material[0];
            temp_ele = this.getMaterial_re.exec(singleLine_str)[1];
        }else if(this.getPitch_re.test(singleLine_str)){
        //取得琴弦材质信息，加入文档。
            temp_ele = this.mainDOM_dom.head[0].initialization[0].qin_setup[0].string_0[0].pitch[0];
            temp_ele = this.getPitch_re.exec(singleLine_str)[1];
        }else if(this.getText_re.test(singleLine_str)){
            //纯文字信息，加入文档。
//alert("纯文字信息!");
            temp_ele = new XML("<text></text>");
            temp_ele.setChildren(this.getText_re.exec(singleLine_str)[1]);
			this.jzTrack_ele.appendChild(temp_ele);
        }
        }else if (this.isCtrl_re.test(singleLine_str)){
            //如果是控制类信息……
//alert("Ctrl!");
            temp_ele = new XML("<ctrl></ctrl>");
            temp_ele.@name=this.getCtrl_re.exec(singleLine_str)[1];
            temp_ele.@st_pos="blank";
            temp_ele.@ed_pos="blank";
            try{
              temp_ele.@value=this.getCtrlValue_re.exec(singleLine_str)[2];
            }catch(err:Error){
              temp_ele.@value="blank";
            }
            //先做一个ctrl元素……
            jz_ele = new XML("<jz></jz>");
            jz_ele.@type="ctrl";
            jz_ele.@st_pos="blank";
            jz_ele.@ed_pos="blank";
            //再做一个jz元素……
            jz_ele.appendChild(temp_ele);
            //组合……
            this.jzTrack_ele.appendChild(jz_ele);
            //组装进文档！
        }else {
//this.XMLArea_txa.text = this.jzTrack_ele;
            //要么就是普通指法了！
            //alert("转换："+singleLine_str);
            this.jzTrack_ele.appendChild(this.singleJzConversion(singleLine_str));
        }
        this.lineCounter_int++;
        //计数器增加。
        if ((this.lineCounter_int + 1) <= this.stringsArray_array.length) {
            //如果计数+1小于数组的长度（其实也就是还没有把所有行都处理完的时候），继续准备处理下一个。否则，就结束，并输出结果。
            //this.timeIndex_int = this.setTimeout("this.processOnce(this.stringsArray_array[this.lineCounter_int])",this.processInterval_int);
//this.XMLArea_txa.text += this.lineCounter_int + "处理中！" + this.stringsArray_array.length;
        }else {
			this.privateTimer_tmr.stop();
			//把所有行都处理完，就停止定时器。
            this.XMLArea_txa.text += this.XMLToString(this.mainDOM_dom);
			//输出文档。
//this.XMLArea_txa.text += "处理完毕！"+ this.stringsArray_array.length;
            this.myRootObj.JZPReceiver(this.mainDOM_dom);
			//向显示器传递文档。
			this.startButton_btn.enabled = true;
			this.startButton_btn.label = "生成减字谱";
        }
	}
	function startConversion(Event:MouseEvent) {
        //开始批量转换！
        var temp_ele:XML;
        //alert("Hello World!");
        this.mainDOM_dom = new XML(this.myXML_str);


        //分析出一个xml文档的基本部分。
        this.jzTrack_ele = this.mainDOM_dom.tracks[0].group[0].jz_track[0];
        this.info_ele = this.mainDOM_dom.head[0].info[0];
        //
        temp_ele = new XML("<software></software>");
        temp_ele.software[0] = "FreeQinWZPConverter";
        temp_ele.@version = this.version_str;
		this.info_ele.appendChild(temp_ele);
        //将software信息元素加入info里。
//this.XMLArea_txa.text += XMLToString(this.mainDOM_dom);
        this.stringsArray_array = this.inputArea_txa.text.split(/(\r)/);
		//去除空白项目。
		for (var i = 0; i <= (this.stringsArray_array.length - 1);i++ ) {
			if (String(this.stringsArray_array[i]) == "\r") {
//this.XMLArea_txa.text +="抓到拉！！！！！！！！！";
				this.stringsArray_array.splice(i, 1);
			}
		}
trace (this.stringsArray_array);
        //把输入的一行行文字分拆，存入数组。
		try {
			//如果数组不是空数组，就开始工作了！
            this.lineCounter_int = 0;
            //行计数器归零。
			this.startButton_btn.enabled = false;
			this.startButton_btn.label = "请稍候……";
            this.privateTimer_tmr.start();
		    //开始转换！
		}catch (err:Error) {
			trace(err);
		}
		
    }
	}
}
