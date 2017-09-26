package qin.freeViewer{
	import flash.events.*;
	import flash.net.*;
	import flash.display.Sprite;
	import fl.controls.*;
	import flash.geom.Matrix;
	//
	public class SuperKitListener {
		public var myRootObj:Object;
		public function testHandler(event:Event):void {
			trace("测试事件！");
		}
		public function file_frSelectHandler(event:Event):void {
			//trace("file_fr中的name是："+event.target.name);
			this.myRootObj.url_ta.text = FileReference(event.target).name;
			//给文件地址栏赋值。
			//以上是Flash Player9时代的兼容代码.
			//下面要处理打开文件。
			this.myRootObj.loadingXML_pb.visible = true;
			//开始读取数据。
			this.myRootObj.file_fr.removeEventListener(Event.SELECT, this.file_frSelectHandler);
		    this.myRootObj.file_fr.removeEventListener(Event.CANCEL, this.file_frCancelHandler);
			//移除监听器。
			this.myRootObj.file_fr.addEventListener(Event.COMPLETE, this.file_frCompleteHandler);
			this.myRootObj.file_fr.addEventListener(ProgressEvent.PROGRESS, this.file_frProgressHandler);
			//加入新监听。
		    this.myRootObj.file_fr.load();
		}
		public function file_frCancelHandler(event:Event) {
			//取消打开文件。
			this.myRootObj.file_fr.removeEventListener(Event.SELECT, this.file_frSelectHandler);
		    this.myRootObj.file_fr.removeEventListener(Event.CANCEL, this.file_frCancelHandler);
		}
		public function browse_btnClickHandler(event:MouseEvent):void {
			this.myRootObj.file_fr.addEventListener(Event.SELECT, this.file_frSelectHandler);
			this.myRootObj.file_fr.addEventListener(Event.CANCEL, this.file_frCancelHandler);
			//加入选择文件的监听器。
			this.myRootObj.file_fr.browse([new FileFilter("减字谱文件 (*.jzp)", "*.jzp"), new FileFilter("所有文件 (*.*)", "*.*")]);

		}
		public function velView_btnClickHandler(event:MouseEvent):void {
			if ((this.myRootObj.velView_btn.selected)) {
			    //显示力度。
			    for each (var jz in this.myRootObj.jz_array)
			    {
				    jz.alpha = (this.myRootObj.configObject_co.velAlphaLowerBound_num + ((jz.metaVel_num / 127) * (this.myRootObj.configObject_co.velAlphaUpperBound_num - this.myRootObj.configObject_co.velAlphaLowerBound_num)));
				    //this.myRootObj.sandboxType_lb.text = Number(this.myRootObj.JZP_xml.tracks[0].group[0].jz_track[0].jz[3].l_hand[0].action[0].action[0].@vel);
			    }
			}else {
				//隐藏力度。
				for each (var jz in this.myRootObj.jz_array) {
				    jz.alpha = 1;
				}
			}
			//this.myRootObj.main_sp.alpha = 0.9;
			
			
		}
		/*public function urlLoader_ulProgressHandler(event:Event):void {
		trace("正在读取文件！"+event.target.bytesTotal);
		this.myRootObj.loadingXML_pb.minimum = 0;
		this.myRootObj.loadingXML_pb.maximum = this.myRootObj.urlLoader_ul.bytesTotal;
		trace("a"+this.myRootObj.loadingXML_pb.maximum);
		}*/
		public function urlLoader_ulProgressHandler(event:ProgressEvent):void {
			trace("XML读取进度条刷新！"+event.bytesLoaded+"/"+event.bytesTotal);
			this.myRootObj.loadingXML_pb.setProgress(event.bytesLoaded, event.bytesTotal);
		}

		public function urlLoader_ulSecurityErrorHandler(event:SecurityErrorEvent):void {
			trace("沙箱安全错误！" + event.text);
			this.myRootObj.urlLoader_ul.removeEventListener(ProgressEvent.PROGRESS, this.myRootObj.listener_obj.urlLoader_ulProgressHandler);
			this.myRootObj.urlLoader_ul.removeEventListener(Event.COMPLETE, this.myRootObj.listener_obj.urlLoader_ulCompleteHandler);
			this.myRootObj.loadingXML_pb.visible = false;
			this.myRootObj.GUIUnlocker();
		}
		public function urlLoader_ulIOErrorHandler(event:IOErrorEvent):void {
			trace("IO错误！" + event.text);
			this.myRootObj.urlLoader_ul.removeEventListener(ProgressEvent.PROGRESS, this.myRootObj.listener_obj.urlLoader_ulProgressHandler);
			this.myRootObj.urlLoader_ul.removeEventListener(Event.COMPLETE, this.myRootObj.listener_obj.urlLoader_ulCompleteHandler);
			this.myRootObj.loadingXML_pb.visible = false;
			this.myRootObj.GUIUnlocker();
			this.myRootObj.applyFormat_btn.enabled = false;
			//再次把“改变版式”按钮锁了。
		}
		public function file_frProgressHandler(event:ProgressEvent):void {
			trace("XML读取进度条刷新！"+event.bytesLoaded+"/"+event.bytesTotal);
			this.myRootObj.loadingXML_pb.setProgress(event.bytesLoaded, event.bytesTotal);
		}
		public function urlLoader_ulCompleteHandler(event:Event):void {
			trace("XML读取完毕！");
			this.myRootObj.urlLoader_ul.removeEventListener(ProgressEvent.PROGRESS, this.myRootObj.listener_obj.urlLoader_ulProgressHandler);
			this.myRootObj.urlLoader_ul.removeEventListener(Event.COMPLETE, this.myRootObj.listener_obj.urlLoader_ulCompleteHandler);
			this.myRootObj.loadingXML_pb.visible = false;
			try {
				this.myRootObj.JZP_xml = XML(this.myRootObj.urlLoader_ul.data);
				trace("XML内容是："+this.myRootObj.JZP_xml);
				//这里需要有if！否则打开不能解析的文件也许要出错！[未完成]
				this.myRootObj.applyFormat_btn.enabled = true;
				this.applyFormat_btnClickHandler(null);
			} catch (e:Error) {
				trace("XML内容有错误！"+e);
				this.myRootObj.GUIUnlocker();
				this.myRootObj.applyFormat_btn.enabled = false;
				//再次把“改变版式”按钮锁了。
			}
		}
		public function file_frCompleteHandler(event:Event):void {
			trace("XML读取完毕！");
			this.myRootObj.file_fr.removeEventListener(ProgressEvent.PROGRESS, this.myRootObj.listener_obj.file_frProgressHandler);
			this.myRootObj.file_fr.removeEventListener(Event.COMPLETE, this.myRootObj.listener_obj.file_frCompleteHandler);
			this.myRootObj.loadingXML_pb.visible = false;
			try {
				this.myRootObj.JZP_xml = XML(this.myRootObj.file_fr.data);
				trace("XML内容是："+this.myRootObj.JZP_xml);
				//这里需要有if！否则打开不能解析的文件也许要出错！[未完成]
				this.myRootObj.applyFormat_btn.enabled = true;
				this.applyFormat_btnClickHandler(null);
			} catch (e:Error) {
				trace("XML内容有错误！"+e);
				this.myRootObj.GUIUnlocker();
				this.myRootObj.applyFormat_btn.enabled = false;
				//再次把“改变版式”按钮锁了。
			}
		}
		public function applyFormat_btnClickHandler(event:MouseEvent):void {
			trace("开始排版！");
			this.myRootObj.GUIUnlocker();
			this.myRootObj.closeDocument();
			//
			var tempMatrix:Matrix = new Matrix();
			tempMatrix.createGradientBox(1, this.myRootObj.formatManager_fm.pageHeight_num+(this.myRootObj.formatManager_fm.sideDistanceY_num)*2+10*2, ((90/180)*Math.PI), 0, 600);
			tempMatrix.scale(1, 0.31);
			this.myRootObj.formatManager_fm.jzScale_num = Number(this.myRootObj.fontSize_cb.selectedItem.data);
			this.myRootObj.formatManager_fm.lockFormat();
			//设定格式（设置formatManager_fm）[未完成]，然后进入正式的排版过程！
			Sprite(this.myRootObj.mainBg_jp).graphics.clear();
			switch (this.myRootObj.formatManager_fm.format_num) {
				case 0 :
					Sprite(this.myRootObj.mainBg_jp).graphics.beginGradientFill("linear", [0x0000FF, 0xFFFFFF], [50, 100], [0, 0xFF], tempMatrix, "pad", "RGB", 0);
					Sprite(this.myRootObj.mainBg_jp).graphics.drawRect(0, 0,this.myRootObj.formatManager_fm.pageWidth_num+(this.myRootObj.formatManager_fm.sideDistanceX_num)*2+30*2, this.myRootObj.formatManager_fm.pageHeight_num+(this.myRootObj.formatManager_fm.sideDistanceY_num)*2+10*2);
					trace("宽度是"+Sprite(this.myRootObj.mainBg_jp).width);
					//重绘背景。
					this.myRootObj.main_sp.setSize(630, 330);
					//刷新ScrollPane，使其能正确显示全部内容！
					Sprite(this.myRootObj.mainShadow_jp).x = 30 + 5;
					Sprite(this.myRootObj.mainShadow_jp).y = 10 + 5;
					Sprite(this.myRootObj.mainShadow_jp).graphics.beginFill(0x666666, 0.45);
					Sprite(this.myRootObj.mainShadow_jp).graphics.drawRect(0,0,this.myRootObj.formatManager_fm.pageWidth_num+(this.myRootObj.formatManager_fm.sideDistanceX_num)*2, this.myRootObj.formatManager_fm.pageHeight_num+(this.myRootObj.formatManager_fm.sideDistanceY_num)*2);
					//画出影子。

					//针对看起来是谱纸的那个经过自己扩展的Sprite对象。打印的话就打印它。
					Sprite(this.myRootObj.mainPaper_jp).x = 30;
					Sprite(this.myRootObj.mainPaper_jp).y = 10;
					Sprite(this.myRootObj.mainPaper_jp).graphics.beginFill(0xFFFFFF, 0.75);
					Sprite(this.myRootObj.mainPaper_jp).graphics.drawRect(0,0,this.myRootObj.formatManager_fm.pageWidth_num+(this.myRootObj.formatManager_fm.sideDistanceX_num)*2, this.myRootObj.formatManager_fm.pageHeight_num+(this.myRootObj.formatManager_fm.sideDistanceY_num)*2);
					//画了谱纸的背景。
					JzPaper(this.myRootObj.mainPaper_jp).createEmptyChild("page0_jp");
					//创建0页。以后的页在operator_op对象的typeset方法里创建。
					Sprite(this.myRootObj.mainPaper_jp).getChildByName("page0_jp").x += this.myRootObj.formatManager_fm.sideDistanceX_num;
					Sprite(this.myRootObj.mainPaper_jp).getChildByName("page0_jp").y+=this.myRootObj.formatManager_fm.sideDistanceY_num;
					//把0页移动到正确位置。
					this.myRootObj.operator_op.initialize(this.myRootObj, Sprite(this.myRootObj.mainPaper_jp.getChildByName("page0_jp")), this.myRootObj.formatManager_fm, this.myRootObj.JZP_xml.tracks[0].group[0].jz_track);
					//初始化operator_op对象。
					this.myRootObj.main_sp.update();
					trace("现在开始！Timer次数为"+this.myRootObj.JZP_xml.tracks[0].group[0].jz_track[0].elements().length());
					this.myRootObj.main_tmr.reset();
					//重置定时器。很重要！否则会导致执行次数问题！
					this.myRootObj.main_tmr.delay=1;
					if (! this.myRootObj.JZP_xml.tracks[0].group[0].jz_track[0].elements().length()==0) {
						this.myRootObj.main_tmr.repeatCount=this.myRootObj.JZP_xml.tracks[0].group[0].jz_track[0].elements().length();
						this.myRootObj.main_tmr.addEventListener(TimerEvent.TIMER, this.myRootObj.operator_op.processAnElement);
						this.myRootObj.GUILocker();
						//P.S.解锁是在Operator类里。
						this.myRootObj.processing_pb.minimum=0;
						this.myRootObj.processing_pb.maximum=this.myRootObj.JZP_xml.tracks[0].group[0].jz_track[0].elements().length();
						this.myRootObj.processing_pb.visible=true;
						//把处理进度条显示出来。
						this.myRootObj.main_tmr.start();
					}
					break;
				case 1 :
					//[还没完成] [竖排版代码] 
					break;
			}

		}
		public function openJZP_btnClickHandler(event:MouseEvent):void {
			this.myRootObj.GUILocker();
			//锁定界面。注意读取、处理结束后要调用解锁。
			this.myRootObj.urlRequest_ur.url=this.myRootObj.url_ta.text;
			this.myRootObj.urlLoader_ul.load(this.myRootObj.urlRequest_ur);
			//开始读取数据。
			this.myRootObj.loadingXML_pb.visible=true;
			this.myRootObj.urlLoader_ul.addEventListener(ProgressEvent.PROGRESS, this.myRootObj.listener_obj.urlLoader_ulProgressHandler);
			this.myRootObj.urlLoader_ul.addEventListener(Event.COMPLETE, this.myRootObj.listener_obj.urlLoader_ulCompleteHandler);
		}
		public function viewConverter_btnClickHandler(event:MouseEvent):void {
			//显示指法文字谱转换器。
			this.myRootObj.myConverter_fc.visible = !(this.myRootObj.myConverter_fc.visible);
			//切换是否显示指法文字谱转换器。
		}
		public function saveFile_btnClickHandler(event:MouseEvent):void {
			//保存文件。
			if (Boolean(this.myRootObj.JZP_xml)) {
				//如果JZP_xml不为空，就保存。
			    this.myRootObj.file_fr.save(this.myRootObj.JZP_xml, "newDocument.jzp");
			}
		}
		public function page_cbChangeHandler(event:Event):void {
			trace("用户选择切换到新页面！");
			switch (this.myRootObj.configObject_co.mode_num) {
				case 0 :
					this.myRootObj.mainPaper_jp.getChildByName("page_"+String(this.myRootObj.currentPg_num)+"_jp").visible=false;
					//让当前页面不可见。
					this.myRootObj.mainPaper_jp.getChildByName("page_"+String(this.myRootObj.page_cb.selectedItem.data)+"_jp").visible=true;
					//让用户选择的目标页面可见。
					this.myRootObj.currentPg_num=this.myRootObj.page_cb.selectedItem.data;
					//设置好当前页面的计数。
					this.myRootObj.pageNumber_txt.text="第"+String(this.myRootObj.currentPg_num)+"页";
					this.myRootObj.mainPaper_jp.addChild(this.myRootObj.pageNumber_txt);
					if (this.myRootObj.formatManager_fm.pgNumPosAutoChange_bool) {
						//如果开启了页码栏左右位置交替功能，就做对应处理。
						if (this.myRootObj.currentPg_num%2==1) {
							//如果当前页码是奇数，那就在原位置显示页码栏。
							switch (this.myRootObj.formatManager_fm.pgNumPosition_uint) {
								case 1 :
									this.myRootObj.viewPageNumber(1);
									break;
								case 2 :
									this.myRootObj.viewPageNumber(2);
									break;
								case 3 :
									this.myRootObj.viewPageNumber(3);
									break;
								case 4 :
									this.myRootObj.viewPageNumber(4);
									break;
								case 5 :
									this.myRootObj.viewPageNumber(5);
									break;
								case 6 :
									this.myRootObj.viewPageNumber(6);
									break;
								case 7 :
									this.myRootObj.viewPageNumber(7);
									break;
								case 8 :
									this.myRootObj.viewPageNumber(8);
									break;
								case 9 :
									this.myRootObj.viewPageNumber(9);
									break;
							}
						} else {
							//如果当前页码是偶数，页码栏就换到对侧显示。
							switch (this.myRootObj.formatManager_fm.pgNumPosition_uint) {
								case 1 :
									this.myRootObj.viewPageNumber(3);
									break;
								case 2 :
									this.myRootObj.viewPageNumber(2);
									break;
								case 3 :
									this.myRootObj.viewPageNumber(1);
									break;
								case 4 :
									this.myRootObj.viewPageNumber(6);
									break;
								case 5 :
									this.myRootObj.viewPageNumber(5);
									break;
								case 6 :
									this.myRootObj.viewPageNumber(4);
									break;
								case 7 :
									this.myRootObj.viewPageNumber(9);
									break;
								case 8 :
									this.myRootObj.viewPageNumber(8);
									break;
								case 9 :
									this.myRootObj.viewPageNumber(7);
									break;
							}
						}
					} else {
						//如果没打开页码栏左右交替功能，就正常显示页码栏。
						this.myRootObj.viewPageNumber(this.myRootObj.formatManager_fm.pgNumPosition_uint);
					}
					break;
				case 1 :
					//1模式下的代码。（预排版后，用户切换页码，程序生成相应页面。）[未完成]
					break;
			}
		}
	}
}