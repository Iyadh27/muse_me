import 'package:flutter/material.dart';
import 'package:muse_me/core/configs/app_images.dart';
import 'package:muse_me/core/configs/app_vectors.dart';
import 'package:muse_me/core/configs/theme/app_colors.dart';
import 'package:muse_me/presentation/ChooseMode/bloc/theme_cubit.dart';
import 'package:muse_me/presentation/auth/signin_or_signup_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.chooseModeBG),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo)),
              const Spacer(),
              const Text(
                "Choose Mode",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.dark);
                        },
                        child: ClipOval(
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              color: AppColors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(AppVectors.moon,
                                fit: BoxFit.none),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Dark Mode",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: AppColors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.light);
                        },
                        child: ClipOval(
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              color: AppColors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              child: SvgPicture.asset(AppVectors.sun,
                                  fit: BoxFit.none),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Light Mode",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: AppColors.grey),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigninOrSignupPage()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(80),
                ),
                child: const Text("Continue"),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
