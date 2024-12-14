import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/features/budget/presentation/widgets/new_budget_page_1.widget.dart';
import 'package:moneytracker/features/budget/presentation/widgets/new_budget_page_2.widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewBudget extends StatefulWidget {
  const NewBudget({super.key});

  @override
  State<NewBudget> createState() => _NewBudgetState();
}

class _NewBudgetState extends State<NewBudget> {
  PageController pageController = PageController(
    viewportFraction: 0.35,
    initialPage: 0,
  );
  int actualCategoryIndex = 0;
  double? containWidgetHeight;

  // Fields' controllers of form
  TextEditingController budgetNameController = TextEditingController();
  TextEditingController budgetAmountController = TextEditingController();
  TextEditingController budgetAchievementDateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final List<Widget> pageFormContain = [];
  int pageFormContainIndex = 0;

  @override
  void initState() {
    pageFormContain.add(
      NewBudgetPage1Widget(
        budgetNameController: budgetNameController,
      ),
    );
    pageFormContain.add(
      NewBudgetPage2Widget(
        budgetAmountController: budgetAmountController,
        budgetAchievementDateController: budgetAchievementDateController,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      body: SafeArea(
        child: Stack(
          children: [
            // Header + categories parts
            Column(
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
                                  Opacity(
                                    opacity: actualCategoryIndex == itemIndex ? 1 : 0.4,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: actualCategoryIndex == itemIndex
                                            ? InitValuesUtil.categories(context)[itemIndex].backgroundColor
                                            : Theme.of(context).colorScheme.tertiary,
                                        borderRadius: const BorderRadius.all(Radius.circular(10000)),
                                        image: DecorationImage(
                                          image: AssetImage(InitValuesUtil.categories(context)[itemIndex].picture),
                                        ),
                                      ),
                                      height: actualCategoryIndex == itemIndex ? 100 : 70,
                                      width: actualCategoryIndex == itemIndex ? 100 : 70,
                                    ),
                                  ),

                                  // Spacing
                                  const SizedBox(
                                    height: SizeUtil.spaceBtwItems_24,
                                  ),

                                  if (actualCategoryIndex == itemIndex)
                                    Text(
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
                ),
              ],
            ),

            // Bottom part
            Positioned(
              bottom: 0,
              child: Container(
                height: containWidgetHeight ?? (MediaQuery.of(context).size.height / 2),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(SizeUtil.borderRadiusXl),
                    topRight: Radius.circular(SizeUtil.borderRadiusXl),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(SizeUtil.md, 0, SizeUtil.md, SizeUtil.sm_12),
                  child: Column(
                    children: [
                      // Pan button
                      GestureDetector(
                        onPanUpdate: (detail) {
                          setState(() {
                            double value =
                                (containWidgetHeight ??= MediaQuery.of(context).size.height / 2) - detail.delta.dy;
                            if (containWidgetHeight == null) {
                              containWidgetHeight = value;
                            } else if (value > 300) {
                              containWidgetHeight = value;
                            }
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: SizeUtil.lg),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: SizeUtil.buttonHeight_10,
                                width: SizeUtil.buttonWidth_64,
                                decoration: const BoxDecoration(
                                    color: ColorsUtils.grayscale_white_dark_white,
                                    borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(SizeUtil.sm),
                                      right: Radius.circular(SizeUtil.sm),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Spacing
                      const SizedBox(
                        height: SizeUtil.spaceBtwItems_24,
                      ),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Form(
                                  key: formKey,
                                  child: pageFormContain[pageFormContainIndex],
                                ),
                              ),
                            ),

                            // Spacing
                            const SizedBox(
                              height: SizeUtil.spaceBtwItems_4,
                            ),

                            SizedBox(
                              child: Column(
                                children: [
                                  // Spacing
                                  const SizedBox(
                                    height: SizeUtil.spaceBtwItems_24,
                                  ),

                                  ButtonWidget(
                                    title: (pageFormContain.length - 1) == pageFormContainIndex
                                        ? AppLocalizations.of(context).finish
                                        : AppLocalizations.of(context).next,
                                    textStyle: Theme.of(context).textTheme.headlineSmall,
                                    onTap: () {
                                      setState(() {
                                        if (pageFormContain.length - 1 > pageFormContainIndex) {
                                          pageFormContainIndex += 1;
                                        } else {
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    padding: const EdgeInsets.all(0),
                                    color: ColorsUtils.primary_5,
                                  ),

                                  ButtonWidget(
                                    title: pageFormContainIndex == 0
                                        ? AppLocalizations.of(context).cancel
                                        : AppLocalizations.of(context).previous,
                                    textStyle: Theme.of(context).textTheme.headlineSmall,
                                    onTap: () {
                                      setState(() {
                                        if (pageFormContainIndex > 0) {
                                          pageFormContainIndex -= 1;
                                        }
                                      });
                                    },
                                    padding: const EdgeInsets.all(0),
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
