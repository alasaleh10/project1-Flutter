import 'package:go_router/go_router.dart';
import 'package:project1/core/cached_helper.dart';
import 'package:project1/core/routers/app_routers.dart';
import 'package:project1/core/routers/page_animation.dart';
import 'package:project1/model/items_model.dart';
import 'package:project1/views/auth/login.dart';
import 'package:project1/views/auth/signup.dart';
import 'package:project1/views/home/add_item.dart';
import 'package:project1/views/home/views/edit_item.dart';
import 'package:project1/views/home/views/item_detils.dart';
import 'package:project1/views/home_screen/home_screen_view.dart';

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
          return '/${AppRouters.homeScreenView}';
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
      path: '/${AppRouters.homeScreenView}',
      name: AppRouters.homeScreenView,
      pageBuilder: (context, state) => pageAnimation(
        page: const HomeScreenView(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.itemDetils}',
      name: AppRouters.itemDetils,
      pageBuilder: (context, state) => pageAnimation(
        page:  ItemsDetils(data: state.extra as List,),
      ),
    ),
     GoRoute(
      path: '/${AppRouters.editItemView}',
      name: AppRouters.editItemView,
      pageBuilder: (context, state) => pageAnimation(
        page:  EditItem(itemsModel: state.extra as ItemsModel,),
      ),
    ),
     GoRoute(
      path: '/${AppRouters.addItemView}',
      name: AppRouters.addItemView,
      pageBuilder: (context, state) => pageAnimation(
        page:  const AddItemView()
      ),
    ),
  ]);
}
