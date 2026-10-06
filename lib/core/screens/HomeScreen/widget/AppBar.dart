import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  final nextLanguage = context.locale.languageCode == 'en'
                      ? 'ar'
                      : 'en';
                  context.setLocale(Locale(nextLanguage));
                },
                icon: Icon(Icons.language, color: const Color(0xFF627D98)),
              ),
              Text(
                'TODAY\'S NEWS'.tr(),
                style: GoogleFonts.dmSans(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF627D98),
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),

          SizedBox(height: 4.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Explore'.tr(),
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF183B56),
                  ),
                ),
                TextSpan(
                  text: 'Stories'.tr(),
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFFD97745),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
