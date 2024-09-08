import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/core/router/app_router.dart';
import 'package:spotify/core/theme/app_color.dart';
import 'package:spotify/core/vectors/app_vector.dart';
import 'package:spotify/core/widgets/appbar.dart';
import 'package:spotify/core/widgets/base_button.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _navigationText(context),
        appBar: BaseAppBar(
          title: SvgPicture.asset(
            AppVector.logo,
            height: 50,
            width: 50,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _registerText(),
              SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'If you need any support',
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "click here",
                      style: TextStyle(color: AppColors.primary),
                    ))
              ]),
              _inputField(context, hint: "Full Name"),
              SizedBox(
                height: 20,
              ),
              _inputField(context, hint: "Enter email"),
              SizedBox(
                height: 20,
              ),
              _inputField(context, hint: "Password"),
              SizedBox(
                height: 20,
              ),
              BasicAppButton(
                onPressed: () {},
                title: "creat account",
                height: 80,
              ),
            ],
          ),
        ));
  }

  Widget _registerText() {
    return Text(
      "Register",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _inputField(BuildContext context, {String? hint}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  _navigationText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account? ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRoute.KSignin);
              },
              child: const Text('sign In'))
        ],
      ),
    );
  }
}
