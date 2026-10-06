import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListviewButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function() onTap;

  const ListviewButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFD97745) : const Color(0xFFEAF0F6),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isActive ? const Color(0xFFD97745) : const Color(0xFFD9E2EC),
          ),
        ),
        child: Text(
          title.tr(context: context),
          style: GoogleFonts.dmSans(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: isActive ? const Color(0xFFF5F7FA) : const Color(0xFF486581),
          ),
        ),
      ),
    );
  }
}
