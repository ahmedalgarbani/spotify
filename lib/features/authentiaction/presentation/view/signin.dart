import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/core/router/app_router.dart';
import 'package:spotify/core/theme/app_color.dart';
import 'package:spotify/core/vectors/app_vector.dart';
import 'package:spotify/core/widgets/appbar.dart';
import 'package:spotify/core/widgets/base_button.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buttonText(context),
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
            _signTitle(),
            _supportDescription(),
            SizedBox(
              height: 30,
            ),
            _inputField(context, hint: "email"),
            SizedBox(
              height: 20,
            ),
            _inputField(context, hint: "password"),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                child: Text(
                  "Recovery password",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                alignment: Alignment.topLeft,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BasicAppButton(
              onPressed: () {},
              title: "Sign In",
              height: 80,
            )
          ],
        ),
      ),
    );
  }

  Text _signTitle() {
    return Text(
      "Sign In",
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

  _buttonText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "not a member ?",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRoute.Kregister);
            },
            child: Text(
              "register now",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  _supportDescription() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'If you need any support',
      ),
      TextButton(
          onPressed: () {},
          child: Text(
            "click here",
            style: TextStyle(color: AppColors.primary),
          ))
    ]);
  }
}
