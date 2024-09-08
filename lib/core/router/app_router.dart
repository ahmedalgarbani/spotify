import 'package:go_router/go_router.dart';
import 'package:spotify/features/authentiaction/presentation/view/Register.dart';
import 'package:spotify/features/authentiaction/presentation/view/signin.dart';
import 'package:spotify/features/authentiaction/presentation/view/signin_or_login.dart';
import 'package:spotify/features/home/presentation/view/start_page.dart';
import 'package:spotify/features/splash/presentation/view/splash_page.dart';
import 'package:spotify/features/start_page/presentation/view/choose_mode.dart';
import 'package:spotify/features/start_page/presentation/view/start_page.dart';

abstract class AppRoute {
  static const KHomePage = "/";
  static const KSplashPage = "/splashPage";
  static const KStartPage = "/startPage";
  static const KChooseMode = "/ChooseMode";
  static const KSigninOrLogin = "/SigninOrLogin";
  static const KSignin = "/Signin";
  static const Kregister = "/register";
  static const KRoot = "/root";

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
      GoRoute(
        path: KChooseMode,
        builder: (context, state) => ChooseMode(),
      ),
      GoRoute(
        path: KSigninOrLogin,
        builder: (context, state) => SigninOrLogin(),
      ),
      GoRoute(
        path: KSignin,
        builder: (context, state) => Signin(),
      ),
      GoRoute(
        path: Kregister,
        builder: (context, state) => Register(),
      ),
      GoRoute(
        path: KRoot,
        builder: (context, state) => HomePage(),
      ),
    ],
  );
}
