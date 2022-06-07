import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';

import '../../core/res/colors.dart';
import '../../core/res/images.dart';
import '../../core/res/styles.dart';

TextStyle _errorTextStyle = AppTextStyle.label3Medium.copyWith(color: AppColor.error, fontSize: 12, fontWeight: FontWeight.w500);
TextStyle _labelTextStyle = AppTextStyle.label3Medium.copyWith(fontSize: 12, fontWeight: FontWeight.w500);
TextStyle _bodyTextStyle = AppTextStyle.title3Medium;
TextStyle _hintTextStyle = AppTextStyle.label3Medium.copyWith(color: AppColor.outline, fontSize: 14, fontWeight: FontWeight.w500);

BorderRadius _borderRadius = BorderRadius.circular(4.0);

class EditTextField extends StatefulWidget {

  FormFieldController controller;

  String label;
  String? subTitle;
  TextStyle? textStyle;
  TextAlign textAlign;
  double? height;

  EdgeInsets? margin;
  EdgeInsets? padding;

  TextInputAction textInputAction;

  String? placeholder;
  Widget? prefixIcon;
  Widget? suffixIcon;

  String? prefixText;
  String? counterText;

  bool autoFocus = false;
  bool isPasswordField = false;

  bool enabled = true;
  int? maxLength;

  ValueChanged<String>? onChanged = (terms) {};
  ValueChanged<String>? onSubmitted = (terms) {};

  EditTextField(this.label,
      this.controller, {
        this.margin = EdgeInsets.zero,
        this.onSubmitted,
        this.onChanged,
        this.subTitle,
        this.height,
        this.autoFocus = false,
        this.enabled = true,
        this.prefixText,
        this.placeholder,
        this.prefixIcon,
        this.padding,
        this.textAlign = TextAlign.left,
        this.textStyle,
        this.textInputAction = TextInputAction.next,
        this.suffixIcon,
        this.maxLength,
        this.counterText
      });


  EditTextField.password(this.label,
      this.controller,
      { this.margin = EdgeInsets.zero,
        this.onSubmitted,
        this.onChanged,
        this.enabled = true,
        this.autoFocus = false,
        this.prefixText,
        this.placeholder,
        this.prefixIcon,
        this.padding,
        this.textAlign = TextAlign.left,
        this.textInputAction = TextInputAction.next,
        this.suffixIcon }) {
    isPasswordField = true;
  }



  @override
  _EditTextFieldState createState() => _EditTextFieldState();
}

class _EditTextFieldState extends State<EditTextField> {

  bool isVisible = false;
  bool isFocused = false;

  @override
  void initState() {

    widget.controller.focusNode..addListener(() {
      if( widget.controller.focusNode.hasFocus){
        isFocused = true;
      }
      else{
        isFocused = false;
      }
      setState(() {});
    });

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: FormField<String>(
        initialValue: widget.controller.text,
        validator: (value) {
          if (!widget.controller.required && widget.controller.text.isEmpty) {
            return null;
          }

          if ((widget.controller.required || widget.controller.text.isNotEmpty) && widget.controller.validator != null) {
            return widget.controller.validator!(value);
          }

          return null;
        },
        builder: (FormFieldState state) {

          if (widget.controller.textEditingController.hasListeners) {
            widget.controller.textEditingController.removeListener(() { });
          }

          widget.controller.textEditingController.addListener(() {
            state.reset();
            state.didChange(widget.controller.text);
          });

          return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if(widget.label.isNotEmpty == true)
                  Padding(
                  padding:const EdgeInsets.only(left:4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.label,
                              style: _labelTextStyle,
                            ),
                            widget.subTitle == null ? Container(): Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Text("${widget.subTitle}",style: AppTextStyle.title2Medium.copyWith(fontSize:12,color:AppColor.primary)),
                            ),
                            // if (widget.controller.required)
                            //   Text("* ",
                            //     style: _labelTextStyle.copyWith(color:AppColor.textOnPrimary),
                            //   ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                if(widget.label.isNotEmpty == true)  const Padding(
                  padding: EdgeInsets.only(top:6),
                ),

                SizedBox(
                  height: widget.controller.minLines > 1 ? null : state.hasError ? 65 : widget.height ?? 40,
                  child: TextField(
                      key: widget.controller.fieldKey,
                      controller: widget.controller.textEditingController,
                      enableInteractiveSelection: true,
                      obscureText: widget.isPasswordField && !isVisible ? true : false,
                      textInputAction: widget.textInputAction,
                      textAlign: widget.textAlign,
                      style: widget.textStyle ?? _bodyTextStyle,
                      focusNode: widget.controller.focusNode,
                      autofocus: widget.autoFocus,
                      cursorColor:AppColor.primary,
                      cursorWidth:1.5,
                      onChanged: (value) {
                        state.reset();
                        state.didChange(value);
                        if (widget.onChanged != null) {
                          widget.onChanged!(value);
                        }
                      },
                      onSubmitted: (value) {
                        if (widget.onSubmitted != null) {
                          widget.onSubmitted!(value);
                        }
                      },
                      enabled: widget.enabled,
                      maxLength: widget.maxLength,
                      maxLines: widget.isPasswordField ? 1 : widget.controller.maxLines,
                      minLines: widget.controller.minLines,
                      inputFormatters: widget.isPasswordField || widget.controller.textInputType == TextInputType.emailAddress ? [
                        FilteringTextInputFormatter.deny(RegExp('[\\ ]')),
                      ] : widget.controller.inputFormatter,

                      decoration: InputDecoration(
                        fillColor: !widget.enabled ? AppColor.white : isFocused ? AppColor.textOnError : Colors.white,
                        filled: true,
                        contentPadding: widget.padding ?? const EdgeInsets.symmetric(vertical: 8.5, horizontal: 12),
                        border: _outlineInputBorder,
                        enabledBorder: _outlineInputBorder,
                        disabledBorder: _outlineInputBorder,
                        focusedBorder: _focusedInputBorder,
                        errorBorder: _errorInputBorder,
                        errorStyle: _errorTextStyle,
                        errorText: state.hasError ? state.errorText : null,
                        hintText: widget.placeholder,
                        hintStyle: _hintTextStyle,
                        focusColor: AppColor.surface,
                        suffixIconConstraints: const BoxConstraints(minWidth: 15, maxHeight: 20),
                        prefixIconConstraints: const BoxConstraints(minWidth: 15, maxHeight: 24),
                        prefix: widget.prefixText == null ? null : Text("${widget.prefixText} ", style: _bodyTextStyle,),
                        prefixIcon: widget.prefixIcon ?? null,
                        suffixIcon: widget.isPasswordField ? _buildPasswordEyeIcon() : widget.suffixIcon ?? null,
                        counterText: widget.counterText ?? "",
                      ),
                      keyboardType: widget.controller.textInputType,
                      textCapitalization: widget.controller.textCapitalization
                  ),
                ),

              ]
          );
        },
      ),
    );
  }

  Widget _buildPasswordEyeIcon(){
    return IconButton(
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(
          isVisible ? Images.passShow : Images.passHidden, height: 18, width: 18,
        ),
        onPressed: () {
          isVisible = !isVisible;
          setState(() {});
        }
    );
  }


  void dispose() {
    widget.controller.focusNode.removeListener(() { });

    super.dispose();
  }

}


InputBorder _outlineInputBorder = OutlineInputBorder(
  borderRadius: _borderRadius,
  borderSide: const BorderSide(color: AppColor.outline, width:1),
);

InputBorder _focusedInputBorder = OutlineInputBorder(
  borderRadius: _borderRadius,
  borderSide: const BorderSide(color: AppColor.primary, width:1),
);

InputBorder _errorInputBorder = OutlineInputBorder(
  borderRadius: _borderRadius,
  borderSide: const BorderSide(color: AppColor.error, width:1),
);
