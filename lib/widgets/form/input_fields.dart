import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/utility/common_functions.dart';
import './constants.dart';
import '../../themes/color_variables.dart';

enum InputType { text, phone, email, password, number, url, address, multiline }

enum Variant { filled, outlined }

class CustomLabel extends StatelessWidget {
  final String label;

  const CustomLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(fontWeight: FontWeight.w500),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String? label;
  final bool focus;
  final int? maxLength;
  final int? maxLines;
  final bool obscureText;
  final IconData? icon;
  final Widget? prefix;
  final String? prefixText;
  final IconData? prefixIcon;
  final Widget? suffix;
  final String? suffixText;
  final String? Function(String?)? validator;

  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? helperText;
  final String? errorText;
  final InputType type;
  final Function? tap;
  final bool? disabled;
  final bool? readOnly;
  final dynamic controller;

  final Color inputColor;
  final Color fillColor;
  final Color borderColor;
  final Variant variant;
  final FocusNode? focusNode;
  final double? minHeight;
  final double? maxHeight;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final Function(String?)? onFieldSubmitted;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final bool? filled;
  final double? headingSpace;
  final EdgeInsetsGeometry? contentPadding;
  final Color? focusColor;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  const CustomTextField({
    Key? key,
    this.label,
    this.focus = false,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = false,
    this.icon,
    this.prefix,
    this.prefixText,
    this.prefixIcon,
    this.validator,
    this.suffix,
    this.suffixText,
    this.suffixIcon,
    this.textInputAction,
    this.hintText,
    this.hintStyle,
    this.helperText,
    this.errorText,
    required this.type,
    this.tap,
    this.disabled = false,
    this.readOnly = false,
    this.controller,
    this.inputColor = ReplyColors.neutralBold,
    this.fillColor = ReplyColors.neutralLight,
    this.borderColor = ReplyColors.neutral50,
    required this.variant,
    this.focusNode,
    this.minHeight,
    this.maxHeight,
    this.onChanged,
    this.onFieldSubmitted,
    this.initialValue,
    this.onSaved,
    this.filled,
    this.headingSpace,
    this.contentPadding,
    this.focusColor,
    this.inputFormatters,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType() {
      switch (type) {
        case InputType.text:
          return TextInputType.text;
        case InputType.number:
          return TextInputType.number;
        case InputType.email:
          return TextInputType.emailAddress;
        case InputType.phone:
          return TextInputType.phone;
        case InputType.password:
          return TextInputType.visiblePassword;
        case InputType.multiline:
          return TextInputType.multiline;
        case InputType.url:
          return TextInputType.url;
        case InputType.address:
          return TextInputType.streetAddress;
        default:
          return TextInputType.text;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? CustomLabel(
                label: label ?? "",
              )
            : Container(),
        label != null ? SizedBox(height: headingSpace ?? 8) : Container(),
        Container(
          // height: FormConstant.height,
          constraints: BoxConstraints(
            maxHeight: maxHeight != null ? maxHeight! : double.infinity,
            minHeight: minHeight != null ? minHeight! : FormConstant.height,
          ),
          child: TextFormField(
            autovalidateMode: autovalidateMode,
            inputFormatters: inputFormatters,
            initialValue: initialValue,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            controller: controller,
            validator: validator,
            maxLines: maxLines,
            textAlignVertical: TextAlignVertical.center,
            onSaved: onSaved,
            onTap: () => tap == null ? null : tap!(),
            enabled: disabled == null
                ? true
                : disabled == true
                    ? false
                    : true,
            readOnly: readOnly == null ? true : readOnly ?? false,
            autofocus: focus,
            maxLength: maxLength,
            obscureText: obscureText,
            onChanged: onChanged,
            keyboardType: keyboardType(),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: disabled == true ? ReplyColors.neutral50 : inputColor,
                ),
            cursorColor: variant == Variant.filled ? inputColor : null,
            cursorWidth: Platform.isIOS ? 3 : 1.0,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: contentPadding ??
                  returnResponsiveChild(context, null, EdgeInsets.all(12.w)),
              filled: filled ?? variant == Variant.filled ? true : false,
              fillColor: fillColor,
              counterText: '',
              icon: icon == null
                  ? null
                  : Icon(
                      icon,
                      color: inputColor,
                    ),
              prefix: prefix,
              prefixText: prefixText,
              prefixIcon: prefixIcon == null
                  ? null
                  : Icon(
                      prefixIcon,
                      color: inputColor,
                    ),
              suffix: suffix,
              suffixText: suffixText,
              suffixIcon: suffixIcon == null ? null : suffixIcon,
              hintText: hintText,
              hintStyle: hintStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: ReplyColors.neutral50),
              //  TextStyle(color: inputColor.withOpacity(0.5), fontSize: 16),
              helperText: helperText,
              helperStyle: TextStyle(color: inputColor.withOpacity(0.5)),
              errorText: errorText,
              errorStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: ReplyColors.red25,
                  ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(FormConstant.borderRadius),
                borderSide: variant == Variant.filled
                    ? BorderSide.none
                    : BorderSide(width: 1.5, color: borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(FormConstant.borderRadius),
                borderSide: variant == Variant.filled
                    ? BorderSide(width: 1.5, color: borderColor)
                    : BorderSide(
                        width: 1.5,
                        color: focusColor ?? FormConstant.focusField),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(FormConstant.borderRadius),
                  borderSide: const BorderSide(
                      width: 1.5, color: FormConstant.errorField)),
            ),
            textInputAction: textInputAction,
          ),
        ),
      ],
    );
  }
}
