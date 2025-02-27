import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/device/device.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
    required this.pageController,
    required this.onDotClicked,
    required this.onTapNextButton,
    required this.currentPageIndex,
  });

  final PageController pageController;
  final OnDotClicked onDotClicked;
  final VoidCallback onTapNextButton;
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: SizeUtil.defaultSpace,
      width: DeviceUtils.getScreenWidth(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: SizeUtil.spaceBtwItems_12,
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
          ButtonWidget(
            title: currentPageIndex == 2
                ? AppLocalizations.of(context).lastOnBoardingButtonTitle
                : AppLocalizations.of(context).tContinue,
            textStyle: Theme.of(context).textTheme.headlineSmall,
            onTap: currentPageIndex == 2
                ? () => Navigator.pushNamed(context, "/navigation")
                : onTapNextButton,
            padding: const EdgeInsets.all(SizeUtil.spaceBtwItems_16),
            margin: const EdgeInsets.all(SizeUtil.spaceBtwItems_12),
            color: ColorsUtils.primary_5,
          ),
        ],
      ),
    );
  }
}
