import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../styles.dart';
import '../mixins/validation_mixins.dart';

typedef StringCallBack = String Function(String?);

class CustomTextFormField extends StatelessWidget with ValidationMixin {
  final String? title;
  final Icon? icon;
  final int? maxLength;
  final TextInputType? inputType;
  final StringCallBack? validator;
  final Widget? suffexIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final bool? obsecureText;
  final bool enablePaste;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  const CustomTextFormField({
    Key? key,
    this.title,
    this.icon,
    this.focusNode,
    this.inputType,
    this.suffexIcon,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.onTap,
    this.obsecureText = false,
    this.enablePaste = true,
    this.maxLength,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onTap: onTap,
      maxLines: maxLength ?? 1,
      enableInteractiveSelection: enablePaste,
      keyboardType: inputType,
      onChanged: onChanged,
      validator: validator ??
          (value) {
            if (isFieldEmpty(value!)) {
              return kEmptyFieldErrorMessage;
            }
          },
      onSaved: onSaved,
      obscureText: obsecureText ?? false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: suffexIcon,
        hintText: title,
        hintStyle:
            Styles.bodyText1.copyWith(color: Colors.grey.withOpacity(.5)),
        prefixIcon: icon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFFD6D6D6),
            )),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFD6D6D6),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFD6D6D6),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFD6D6D6),
          ),
        ),
      ),
    );
  }
}
