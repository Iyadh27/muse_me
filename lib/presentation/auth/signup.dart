import 'package:flutter/material.dart';
import 'package:muse_me/core/configs/app_vectors.dart';
import 'package:muse_me/data/models/auth/create_user_req.dart';
import 'package:muse_me/domain/usecases/auth/signup.dart';
import 'package:muse_me/presentation/auth/signin.dart';
import 'package:muse_me/presentation/widgets/basicAppbar.dart';
import 'package:muse_me/presentation/widgets/button/basic_app_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muse_me/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _fullName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(
              height: 50,
            ),
            _fullNameField(context),
            const SizedBox(
              height: 20,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordField(context),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(
                onPressed: () async {
                   var result = await sl<SignupUseCase>().call(
                    params: CreateUserReq(
                      email: _email.text.toString(),
                      password: _password.text.toString(),
                       fullName: _fullName.text.toString(),
                    )
                  );
                  result.fold(
                    (l){
                      var snackbar = SnackBar(content: Text(l),behavior: SnackBarBehavior.floating,);
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (r){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => const SigninPage()),
                        (route) => false
                      );
                    }
                  );
                },
                title: 'Create Account')
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(hintText: 'Enter Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullName,
      decoration: const InputDecoration(hintText: 'Enter Full Name')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(hintText: 'Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Got an Account? ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const SigninPage()));
              },
              child: const Text('Sign in'))
        ],
      ),
    );
  }
}
