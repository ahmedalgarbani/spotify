import 'package:go_router/go_router.dart';
import 'package:spotify/features/splash/presentation/view/splash_page.dart';
import 'package:spotify/features/start_page/presentation/view/start_page.dart';
import 'package:spotify/main.dart';

abstract class AppRoute {
  static const KHomePage = "/";
  static const KSplashPage = "/splashPage";
  static const KStartPage = "/startPage";


  static final router = GoRouter(
    routes: [
      
      GoRoute(
        path: KHomePage,
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: KStartPage,
        builder: (context, state) => StartPage(),
      ),
    
    ],
  );
}
