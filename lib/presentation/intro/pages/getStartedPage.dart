import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/button/basic_app_button.dart';
import 'package:flutter_application_1/core/configs/app_images.dart';
import 'package:flutter_application_1/core/configs/app_vectors.dart';
import 'package:flutter_application_1/core/configs/theme/app_colors.dart';
import 'package:flutter_application_1/presentation/ChooseMode/pages/chooseModePage.dart';
import 'package:flutter_svg/svg.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.getStartedBG),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Container(
          //   color: Colors.black.withOpacity(0.15),
          // ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(AppVectors.logo),
              ),
              const Spacer(),
              const Text("Enjoy listening to Music",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              BasicAppButton(
                  title: "Get Started",
                  height: 70,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ChooseModePage()));
                  }),
            ]),
          ),
        ],
      ),
    );
  }
}
