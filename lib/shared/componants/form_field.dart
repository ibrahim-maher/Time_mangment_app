import 'package:flutter/material.dart';
Widget defaultFormFeild({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?) validate,
  required String label,
  required IconData prefix,
  TextInputAction ? action,
  FocusNode ? focusNode,
  Function()? onTap,
  bool  autofocus = true,
  bool isPassword = false,
  bool isClickable = true,
  IconData? suffix,
  Function()? suffixPressed,
}) =>
    TextFormField(
      focusNode: focusNode,
      autofocus: autofocus,
      validator: validate,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onTap: onTap,
      enabled: isClickable,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix),
        ),
        border: OutlineInputBorder(),
      ),
    );
