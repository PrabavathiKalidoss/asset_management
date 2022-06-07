
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'fontsize.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {

  static const String fontFamily = "Manrope";

  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColor.primary,
    primaryColorDark: AppColor.primary,
    dividerColor: AppColor.outline,
    indicatorColor: AppColor.primary,
    backgroundColor: AppColor.white,
    fontFamily: fontFamily,
    scaffoldBackgroundColor: AppColor.surface,
    appBarTheme: const AppBarTheme(
      color: AppColor.white,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.textOnPrimary,),
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColor.textOnPrimary,
          letterSpacing: 0.1
      )
    )
  );

  static final List<BoxShadow> cardShadow = [
    BoxShadow(color: Colors.black.withOpacity(0.08), spreadRadius:0, blurRadius:4),
  ];

  static const Widget customDivider = SizedBox(height: 0.6, child: Divider(color: AppColor.divider, thickness:1,),);


  static Decoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );

  static final List<BoxShadow> mildCardShadow = [
    BoxShadow(color: AppColor.secondary.withOpacity(0.2), spreadRadius: 0.5, blurRadius: 1),
  ];

  static List<Shadow> textShadow = <Shadow>[
    const Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 3.0,
      color: Colors.black12,
    ),
    const Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 8.0,
      color: Colors.black12,
    ),
  ];

}

class AppTextStyle {

  static  TextStyle display1Medium = TextStyle(
      fontSize: AppFontSize.dp64.sp,letterSpacing: 0,
      fontWeight: FontWeight.w500,height: 1.125,
      color: AppColor.textOnPrimary
  );

  static  TextStyle display1SemiBold = TextStyle(
      fontSize: AppFontSize.dp64.sp,letterSpacing: 0,
      fontWeight: FontWeight.w600,height: 1.125,
      color: AppColor.textOnPrimary
  );
  static  TextStyle display1Bold = TextStyle(
      fontSize: AppFontSize.dp64.sp,letterSpacing: 0,
      fontWeight: FontWeight.w700,height: 1.125,
      color: AppColor.textOnPrimary
  );

//
  static  TextStyle display2Medium = TextStyle(
      fontSize: AppFontSize.dp56.sp,letterSpacing: 0,
      fontWeight: FontWeight.w500,height: 1.14,
      color: AppColor.textOnPrimary
  );

  static  TextStyle display2SemiBold = TextStyle(
      fontSize: AppFontSize.dp56.sp,letterSpacing: 0,
      fontWeight: FontWeight.w600,height: 1.14,
      color: AppColor.textOnPrimary
  );
  static  TextStyle display2Bold = TextStyle(
      fontSize: AppFontSize.dp56.sp,letterSpacing: 0,
      fontWeight: FontWeight.w700,height: 1.14,
      color: AppColor.textOnPrimary
  );


  //
  static  TextStyle display3Medium = TextStyle(
      fontSize: AppFontSize.dp40.sp,letterSpacing: 0,
      fontWeight: FontWeight.w500,height: 1.20,
      color: AppColor.textOnPrimary
  );

  static  TextStyle display3SemiBold = TextStyle(
      fontSize: AppFontSize.dp40.sp,letterSpacing: 0,
      fontWeight: FontWeight.w600,height: 1.20,
      color: AppColor.textOnPrimary
  );
  static  TextStyle display3Bold = TextStyle(
      fontSize: AppFontSize.dp40.sp,letterSpacing: 0,
      fontWeight: FontWeight.w700,height: 1.20,
      color: AppColor.textOnPrimary
  );

//
  static  TextStyle heading1Medium = TextStyle(
      fontSize: AppFontSize.dp32.sp,letterSpacing: 0,
      fontWeight: FontWeight.w500,height: 1.25,
      color: AppColor.textOnPrimary
  );

  static  TextStyle heading1SemiBold = TextStyle(
      fontSize: AppFontSize.dp32.sp,letterSpacing: 0,
      fontWeight: FontWeight.w600,height: 1.25,
      color: AppColor.textOnPrimary
  );
  static  TextStyle  heading1Bold = TextStyle(
      fontSize: AppFontSize.dp32.sp,letterSpacing: 0,
      fontWeight: FontWeight.w700,height: 1.25,
      color: AppColor.textOnPrimary
  );

//
  static  TextStyle heading2Medium = TextStyle(
      fontSize: AppFontSize.dp28.sp,letterSpacing: 0,
      fontWeight: FontWeight.w500,height: 1.13,
      color: AppColor.textOnPrimary
  );

  static  TextStyle heading2SemiBold = TextStyle(
      fontSize: AppFontSize.dp28.sp,letterSpacing: 0,
      fontWeight: FontWeight.w600,height: 1.13,
      color: AppColor.textOnPrimary
  );
  static  TextStyle heading2Bold = TextStyle(
      fontSize: AppFontSize.dp28.sp,letterSpacing: 0,
      fontWeight: FontWeight.w700,height: 1.13,
      color: AppColor.textOnPrimary
  );

  //

  static  TextStyle heading3Medium = TextStyle(
      fontSize: AppFontSize.dp24.sp,letterSpacing: 0,
      fontWeight: FontWeight.w500,height: 1.33,
      color: AppColor.textOnPrimary
  );

  static  TextStyle heading3SemiBold = TextStyle(
      fontSize: AppFontSize.dp24.sp,letterSpacing: 0,
      fontWeight: FontWeight.w600,height: 1.33,
      color: AppColor.textOnPrimary
  );
  static  TextStyle heading3Bold = TextStyle(
      fontSize: AppFontSize.dp24.sp,letterSpacing: 0,
      fontWeight: FontWeight.w700,height: 1.33,
      color: AppColor.textOnPrimary
  );

  //
  static  TextStyle title1Medium = TextStyle(
      fontSize: AppFontSize.dp20.sp,letterSpacing: 0,
      fontWeight: FontWeight.w500,height: 1.30,
      color: AppColor.textOnPrimary
  );

  static  TextStyle title1SemiBold = TextStyle(
      fontSize: AppFontSize.dp20.sp,letterSpacing: 0,
      fontWeight: FontWeight.w600,height: 1.30,
      color: AppColor.textOnPrimary
  );
  static  TextStyle title1Bold = TextStyle(
      fontSize: AppFontSize.dp20.sp,letterSpacing: 0,
      fontWeight: FontWeight.w700,height: 1.30,
      color: AppColor.textOnPrimary
  );

  //
  static  TextStyle title2Medium = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w500,height: 1.50,
      color: AppColor.textOnPrimary
  );

  static  TextStyle title2SemiBold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w600,height: 1.50,
      color: AppColor.textOnPrimary
  );
  static  TextStyle title2Bold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w700,height: 1.50,
      color: AppColor.textOnPrimary
  );

//
  static  TextStyle title3Medium = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w500,height: 1.43,
      color: AppColor.textOnPrimary
  );

  static  TextStyle title3SemiBold = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w600,height: 1.43,
      color: AppColor.textOnPrimary
  );
  static  TextStyle title3Bold = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w700,height: 1.43,
      color: AppColor.textOnPrimary
  );

  //
  static  TextStyle label1Medium = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w500,height: 1.50,
      color: AppColor.textOnPrimary
  );
  static  TextStyle label1Regular = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w400,height: 1.50,
      color: AppColor.textOnPrimary
  );

  static  TextStyle label1SemiBold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w600,height: 1.50,
      color: AppColor.textOnPrimary
  );
  static  TextStyle label1Bold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w700,height: 1.50,
      color: AppColor.textOnPrimary
  );

  //
  static  TextStyle label2Medium = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w500,height: 1.43,
      color: AppColor.textOnPrimary
  );
  static  TextStyle label2Regular = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w400,height: 1.43,
      color: AppColor.textOnPrimary
  );

  static  TextStyle label2SemiBold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w600,height: 1.43,
      color: AppColor.textOnPrimary
  );
  static  TextStyle label2Bold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w700,height: 1.43,
      color: AppColor.textOnPrimary
  );
//
  static  TextStyle label3Medium = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w500,height: 1.33,
      color: AppColor.textOnPrimary
  );
  static  TextStyle label3Regular = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w400,height: 1.33,
      color: AppColor.textOnPrimary
  );

  static  TextStyle label3SemiBold = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w600,height: 1.33,
      color: AppColor.textOnPrimary
  );
  static  TextStyle label3Bold = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w700,height: 1.33,
      color: AppColor.textOnPrimary
  );

  //
  static  TextStyle label4SemiBold = TextStyle(
      fontSize: AppFontSize.dp10.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w600,height: 1.33,
      color: AppColor.textOnPrimary
  );
  static  TextStyle label4Bold = TextStyle(
      fontSize: AppFontSize.dp10.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w700,height: 1.33,
      color: AppColor.textOnPrimary
  );

  //
  static  TextStyle button1 = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.25,
      fontWeight: FontWeight.w500,height: 1.43,
      color: AppColor.textOnPrimary
  );
  static  TextStyle button2 = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.25,
      fontWeight: FontWeight.w500,height: 1.50,
      color: AppColor.textOnPrimary
  );

  //
  static  TextStyle body1Medium = TextStyle(
      fontSize: AppFontSize.dp18.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w500,height: 1.44,
      color: AppColor.textOnPrimary
  );
  static  TextStyle body1Regular = TextStyle(
      fontSize: AppFontSize.dp18.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w400,height: 1.44,
      color: AppColor.textOnPrimary
  );

  static  TextStyle body1SemiBold = TextStyle(
      fontSize: AppFontSize.dp18.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w600,height: 1.44,
      color: AppColor.textOnPrimary
  );
  static  TextStyle body1Bold = TextStyle(
      fontSize: AppFontSize.dp18.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w700,height: 1.44,
      color: AppColor.textOnPrimary
  );


  //
  static  TextStyle body2Medium = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w500,height: 1.50,
      color: AppColor.textOnPrimary
  );
  static  TextStyle body2Regular = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w400,height: 1.50,
      color: AppColor.textOnPrimary
  );

  static  TextStyle body2SemiBold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w600,height: 1.50,
      color: AppColor.textOnPrimary
  );
  static  TextStyle body2Bold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w700,height: 1.50,
      color: AppColor.textOnPrimary
  );

  //
  static  TextStyle body3Medium = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w500,height: 1.43,
      color: AppColor.textOnPrimary
  );
  static  TextStyle body3Regular = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w400,height: 1.43,
      color: AppColor.textOnPrimary
  );

  static  TextStyle body3SemiBold = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w600,height: 1.43,
      color: AppColor.textOnPrimary
  );
  static  TextStyle body3Bold = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w700,height: 1.43,
      color: AppColor.textOnPrimary
  );

  //
  static  TextStyle body4Medium = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w500,height: 1.50,
      color: AppColor.textOnPrimary
  );
  static  TextStyle body4Regular = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w400,height: 1.50,
      color: AppColor.textOnPrimary
  );

  static  TextStyle body4SemiBold = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w600,height: 1.50,
      color: AppColor.textOnPrimary
  );
  static  TextStyle body4Bold = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w700,height: 1.50,
      color: AppColor.textOnPrimary
  );


}