import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../constants/app_text_style.dart';
import '../constants/color_palette.dart';
import '../reponsive/SizeConfig.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.onSuffixTap,
      this.errorText,
      this.isrequired,
      this.hint,
        this.formatters,

      this.isObsecure = false,
      this.label,
      required this.onChanged,
      this.suffixWidget,
      required this.textEditingController,
      required this.textInputType,
      this.validation,
      Key? key})
      : super(key: key);

  TextEditingController textEditingController;
  ValueChanged<String> onChanged;
  String? Function(String?)? validation;
  TextInputType textInputType;
  String? label;
  bool isObsecure = false;
  bool? isrequired = false;
  GestureTapCallback? onSuffixTap;
  String? errorText;
  String? hint;
  Widget? suffixWidget;
  List<TextInputFormatter>? formatters;

  @override
  Widget build(BuildContext context) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label ?? '',
              style: AppTextStyle1.normalGreyTTCommon400.copyWith(
                  fontSize: 14 * SizeConfig.textMultiplier!,
                  fontWeight: FontWeight.w400,
                  color: grey80,
                  height: 1.5),
            ),
            isrequired == true
                ? Text(
                    ' *',
                    style: AppTextStyle1.normalGreyTTCommon400.copyWith(
                        fontSize: 14 * SizeConfig.textMultiplier!,
                        fontWeight: FontWeight.w400,
                        color: red212,
                        height: 1.5),
                  )
                : Container(),
          ],
        ),
        SizedBox(
          height: 8 * SizeConfig.heightMultiplier!,
        ),
        TextFieldContainer(
            formatters: formatters,
            validation: validation,
            textEditingController: textEditingController,
            onChanged: onChanged,
            textInputType: textInputType,
            hint: hint,
            onSuffixTap: onSuffixTap,
            errorText: errorText,
            isObsecure: isObsecure,
            suffixWidget: suffixWidget)
      ],
    );
}

// ignore: must_be_immutable
class TextFieldContainer extends StatelessWidget {
  TextFieldContainer(
      {this.validation,
      required this.textInputType,
      required this.textEditingController,
      this.suffixWidget,
        this.formatters,
      required this.onChanged,
      this.isObsecure = false,
      this.hint,
      this.errorText,
      this.onSuffixTap,
        this.action=  TextInputAction.done,
        this.maxLength,
      Key? key})
      : super(key: key);

  TextEditingController textEditingController;
  ValueChanged<String> onChanged;
  String? Function(String?)? validation;
  TextInputType textInputType;
  GestureTapCallback? onSuffixTap;
  bool isObsecure;
  String? hint;
  String? errorText;
  Widget? suffixWidget;
  int? maxLength;
  final TextInputAction action;
List<TextInputFormatter>? formatters;


  @override
  Widget build(BuildContext context) => SizedBox(
      width: Get.width,
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        inputFormatters: formatters,
        maxLength: maxLength,
        textInputAction: action,
        cursorColor: grey80,
        controller: textEditingController,
        onChanged: (value) {
          onChanged(value);
        },
        onEditingComplete: (){
          print("editing complete");
        },
        onFieldSubmitted: (va){},
        keyboardType: textInputType,
        style: AppTextStyle1.normalGreyTTCommon400.copyWith(
            color: black3E, fontSize: 16 * SizeConfig.textMultiplier!),
        textAlignVertical: TextAlignVertical.bottom,
        obscureText: isObsecure,
        validator: validation,
        decoration: InputDecoration(
          errorText: errorText,
          counterText: "",
          counterStyle: TextStyle(
            fontSize: 0*SizeConfig.heightMultiplier!
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 16 * SizeConfig.widthMultiplier!,
              vertical: 12 * SizeConfig.heightMultiplier!),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.0 * SizeConfig.widthMultiplier!, color: white238),
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              )),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.0 * SizeConfig.widthMultiplier!, color: white238),
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              )),
          hintText: hint,
          errorStyle: AppTextStyle1.normalGreyTTCommon400.copyWith(
              fontSize: 12 * SizeConfig.textMultiplier!, color: red212),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: red212),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: grey80),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.3, color: red212),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          suffixIcon: suffixWidget != null
              ? GestureDetector(
                  onTap: onSuffixTap,
                  child: suffixWidget,
                )
              : SizedBox(
                  height: 10 * SizeConfig.heightMultiplier!,
                  width: 10 * SizeConfig.widthMultiplier!,
                ),
          hintStyle: AppTextStyle1.normalGreyTTCommon400.copyWith(
              color: grey128, fontSize: 16 * SizeConfig.textMultiplier!),
        ),
      ),
    );
}
