import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/common/widgets/button/basic_oval_btn.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/main.dart';
import 'package:spotify/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';

import '../../../core/configs/theme/app_colors.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppImages.chooseModeBg))),
            ),
            Container(
              color: Colors.black.withOpacity(0.15),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppVectors.logo),
                  ),
                  const Spacer(),
                  const Text(
                    'Choose Mode',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                            },
                            child:
                                const BasicOvalBtn(assetName: AppVectors.moon),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Dark Mode',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: AppColors.grey),
                          )
                        ],
                      ),
                      const SizedBox(width: 40),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                            },
                            child:
                                const BasicOvalBtn(assetName: AppVectors.sun),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Light Mode',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: AppColors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  BasicAppButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SignupOrSigninPage(),
                          ),
                        );
                      },
                      title: 'Continue'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
