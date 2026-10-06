import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/core/screens/HomeScreen/models/top_headline_models.dart';

class CardWidget extends StatelessWidget {
  final Article article;
  final Function() ontap;
  const CardWidget({super.key, required this.ontap, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFD9E2EC), width: 0.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NEWS'.tr(),
                    style: GoogleFonts.dmSans(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFD97745),
                      letterSpacing: 0.8,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    article.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF243B53),
                      height: 1.35,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    //   maxLines: 2,
                    "${article.author}.${DateFormat('yyyy/ MM/ dd _ KK:mm').format(article.publishedAt!)}",
                    style: GoogleFonts.dmSans(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF829AB1),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 12.w),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Center(
                child: CachedNetworkImage(
                  width: 140.w,
                  height: 100.w,
                  imageUrl:
                      article.urlToImage ??
                      "https://th.bing.com/th/id/OIP.-mlwDVsSwfABKmZBtIBbtQHaFY?w=229&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
