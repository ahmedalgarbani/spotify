import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/vectors/app_vector.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/base_button.dart';
import '../../data/model/signin_user_request.dart';
import '../../data/services/service_locator.dart';
import '../usecase/auth/signin.dart';
import '../view_model/repository/repo_auth.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
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
            _inputField(context, hint: "email", sendedController: _email),
            SizedBox(
              height: 20,
            ),
            _inputField(context, hint: "password", sendedController: _password),
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
              onPressed: () async {
                var result = await sl<SignInUSeCase>().call(
                    params: SigninUserRequest(
                  email: _email.text,
                  password: _password.text,
                ));
                result.fold((l) {
                  var Snackbar = SnackBar(content: Text(l));
                  ScaffoldMessenger.of(context).showSnackBar(Snackbar);
                }, (r) {
                  GoRouter.of(context).pushReplacement(AppRoute.KRoot);
                });
              },
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

  Widget _inputField(BuildContext context,
      {String? hint, TextEditingController? sendedController}) {
    return TextField(
      controller: sendedController,
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
