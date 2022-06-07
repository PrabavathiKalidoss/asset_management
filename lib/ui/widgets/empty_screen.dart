
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/res/spacing.dart';
import '../../core/res/styles.dart';

class EmptyScreen extends StatelessWidget{

  final String imageUrl;
  final String text;


  EmptyScreen({required this.imageUrl,required this.text});


  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SvgPicture.asset(imageUrl),

          VerticalSpacing.custom(value: 22.0),

          Text(text,style: AppTextStyle.heading1Medium.copyWith(fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }

}