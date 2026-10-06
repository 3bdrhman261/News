import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/core/routering/app_routering.dart';
import 'package:news_api/core/screens/HomeScreen/models/top_headline_models.dart';
import 'package:news_api/core/screens/HomeScreen/widget/card_widget.dart';
import 'package:news_api/core/screens/Search%20resultsScreen/servises/search_servises.dart';
import 'package:news_api/core/screens/Search%20resultsScreen/widget/App_bare_screen.dart';

class SearchResultsScreen extends StatefulWidget {
  final String query;
  const SearchResultsScreen({super.key, required this.query});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  String? _requestedLanguage;
  Future? _resultsFuture;

  @override
  Widget build(BuildContext context) {
    final language = context.locale.languageCode;
    if (_requestedLanguage != language || _resultsFuture == null) {
      _requestedLanguage = language;
      _resultsFuture = SearchServises().seatchItemByName(
        widget.query,
        language: language,
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      body: FutureBuilder(
        future: _resultsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFD97745)),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: GoogleFonts.dmSans(color: const Color(0xFF627D98)),
              ),
            );
          }

          if (snapshot.hasData) {
            TopHeadlineModels topHeadlineModels =
                snapshot.data! as TopHeadlineModels;
            if (topHeadlineModels.totalResults == 0) {
              return Center(
                child: Text(
                  "No_ Results".tr(),
                  style: GoogleFonts.dmSans(color: const Color(0xFF627D98)),
                ),
              );
            }

            return Column(
              children: [
                SizedBox(height: 50.h),
                AppBareScreen(),
                SizedBox(height: 10.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: topHeadlineModels.articles!.length,
                      itemBuilder: (context, index) {
                        Article article = topHeadlineModels.articles![index];
                        return CardWidget(
                          ontap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRouter.artcleScreen, extra: article);
                          },

                          article: article,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(
            child: Text(
              "Something_Went_Wrong".tr(),
              style: GoogleFonts.dmSans(color: const Color(0xFF627D98)),
            ),
          );
        },
      ),
    );
  }
}
