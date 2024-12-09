import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewBudget extends StatefulWidget {
  const NewBudget({super.key});

  @override
  State<NewBudget> createState() => _NewBudgetState();
}

class _NewBudgetState extends State<NewBudget> {
  PageController pageController = PageController(
    viewportFraction: 0.4,
    initialPage: 0,
  );
  int actualCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header of transaction recap page
            HeaderWidget(
              title: AppLocalizations.of(context).budgeting,
              firstIcon: IconsUtils.back(context: context, onTap: () => Navigator.pop(context)),
            ),

            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeUtil.md, vertical: SizeUtil.sm_12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context).categories,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),

                  // Spacing
                  const SizedBox(
                    height: SizeUtil.spaceBtwItems_24,
                  ),

                  SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: InitValuesUtil.categories(context).length,
                      onPageChanged: (int pageIndex) {
                        print(pageIndex);
                        setState(() {
                          actualCategoryIndex = pageIndex;
                          pageController.jumpToPage(pageIndex);
                        });
                      },
                      itemBuilder: (BuildContext context, int itemIndex) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: SizeUtil.sm_12),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: InitValuesUtil.categories(context)[itemIndex].backgroundColor,
                                  borderRadius: const BorderRadius.all(Radius.circular(10000)),
                                  image: DecorationImage(
                                    image: AssetImage(InitValuesUtil.categories(context)[itemIndex].picture),
                                  )
                                ),
                                height: actualCategoryIndex == itemIndex ? 110 : 80,
                                width: actualCategoryIndex == itemIndex ? 110 : 80,
                              ),

                              // Spacing
                              const SizedBox(
                                height: SizeUtil.spaceBtwItems_24,
                              ),

                              if (actualCategoryIndex == itemIndex) Text(
                                InitValuesUtil.categories(context)[itemIndex].name,
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // Spacing
                  const SizedBox(
                    height: SizeUtil.spaceBtwItems_24,
                  ),

                  // Dots of category part
                  Center(
                    child: SmoothPageIndicator(
                      count: 5,
                      controller: pageController,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: ColorsUtils.primary_5,
                        dotColor: ColorsUtils.grayscale_white_white,
                        dotHeight: 6.0,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
