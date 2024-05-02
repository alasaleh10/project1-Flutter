import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/core/routers/app_routers.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/core/utils/app_images.dart';

class SplashScreenBodyView extends StatefulWidget {
  const SplashScreenBodyView({super.key});

  @override
  State<SplashScreenBodyView> createState() => _SplashScreenBodyViewState();
}

class _SplashScreenBodyViewState extends State<SplashScreenBodyView> {
  Offset offset = const Offset(-2, 0);

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300), () {
      offset = Offset.zero;
      setState(() {});
      Future.delayed(const Duration(seconds: 2), () {
        GoRouter.of(context).pushReplacementNamed(AppRouters.loginView);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 4 / 1,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 900),
            offset: offset,
            child: SvgPicture.asset(
              Assets.imagesLogo2,
              colorFilter: const ColorFilter.mode(
                  AppColors.kPrimColor3, BlendMode.srcIn),
            ),
          ),
        )
      ],
    );
  }
}
