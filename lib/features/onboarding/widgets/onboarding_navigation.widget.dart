import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
    required this.pageController,
    required this.onDotClicked,
    required this.onTapNextButton,
  });

  final PageController pageController;
  final OnDotClicked onDotClicked;
  final VoidCallback onTapNextButton;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: SizeUtil.defaultSpace,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SmoothPageIndicator(
            count: 3,
            controller: pageController,
            onDotClicked: onDotClicked,
            effect: const ExpandingDotsEffect(
              activeDotColor: ColorsUtils.primary_5,
              dotHeight: 6.0,
            ),
          ),
          ButtonWidget(title: AppLocalizations.of(context).tContinue, onTap: onTapNextButton,)
        ],
      ),
    );
  }
}