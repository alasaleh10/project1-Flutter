import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project1/core/cached_helper.dart';
import 'package:project1/core/routers/routers.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.onInitCacheHelper();

  runApp(const Project());
}

class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routers.routers,
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', 'SA'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.kPrimColor3),
    );
  }
}
