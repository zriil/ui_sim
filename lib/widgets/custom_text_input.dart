import 'package:flutter/material.dart';

import '../core/app_export.dart';

/**
 * CustomTextInput - A reusable text input component with consistent styling
 * 
 * This component provides a styled text input field with customizable placeholder text,
 * transparent background, and consistent typography following the design system.
 * 
 * @param hintText - Placeholder text displayed when input is empty
 * @param controller - TextEditingController for managing input value
 * @param onChanged - Callback function triggered when text changes
 * @param enabled - Whether the input field is enabled for interaction
 * @param keyboardType - Type of keyboard to display for input
 * @param textInputAction - Action button to display on keyboard
 * @param maxLines - Maximum number of lines for the input field
 * @param obscureText - Whether to hide the text being edited (for passwords)
 */
class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    Key? key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.enabled,
    this.keyboardType,
    this.textInputAction,
    this.maxLines,
    this.obscureText,
  }) : super(key: key);

  /// Placeholder text displayed when input is empty
  final String? hintText;

  /// Controller for managing the input text value
  final TextEditingController? controller;

  /// Callback function triggered when the text changes
  final Function(String)? onChanged;

  /// Whether the input field is enabled for user interaction
  final bool? enabled;

  /// Type of keyboard to display for input
  final TextInputType? keyboardType;

  /// Action button to display on the keyboard
  final TextInputAction? textInputAction;

  /// Maximum number of lines for the input field
  final int? maxLines;

  /// Whether to hide the text being edited (useful for passwords)
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      enabled: enabled ?? true,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.done,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      style: TextStyleHelper.instance.body13BlackInter.copyWith(
        color: appTheme.colorFF0000.withAlpha(102),
      ),
      decoration: InputDecoration(
        hintText: hintText ?? "Enter text",
        hintStyle: TextStyleHelper.instance.body13BlackInter.copyWith(
          color: appTheme.colorFF0000.withAlpha(102),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        filled: false,
        isDense: true,
      ),
    );
  }
}
