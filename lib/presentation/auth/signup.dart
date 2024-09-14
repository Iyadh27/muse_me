import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/configs/app_vectors.dart';
import 'package:flutter_application_1/presentation/widgets/basicAppbar.dart';
import 'package:flutter_svg/svg.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: SvgPicture.asset(AppVectors.logo, height: 40, width: 40),
      ),
      body: Column(),
    );
  }
}
