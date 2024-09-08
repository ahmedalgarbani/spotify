import 'dart:ffi' hide Size;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/core/router/app_router.dart';
import 'package:spotify/core/theme/app_color.dart';
import 'package:spotify/core/theme/app_theme.dart';
import 'package:spotify/core/vectors/app_vector.dart';
import 'package:spotify/features/start_page/presentation/view/start_page.dart';
import 'package:spotify/features/start_page/presentation/view_model/bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppVector.choose_mode), fit: BoxFit.fill),
          ),
        ),
        Container(
          color: AppColors.darkBackground.withOpacity(0.1),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(AppVector.logo),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                    },
                    child: Column(
                      children: [
                        ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xff30393C).withOpacity(0.5),
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                AppVector.sun,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Light mode",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                    },
                    child: Column(
                      children: [
                        ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xff30393C).withOpacity(0.5),
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                AppVector.moon,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Dark mode",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              BasicAppButton(
                title: 'Continue',
                onPressed: () {
                  GoRouter.of(context).push(AppRoute.KSigninOrLogin);
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
