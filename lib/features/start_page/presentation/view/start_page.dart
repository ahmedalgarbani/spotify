import 'dart:ffi' hide Size;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/vectors/app_vector.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppVector.bg_start), fit: BoxFit.fill),
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
              Text(
                "title",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                    fontSize: 13),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 21,
              ),
              BasicAppButton(
                title: 'Get Started',
                onPressed: () {
                  GoRouter.of(context).push(AppRoute.KChooseMode);
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? height;
  final String title;
  BasicAppButton({
    super.key,
    this.height,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 50),
          
        ),

        child: Text(title));
  }
}
