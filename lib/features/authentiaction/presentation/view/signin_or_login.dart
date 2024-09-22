import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/vectors/app_vector.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/base_button.dart';

class SigninOrLogin extends StatelessWidget {
  const SigninOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BaseAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVector.topPattren),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVector.bottomPattren),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppVector.billiElish),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVector.logo),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Enjoy listening to music",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Spotify is a proprietary Swedish audio streaming and media services provider ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff797979)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicAppButton(
                          onPressed: () {
                            GoRouter.of(context).push(AppRoute.Kregister);
                          },
                          title: "Register",
                          height: 70,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            GoRouter.of(context).push(AppRoute.KSignin);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
