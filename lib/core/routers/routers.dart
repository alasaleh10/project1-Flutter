import 'package:go_router/go_router.dart';
import 'package:project1/core/cached_helper.dart';
import 'package:project1/core/routers/app_routers.dart';
import 'package:project1/core/routers/page_animation.dart';
import 'package:project1/views/auth/login.dart';
import 'package:project1/views/auth/signup.dart';
import 'package:project1/views/home/home_view.dart';
import 'package:project1/views/spalsh_screen/splash_screen.dart';

abstract class Routers {
  static final routers = GoRouter(routes: [
    GoRoute(
      path: AppRouters.splashView,
      pageBuilder: (context, state) => pageAnimation(
        page: const SplashScreenView(),
      ),
    ),
    GoRoute(
      redirect: (context, state) {
        if (CacheHelper.getData(key: 'id') != null) {
          return '/${AppRouters.homeView}';
        }
        return null;
      },
      path: '/${AppRouters.loginView}',
      name: AppRouters.loginView,
      pageBuilder: (context, state) => pageAnimation(
        page: const LoginView(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.signupView}',
      name: AppRouters.signupView,
      pageBuilder: (context, state) => pageAnimation(
        page: const SignUp(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.homeView}',
      name: AppRouters.homeView,
      pageBuilder: (context, state) => pageAnimation(
        page: const HomeView(),
      ),
    ),
  ]);
}
