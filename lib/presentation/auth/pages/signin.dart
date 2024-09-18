import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_vectors.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: _signinText(context),
          appBar: BasicAppbar(
            title: SvgPicture.asset(
              AppVectors.logo,
              height: 40,
              width: 40,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _registerText(),
                const SizedBox(height: 20),
                _emailField(context),
                const SizedBox(height: 20),
                _passwordField(context),
                const SizedBox(height: 30),
                BasicAppButton(onPressed: () {}, title: 'Sign in'),
              ],
            ),
          ),
        ));
  }
  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
        decoration: const InputDecoration(hintText: 'Enter Username or Email')
            .applyDefaults(Theme.of(context).inputDecorationTheme));
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Password',
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(CupertinoIcons.eye),
            )).applyDefaults(Theme.of(context).inputDecorationTheme));
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not A Member?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const SignupPage()));
              },
              child: const Text(
                'Register Now',
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
    );
  }
}
