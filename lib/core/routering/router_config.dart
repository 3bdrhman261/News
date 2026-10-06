import 'package:go_router/go_router.dart';
import 'package:news_api/core/screens/HomeScreen/models/top_headline_models.dart';
import 'package:news_api/core/screens/HomeScreen/widget/ArtcleScreen/artcle_screen.dart';
import '../screens/HomeScreen/home_screen.dart';
import '../screens/Search resultsScreen/search_results_screen.dart';
import 'app_routering.dart';

class RouterGenerationConfig {
  static GoRouter goRoute = GoRouter(
    initialLocation: AppRouter.homeScreen,
    routes: [
      GoRoute(
        name: AppRouter.homeScreen,
        path: AppRouter.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        name: AppRouter.searchResultsScreen,
        path: AppRouter.searchResultsScreen,
        builder: (context, state) {
          String query = state.extra as String;
          return SearchResultsScreen(query: query);
        },
      ),
      GoRoute(
        name: AppRouter.artcleScreen,
        path: AppRouter.artcleScreen,
        builder: (context, state) {
          Article article = state.extra as Article;
          return ArtcleScreen(article: article);
        },
      ),
    ],
  );
}
