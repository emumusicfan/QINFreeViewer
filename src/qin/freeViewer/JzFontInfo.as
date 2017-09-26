package qin.freeViewer{
	public class JzFontInfo {
		//这个类包含了字体的一些信息。
		public var normalRect_width_num:Number = 230;
		public var normalRect_height_num:Number = 200;
                //标准字框大小。
		public var scale_lv1_lv2WithNothing_offsetX_num:Number = 0;
		public var scale_lv1_lv2WithNothing_offsetY_num:Number = 0;
		public var scale_lv1_lv2WithNothing_width_num:Number = 1;
		public var scale_lv1_lv2WithNothing_height_num:Number = 1;
		//Lv1中，右手指法为“挑”、“勾”这一类时，lv2的相关信息。右手指法是“撮”这一类时不适用。
		public var scale_lv1_lv2LWithCuo_offsetX_num:Number = 0;
		public var scale_lv1_lv2LWithCuo_offsetY_num:Number = 0.5;
		public var scale_lv1_lv2LWithCuo_width_num:Number = 0.6;
		public var scale_lv1_lv2LWithCuo_height_num:Number = 0.7;
		//Lv1中，右手指法为“撮”时，左边lv2的相关信息。
		public var scale_lv1_lv2RWithCuo_offsetX_num:Number = 0.9;
		public var scale_lv1_lv2RWithCuo_offsetY_num:Number = 0.5;
		public var scale_lv1_lv2RWithCuo_width_num:Number = 0.6;
		public var scale_lv1_lv2RWithCuo_height_num:Number = 0.7;
		//Lv1中，右手指法为“撮”时，右边lv2的相关信息。
		//“撮”。
		public var scale_lv1_Cuo_offsetX_num:Number = 0;
		public var scale_lv1_Cuo_offsetY_num:Number = 0;
		public var scale_lv1_Cuo_width_num:Number = 1.5;
		public var scale_lv1_Cuo_height_num:Number = 1.2;
		//Lv1中，“撮”的相关信息。
                //
		public var scale_lv2_lhFingeringWithoutHuifen_offsetX_num:Number = 0;
		public var scale_lv2_lhFingeringWithoutHuifen_offsetY_num:Number = 0;
		public var scale_lv2_lhFingeringWithoutHuifen_width_num:Number = 1;
		public var scale_lv2_lhFingeringWithoutHuifen_height_num:Number = 0.3;
		//Lv2中，左手指法为“散”时，左手指法自身的相关信息。
		public var scale_lv2_lhFingeringWithHuiWithoutFen_offsetX_num:Number = 0;
		public var scale_lv2_lhFingeringWithHuiWithoutFen_offsetY_num:Number = 0;
		public var scale_lv2_lhFingeringWithHuiWithoutFen_width_num:Number = 0.4;
		public var scale_lv2_lhFingeringWithHuiWithoutFen_height_num:Number = 0.5;
		//Lv2中，左手指法为“大”“食”这一类且只显示徽位（即徽位为整）时，左手指法自身的相关信息。
		public var scale_lv2_lhFingeringWithHuifen_offsetX_num:Number = 0;
		public var scale_lv2_lhFingeringWithHuifen_offsetY_num:Number = 0;
		public var scale_lv2_lhFingeringWithHuifen_width_num:Number = 0.4;
		public var scale_lv2_lhFingeringWithHuifen_height_num:Number = 0.5;
		//Lv2中，左手指法为“大”“食”这一类且显示分（即徽位不为整）时，时，左手指法自身的相关信息。
		public var scale_lv2_lhHuiWithoutFen_offsetX_num:Number = 0.4;
		public var scale_lv2_lhHuiWithoutFen_offsetY_num:Number = 0;
		public var scale_lv2_lhHuiWithoutFen_width_num:Number = 0.6;
		public var scale_lv2_lhHuiWithoutFen_height_num:Number = 0.5;
		//Lv2中，只显示徽（即徽位为整）时，徽自身的相关信息。
		public var scale_lv2_lhHui1WithoutFen_offsetX_num:Number = 0.4;
		public var scale_lv2_lhHui1WithoutFen_offsetY_num:Number = 0.2;
		public var scale_lv2_lhHui1WithoutFen_width_num:Number = 0.6;
		public var scale_lv2_lhHui1WithoutFen_height_num:Number = 0.05;
		//Lv2中，只显示徽（即徽位为整）时，一徽自身的相关信息。
                //因为一徽的“一”很扁，所以其x、y、宽、高用一组单独的值。
		public var scale_lv2_lhHuiWithFen_offsetX_num:Number = 0.4;
		public var scale_lv2_lhHuiWithFen_offsetY_num:Number = 0;
		public var scale_lv2_lhHuiWithFen_width_num:Number = 0.6;
		public var scale_lv2_lhHuiWithFen_height_num:Number = 0.23;
		//Lv2中，显示徽也显示分（即徽位不为整）时，徽自身的相关信息。
		public var scale_lv2_lhHui1WithFen_offsetX_num:Number = 0.4;
		public var scale_lv2_lhHui1WithFen_offsetY_num:Number = 0.1;
		public var scale_lv2_lhHui1WithFen_width_num:Number = 0.6;
		public var scale_lv2_lhHui1WithFen_height_num:Number = 0.05;
		//Lv2中，显示徽也显示分（即徽位不为整）时，一徽自身的相关信息。
                //因为一徽的“一”很扁，所以其x、y、宽、高用一组单独的值。
		public var scale_lv2_lhFen_offsetX_num:Number = 0.4;
		public var scale_lv2_lhFen_offsetY_num:Number = 0.25;
		public var scale_lv2_lhFen_width_num:Number = 0.6;
		public var scale_lv2_lhFen_height_num:Number = 0.23;
		//Lv2中，显示徽也显示分（即徽位不为整）时，分的相关信息。
		public var scale_lv2_lhFen1_offsetX_num:Number = 0.4;
		public var scale_lv2_lhFen1_offsetY_num:Number = 0.35;
		public var scale_lv2_lhFen1_width_num:Number = 0.6;
		public var scale_lv2_lhFen1_height_num:Number = 0.05;
		//Lv2中，显示徽也显示分（即徽位不为整）时，一分的相关信息。
                //因为一分的“一”很扁，所以其x、y、宽、高用一组单独的值。
		public var scale_lv2_ChuoWithHuiWithoutFen_offsetX_num:Number = 0.4;
		public var scale_lv2_ChuoWithHuiWithoutFen_offsetY_num:Number = 0.5;
		public var scale_lv2_ChuoWithHuiWithoutFen_width_num:Number = 0.3;
		public var scale_lv2_ChuoWithHuiWithoutFen_height_num:Number = 0.2;
		//Lv2中，只显示徽（即徽位为整）时，绰的相关信息。
		public var scale_lv2_ChuoWithHuifen_offsetX_num:Number = 0.4;
		public var scale_lv2_ChuoWithHuifen_offsetY_num:Number = 0.5;
		public var scale_lv2_ChuoWithHuifen_width_num:Number = 0.3;
		public var scale_lv2_ChuoWithHuifen_height_num:Number = 0.2;
		//Lv2中，显示徽也显示分（即徽位不为整）时，绰的相关信息。
		public var scale_lv2_ZhuWithHuiWithoutFen1_offsetX_num:Number = 0;
		public var scale_lv2_ZhuWithHuiWithoutFen1_offsetY_num:Number = 0.5;
		public var scale_lv2_ZhuWithHuiWithoutFen1_width_num:Number = 0.35;
		public var scale_lv2_ZhuWithHuiWithoutFen1_height_num:Number = 0.5;
		//Lv2中，只显示徽（即徽位为整）时，高度最小的注的相关信息。
		public var scale_lv2_ZhuWithHuiWithoutFen2_offsetX_num:Number = 0;
		public var scale_lv2_ZhuWithHuiWithoutFen2_offsetY_num:Number = 0.5;
		public var scale_lv2_ZhuWithHuiWithoutFen2_width_num:Number = 0.35;
		public var scale_lv2_ZhuWithHuiWithoutFen2_height_num:Number = 0.5;
		//Lv2中，只显示徽（即徽位为整）时，高度中等的注的相关信息。
		public var scale_lv2_ZhuWithHuiWithoutFen3_offsetX_num:Number = 0;
		public var scale_lv2_ZhuWithHuiWithoutFen3_offsetY_num:Number = 0.5;
		public var scale_lv2_ZhuWithHuiWithoutFen3_width_num:Number = 0.35;
		public var scale_lv2_ZhuWithHuiWithoutFen3_height_num:Number = 0.5;
		//Lv2中，只显示徽（即徽位为整）时，高度最大的注的相关信息。
		public var scale_lv2_ZhuWithHuifen1_offsetX_num:Number = 0;
		public var scale_lv2_ZhuWithHuifen1_offsetY_num:Number = 0.55;
		public var scale_lv2_ZhuWithHuifen1_width_num:Number = 0.35;
		public var scale_lv2_ZhuWithHuifen1_height_num:Number = 0.5;
		//Lv2中，显示徽也显示分（即徽位不为整）时，高度最小的注的相关信息。
		public var scale_lv2_ZhuWithHuifen2_offsetX_num:Number = 0;
		public var scale_lv2_ZhuWithHuifen2_offsetY_num:Number = 0.5;
		public var scale_lv2_ZhuWithHuifen2_width_num:Number = 0.35;
		public var scale_lv2_ZhuWithHuifen2_height_num:Number = 0.5;
		//Lv2中，显示徽也显示分（即徽位不为整）时，高度中等的注的相关信息。
		public var scale_lv2_ZhuWithHuifen3_offsetX_num:Number = 0;
		public var scale_lv2_ZhuWithHuifen3_offsetY_num:Number = 0.5;
		public var scale_lv2_ZhuWithHuifen3_width_num:Number = 0.35;
		public var scale_lv2_ZhuWithHuifen3_height_num:Number = 0.5;
		//Lv2中，显示徽也显示分（即徽位不为整）时，高度最大的注的相关信息。
		
		public var scale_lv2_DaiqiWithHuiWithoutFen_offsetX_num:Number = 0;
		public var scale_lv2_DaiqiWithHuiWithoutFen_offsetY_num:Number = 0.5;
		public var scale_lv2_DaiqiWithHuiWithoutFen_width_num:Number = 1;
		public var scale_lv2_DaiqiWithHuiWithoutFen_height_num:Number = 0.5;
		//Lv2中，只显示徽（即徽位为整）时，“带起”的相关信息。
		public var scale_lv2_DaiqiWithHuifen_offsetX_num:Number = 0;
		public var scale_lv2_DaiqiWithHuifen_offsetY_num:Number = 0.5;
		public var scale_lv2_DaiqiWithHuifen_width_num:Number = 1;
		public var scale_lv2_DaiqiWithHuifen_height_num:Number = 0.5;
		//Lv2中，显示徽也显示分（即徽位不为整）时，“带起”的相关信息。
		public var scale_lv2_TaoqiWithHuiWithoutFen_offsetX_num:Number = 0;
		public var scale_lv2_TaoqiWithHuiWithoutFen_offsetY_num:Number = 0.5;
		public var scale_lv2_TaoqiWithHuiWithoutFen_width_num:Number = 1;
		public var scale_lv2_TaoqiWithHuiWithoutFen_height_num:Number = 0.5;
		//Lv2中，只显示徽（即徽位为整）时，“搯起”的相关信息。
		public var scale_lv2_TaoqiWithHuifen_offsetX_num:Number = 0;
		public var scale_lv2_TaoqiWithHuifen_offsetY_num:Number = 0.5;
		public var scale_lv2_TaoqiWithHuifen_width_num:Number = 1;
		public var scale_lv2_TaoqiWithHuifen_height_num:Number = 0.5;
		//Lv2中，显示徽也显示分（即徽位不为整）时，“搯起”的相关信息。
		public var scale_lv2_ZhuaqiWithHuiWithoutFen_offsetX_num:Number = 0;
		public var scale_lv2_ZhuaqiWithHuiWithoutFen_offsetY_num:Number = 0.5;
		public var scale_lv2_ZhuaqiWithHuiWithoutFen_width_num:Number = 1;
		public var scale_lv2_ZhuaqiWithHuiWithoutFen_height_num:Number = 0.5;
		//Lv2中，只显示徽（即徽位为整）时，“抓起”的相关信息。
		public var scale_lv2_ZhuaqiWithHuifen_offsetX_num:Number = 0;
		public var scale_lv2_ZhuaqiWithHuifen_offsetY_num:Number = 0.5;
		public var scale_lv2_ZhuaqiWithHuifen_width_num:Number = 1;
		public var scale_lv2_ZhuaqiWithHuifen_height_num:Number = 0.5;
		//Lv2中，显示徽也显示分（即徽位不为整）时，“抓起”的相关信息。
		
		public var scale_lv2_lv3WithLhFSan_offsetX_num:Number = 0;
		public var scale_lv2_lv3WithLhFSan_offsetY_num:Number = 0.3;
		public var scale_lv2_lv3WithLhFSan_width_num:Number = 1;
		public var scale_lv2_lv3WithLhFSan_height_num:Number = 0.7;
		//Lv2中，左手指法为“散”，且无“绰”、“注”时，lv3的相关信息。
		public var scale_lv2_lv3WithHuiWithoutFenWithoutChuozhu_offsetX_num:Number = 0;
		public var scale_lv2_lv3WithHuiWithoutFenWithoutChuozhu_offsetY_num:Number = 0.5;
		public var scale_lv2_lv3WithHuiWithoutFenWithoutChuozhu_width_num:Number = 1;
		public var scale_lv2_lv3WithHuiWithoutFenWithoutChuozhu_height_num:Number = 0.5;
		//Lv2中，只显示徽（即徽位为整），且无“绰”、“注”时，lv3的相关信息。
		public var scale_lv2_lv3WithHuiWithoutFenWithChuo_offsetX_num:Number = 0;
		public var scale_lv2_lv3WithHuiWithoutFenWithChuo_offsetY_num:Number = 0.6;
		public var scale_lv2_lv3WithHuiWithoutFenWithChuo_width_num:Number = 1;
		public var scale_lv2_lv3WithHuiWithoutFenWithChuo_height_num:Number = 0.5;
		//Lv2中，只显示徽（即徽位为整），且有“绰”时，lv3的相关信息。
		public var scale_lv2_lv3WithHuiWithoutFenWithZhu_offsetX_num:Number = 0.3;
		public var scale_lv2_lv3WithHuiWithoutFenWithZhu_offsetY_num:Number = 0.5;
		public var scale_lv2_lv3WithHuiWithoutFenWithZhu_width_num:Number = 0.7;
		public var scale_lv2_lv3WithHuiWithoutFenWithZhu_height_num:Number = 0.5;
		//Lv2中，只显示徽（即徽位为整），且有“注”时，lv3的相关信息。
		public var scale_lv2_lv3WithHuifenWithoutChuozhu_offsetX_num:Number = 0;
		public var scale_lv2_lv3WithHuifenWithoutChuozhu_offsetY_num:Number = 0.5;
		public var scale_lv2_lv3WithHuifenWithoutChuozhu_width_num:Number = 1;
		public var scale_lv2_lv3WithHuifenWithoutChuozhu_height_num:Number = 0.5;
		//Lv2中，显示徽也显示分（即徽位不为整），且无“绰”、“注”时，lv3的相关信息。
		public var scale_lv2_lv3WithHuifenWithChuo_offsetX_num:Number = 0;
		public var scale_lv2_lv3WithHuifenWithChuo_offsetY_num:Number = 0.6;
		public var scale_lv2_lv3WithHuifenWithChuo_width_num:Number = 1;
		public var scale_lv2_lv3WithHuifenWithChuo_height_num:Number = 0.5;
		//Lv2中，显示徽也显示分（即徽位不为整），且有“绰”时，lv3的相关信息。
		public var scale_lv2_lv3WithHuifenWithZhu_offsetX_num:Number = 0.3;
		public var scale_lv2_lv3WithHuifenWithZhu_offsetY_num:Number = 0.5;
		public var scale_lv2_lv3WithHuifenWithZhu_width_num:Number = 0.7;
		public var scale_lv2_lv3WithHuifenWithZhu_height_num:Number = 0.5;
		//Lv2中，显示徽也显示分（即徽位不为整），且有“注”时，lv3的相关信息。
		//“挑”。
		public var scale_lv3_Tiao_offsetX_num:Number = 0.05;
		public var scale_lv3_Tiao_offsetY_num:Number = 0;
		public var scale_lv3_Tiao_width_num:Number = 0.95;
		public var scale_lv3_Tiao_height_num:Number = 1.1;
		//Lv3中，“挑”的相关信息。
		public var scale_lv3_lv4WithTiao_offsetX_num:Number = 0.15;
		public var scale_lv3_lv4WithTiao_offsetY_num:Number = 0.1;
		public var scale_lv3_lv4WithTiao_width_num:Number = 0.75;
		public var scale_lv3_lv4WithTiao_height_num:Number = 0.79;
		//Lv3中，右手指法为“挑”时,lv4的相关信息。
		//“勾”。
		public var scale_lv3_Gou_offsetX_num:Number = 0;
		public var scale_lv3_Gou_offsetY_num:Number = 0;
		public var scale_lv3_Gou_width_num:Number = 1;
		public var scale_lv3_Gou_height_num:Number = 1.1;
		//Lv3中，“勾”的相关信息。
		public var scale_lv3_lv4WithGou_offsetX_num:Number = 0.1;
		public var scale_lv3_lv4WithGou_offsetY_num:Number = 0.3;
		public var scale_lv3_lv4WithGou_width_num:Number = 0.7;
		public var scale_lv3_lv4WithGou_height_num:Number = 0.6;
		//Lv3中，右手指法为“勾”时,lv4的相关信息。
		//“打”。
		public var scale_lv3_Da_offsetX_num:Number = 0;
		public var scale_lv3_Da_offsetY_num:Number = 0.1;
		public var scale_lv3_Da_width_num:Number = 1;
		public var scale_lv3_Da_height_num:Number = 1;
		//Lv3中，“打”的相关信息。
		public var scale_lv3_lv4WithDa_offsetX_num:Number = 0.05;
		public var scale_lv3_lv4WithDa_offsetY_num:Number = 0.3;
		public var scale_lv3_lv4WithDa_width_num:Number = 0.7;
		public var scale_lv3_lv4WithDa_height_num:Number = 0.6;
		//Lv3中，右手指法为“打”时,lv4的相关信息。
		//“抹”。
		public var scale_lv3_Mo_offsetX_num:Number = 0;
		public var scale_lv3_Mo_offsetY_num:Number = 0;
		public var scale_lv3_Mo_width_num:Number = 1;
		public var scale_lv3_Mo_height_num:Number = 0.5;
		//Lv3中，“抹”的相关信息。
		public var scale_lv3_lv4WithMo_offsetX_num:Number = 0;
		public var scale_lv3_lv4WithMo_offsetY_num:Number = 0.5;
		public var scale_lv3_lv4WithMo_width_num:Number = 1;
		public var scale_lv3_lv4WithMo_height_num:Number = 0.5;
		//Lv3中，右手指法为“抹”时,lv4的相关信息。
		//“摘”。
		public var scale_lv3_Zhai_offsetX_num:Number = 0;
		public var scale_lv3_Zhai_offsetY_num:Number = 0;
		public var scale_lv3_Zhai_width_num:Number = 1;
		public var scale_lv3_Zhai_height_num:Number = 1;
		//Lv3中，“摘”的相关信息。
		public var scale_lv3_lv4WithZhai_offsetX_num:Number = 0.2;
		public var scale_lv3_lv4WithZhai_offsetY_num:Number = 0.5;
		public var scale_lv3_lv4WithZhai_width_num:Number = 0.6;
		public var scale_lv3_lv4WithZhai_height_num:Number = 0.4;
		//Lv3中，右手指法为“摘”时,lv4的相关信息。
		//“剔”。
		public var scale_lv3_Ti_offsetX_num:Number = 0;
		public var scale_lv3_Ti_offsetY_num:Number = 0;
		public var scale_lv3_Ti_width_num:Number = 1;
		public var scale_lv3_Ti_height_num:Number = 1;
		//Lv3中，“剔”的相关信息。
		public var scale_lv3_lv4WithTi_offsetX_num:Number = 0;
		public var scale_lv3_lv4WithTi_offsetY_num:Number = 0.5;
		public var scale_lv3_lv4WithTi_width_num:Number = 0.7;
		public var scale_lv3_lv4WithTi_height_num:Number = 0.5;
		//Lv3中，右手指法为“剔”时,lv4的相关信息。
		//“擘”。
		public var scale_lv3_Bo_offsetX_num:Number = 0;
		public var scale_lv3_Bo_offsetY_num:Number = 0;
		public var scale_lv3_Bo_width_num:Number = 1;
		public var scale_lv3_Bo_height_num:Number = 1;
		//Lv3中，“擘”的相关信息。
		public var scale_lv3_lv4WithBo_offsetX_num:Number = 0.2;
		public var scale_lv3_lv4WithBo_offsetY_num:Number = 0.35;
		public var scale_lv3_lv4WithBo_width_num:Number = 0.8;
		public var scale_lv3_lv4WithBo_height_num:Number = 0.66;
		//Lv3中，右手指法为“擘”时,lv4的相关信息。
		//“托”。
		public var scale_lv3_Tuo_offsetX_num:Number = 0;
		public var scale_lv3_Tuo_offsetY_num:Number = 0;
		public var scale_lv3_Tuo_width_num:Number = 1;
		public var scale_lv3_Tuo_height_num:Number = 1;
		//Lv3中，“托”的相关信息。
		public var scale_lv3_lv4WithTuo_offsetX_num:Number = 0.25;
		public var scale_lv3_lv4WithTuo_offsetY_num:Number = 0.1;
		public var scale_lv3_lv4WithTuo_width_num:Number = 0.7;
		public var scale_lv3_lv4WithTuo_height_num:Number = 0.72;
		//Lv3中，右手指法为“托”时,lv4的相关信息。
		//“滾”。
		public var scale_lv3_Gun_offsetX_num:Number = 0;
		public var scale_lv3_Gun_offsetY_num:Number = 0;
		public var scale_lv3_Gun_width_num:Number = 1;
		public var scale_lv3_Gun_height_num:Number = 0.5;
		//Lv3中，“滾”的相关信息。
		public var scale_lv3_lv4WithGun_offsetX_num:Number = 0;
		public var scale_lv3_lv4WithGun_offsetY_num:Number = 0.5;
		public var scale_lv3_lv4WithGun_width_num:Number = 1;
		public var scale_lv3_lv4WithGun_height_num:Number = 0.5;
		//Lv3中，右手指法为“滾”时,lv4的相关信息。
		//
		public var scale_lv3_lv4WithNothing_offsetX_num:Number = 0;
		public var scale_lv3_lv4WithNothing_offsetY_num:Number = 0;
		public var scale_lv3_lv4WithNothing_width_num:Number = 1;
		public var scale_lv3_lv4WithNothing_height_num:Number = 1;
		//Lv3中，右手指法为“撮”一类时，lv4的相关信息。就是让lv4直接占满lv3。
		public var scale_lv4_String0_offsetX_num:Number = 0;
		public var scale_lv4_String0_offsetY_num:Number = 0;
		public var scale_lv4_String0_width_num:Number = 1;
		public var scale_lv4_String0_height_num:Number = 1;
		//右手指法为“勾”时，Lv4中，弦2-7的相关信息。
		public var scale_lv4_String1_offsetX_num:Number = 0;
		public var scale_lv4_String1_offsetY_num:Number = 0.45;
		public var scale_lv4_String1_width_num:Number = 1;
		public var scale_lv4_String1_height_num:Number = 0.2;
		//右手指法为“勾”时，Lv4中，弦1的相关信息。
                //因为第一弦对应的“一”很扁，所以其x、y、宽、高用一组单独的值。
		public var scale_regRects_singleRect_width_num:Number = 0.4;
		public var scale_regRects_singleRect_height_num:Number = 0.3;
                public var scale_regRects_spacing_num:Number = 0.1;
		public var scale_regRects_singleRect1_width_num:Number = 0.4;
		public var scale_regRects_singleRect1_height_num:Number = 0.03;
                public var scale_regRects_exUpperSpacing_num:Number = 0.1;
                public var scale_regRects_exLowerSpacing_num:Number = 0.1;
                //因为“一”很扁，所以其宽、高用一组单独的值，且上下有额外的空白填充。
		//“规则矩形”的相关信息。“规则矩形”指的是“上九”、“上七六”这一类减字。


	}
}