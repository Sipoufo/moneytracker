import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/Images.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/helpers/functions.helper.dart';
import 'package:moneytracker/features/onboarding/controller/onboarding_controller.dart';
import 'package:moneytracker/features/onboarding/widgets/onboarding_navigation.widget.dart';
import 'package:moneytracker/features/onboarding/widgets/onboarding_page.widget.dart';
import 'package:moneytracker/features/onboarding/widgets/onboarding_skip.widget.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                // Page 1
                OnBoardingPage(
                  image: ImagesUtils.onboarding1,
                  title: AppLocalizations.of(context).onBoardingTitle1,
                  body: AppLocalizations.of(context).onBoardingBody1,
                ),
                // Page 2
                OnBoardingPage(
                  image: ImagesUtils.onboarding2,
                  title: AppLocalizations.of(context).onBoardingTitle2,
                  body: AppLocalizations.of(context).onBoardingBody2,
                ),
                // Page 3
                OnBoardingPage(
                  image: ImagesUtils.onboarding3,
                  title: AppLocalizations.of(context).onBoardingTitle3,
                  body: AppLocalizations.of(context).onBoardingBody3,
                ),
              ],
            ),

            // Skip button
            OnBoardingSkip(
              onTap: controller.skipPage,
            ),

            // Dot navigation smooth page indicator
            OnBoardingNavigation(
              pageController: controller.pageController,
              onDotClicked:
              controller.dotNavigationClick,
              onTapNextButton: controller.nextPage,
            )
          ],
        ),
      ),
    );
  }
}
