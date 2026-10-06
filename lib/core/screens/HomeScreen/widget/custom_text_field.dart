import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final bool? isPassword;
  final Widget? suffixIcon;
  final String? nameField;
  final int? maxLine;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Icon? icons;
  final void Function(String)? onFieldSubmitted;

  const CustomTextField({
    super.key,
    this.isPassword,
    this.suffixIcon,
    this.nameField,
    this.controller,
    this.validator,
    this.keyboardType,
    this.maxLine,
    this.icons,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD9E2EC), width: 2),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: TextFormField(
        style: TextStyle(color: const Color(0xFF183B56), fontSize: 16),
        cursorColor: const Color(0xFFD97745),

        maxLines: maxLine ?? 1,
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        validator: validator,
        obscureText: isPassword ?? false,
        autofocus: false,
        onFieldSubmitted: onFieldSubmitted,

        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(width: 1, color: const Color(0xFFD9E2EC)),
          ),
          prefixIcon: icons,
          hintText: nameField ?? "",

          hintStyle: TextStyle(
            fontSize: 15.sp,
            color: const Color(0xFF829AB1),
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.h,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(width: 1.w, color: const Color(0xFFD97745)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),

            borderSide: BorderSide(width: 1.w, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 1.w,
              color: const Color.fromARGB(255, 227, 28, 28),
            ),
          ),

          filled: false,
          fillColor: const Color(0xFFFFFFFF),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
