import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/vectors/app_vector.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/base_button.dart';
import '../../data/model/create_user_request.dart';
import '../../data/services/service_locator.dart';
import '../usecase/auth/register.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
              _inputField(context, hint: "Full Name", ParamController: _name),
              SizedBox(
                height: 20,
              ),
              _inputField(context,
                  hint: "Enter email", ParamController: _email),
              SizedBox(
                height: 20,
              ),
              _inputField(context,
                  hint: "Password", ParamController: _password),
              SizedBox(
                height: 20,
              ),
              BasicAppButton(
                onPressed: () async {
                  var result = await sl<RegisterUseCase>().call(
                      params: CreateUserRequest(
                    email: _email.text,
                    name: _name.text,
                    password: _password.text,
                  ));
                  result.fold((l) {
                    var Snackbar = SnackBar(content: Text(l));
                    ScaffoldMessenger.of(context).showSnackBar(Snackbar);
                  }, (r) {
                    GoRouter.of(context).pushReplacement(AppRoute.KRoot);
                  });
                },
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

  Widget _inputField(BuildContext context,
      {String? hint, TextEditingController? ParamController}) {
    return TextField(
      controller: ParamController,
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
