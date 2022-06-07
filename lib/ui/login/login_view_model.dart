import 'package:flutter/cupertino.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../core/enum/view_state.dart';
import '../views/vgts_base_view_model.dart';

class LogInViewModel extends VGTSBaseViewModel {

  final GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();

  ScrollController scrollController = ScrollController();

  NumberFormFieldController mobileNumController = NumberFormFieldController(const ValueKey("txtMobileNum"), requiredText: "Please enter your Mobile Number", required: true);


  login() async {

    if(logInFormKey.currentState?.validate() != true) {
      return;
    }
    setState(ViewState.Busy);
    // LoginAuth? auth = await request<LoginAuth>(AuthRequest.login(mobileNumController.text));
    // if (auth != null) {
    //   locator<PushNotificationService>().configure(mobileNumController.text);
    //   navigationService.pushNamed(Routes.otp,arguments:mobileNumController.text);
    // }
    setState(ViewState.Idle);
    notifyListeners();
  }


}