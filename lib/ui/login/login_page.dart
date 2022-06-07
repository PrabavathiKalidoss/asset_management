
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/enum/view_state.dart';
import '../../core/res/colors.dart';
import '../../core/res/images.dart';
import '../../core/res/spacing.dart';
import '../../core/res/styles.dart';
import '../widgets/button.dart';
import '../widgets/edit_text_field.dart';
import '../widgets/tap_outside_unfocus.dart';
import 'login_view_model.dart';

class LogInPage extends ViewModelBuilderWidget<LogInViewModel>{

  @override
  Widget builder(BuildContext context, LogInViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: TapOutsideUnFocus(
          child: Form(
            key: viewModel.logInFormKey,
            child: SingleChildScrollView(
              controller: viewModel.scrollController,
              child: Container(
                margin: const EdgeInsets.only(left: 16.0,right: 16.0, top: 28, bottom: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Image.asset(Images.appLogo,height: 58.w),

                    VerticalSpacing.custom(value: 28),

                    Text("Login",style: AppTextStyle.title1Bold.copyWith(color: AppColor.textOnSecondary),),

                    VerticalSpacing.custom(value: 8),

                    Text("Enter your 10 digit mobile number to proceed",style: AppTextStyle.label3Medium.copyWith(color: AppColor.textOnSecondary.withOpacity(0.6)),),


                    VerticalSpacing.d20px(),

                    EditTextField(
                      "",
                      viewModel.mobileNumController,
                      placeholder: "————— —————",
                      maxLength: 10,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 4.0,left: 4.0),
                        child: Text("+91",style:AppTextStyle.title3Medium,textAlign: TextAlign.center,),
                      ),
                      onChanged: (value){},
                      onSubmitted: (val){
                       FocusNode().requestFocus();
                      },
                    ),

                    VerticalSpacing.custom(value: 24.0),

                    Button(
                        "Continue",
                        key: const ValueKey("btnContinue"),
                        width: double.infinity,
                        isLoading: viewModel.state == ViewState.Busy,
                        onPressed: (){
                      viewModel.login();
                    },
                    ),

                    VerticalSpacing.custom(value: 15.0),


                    Align(
                      alignment: Alignment.center,
                        child: Text("by clicking, I acccept the Terms & Condition & Privacy Policy",style: AppTextStyle.label3Regular.copyWith(fontSize: 10,color: AppColor.textOnSecondary),)),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  LogInViewModel viewModelBuilder(BuildContext context) => LogInViewModel();

}
