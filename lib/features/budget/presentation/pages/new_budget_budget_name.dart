import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/models/category.model.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/features/budget/domain/entries/budget.entity.dart';
import 'package:moneytracker/features/budget/presentation/blocs/budget.bloc.dart';
import 'package:moneytracker/features/budget/presentation/blocs/budget.event.dart';
import 'package:moneytracker/features/budget/presentation/widgets/new_budget_page_1.widget.dart';
import 'package:moneytracker/features/budget/presentation/widgets/new_budget_page_2.widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewBudget extends StatefulWidget {
  const NewBudget({super.key, this.budget});

  final BudgetEntity? budget;

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

  final List<Widget> pageFormContain = [];
  int pageFormContainIndex = 0;
  List<CategoryModel> categories = [];

  // Fields
  String name = "";
  double amount = 0;
  DateTime dateTime = DateTime.now();

  void updateFieldsState1(String nameField) {
    setState(() {
      name = nameField;
    });
  }

  void updateFieldsState2(double amountField, DateTime dateTimeField) {
    setState(() {
      amount = amountField;
      dateTime = dateTimeField;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero,() {
      setState(() {
        categories = InitValuesUtil.categories(context);
      });
    });

    // If it's updated
    setState(() {
      if (widget.budget != null) {
        name = widget.budget!.name;
        amount = widget.budget!.amount;
        dateTime = widget.budget!.achievementDate;
        actualCategoryIndex = 0;
        for (int i = 0; i < categories.length; i++) {
          if (categories[i].name == widget.budget!.category.name) {
            actualCategoryIndex = i;
            pageController = PageController(
              viewportFraction: 0.35,
              initialPage: i,
            );
          }
        }
      }
    });
    pageFormContain.add(
      NewBudgetPage1Widget(
        nextPage: nextPage,
        name: name,
        updateFieldsState1: updateFieldsState1,
      ),
    );
    pageFormContain.add(
      NewBudgetPage2Widget(
        amount: amount,
        date: dateTime,
        save: save,
        prevPage: prevPage,
        updateFieldsState2: updateFieldsState2,
      ),
    );
    super.initState();
  }

  void nextPage() {
    if (pageFormContain.length - 1 > pageFormContainIndex) {
      setState(() {
        pageFormContainIndex += 1;
      });
    }
  }

  void prevPage() {
    if (pageFormContainIndex > 0) {
      setState(() {
        pageFormContainIndex -= 1;
      });
    }
  }

  void save() {
    // If budget is pass as parameter so we consider that is update section
    if (widget.budget != null) {
      context.read<BudgetBloc>().add(BudgetUpdateOneEvent(widget.budget!.id, BudgetEntity(
        name: name,
        amount: amount,
        currentAmount: 0,
        achievementDate: dateTime,
        category: categories[actualCategoryIndex],
      )));
      context.read<BudgetBloc>().add(BudgetFetchAllEvent());
    } else {
      context.read<BudgetBloc>().add(BudgetSaveOneEvent(BudgetEntity(
        name: name,
        amount: amount,
        currentAmount: 0,
        achievementDate: dateTime,
        category: categories[actualCategoryIndex],
      )));
      context.read<BudgetBloc>().add(BudgetFetchAllEvent());
    }
    Navigator.pop(context);
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
                  title: AppLocalizations.of(context).newBudget,
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
                          itemCount: categories.length,
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
                                            ? Color(categories[itemIndex].backgroundColor)
                                            : Theme.of(context).colorScheme.tertiary,
                                        borderRadius: const BorderRadius.all(Radius.circular(10000)),
                                        image: DecorationImage(
                                          image: AssetImage(categories[itemIndex].picture),
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
                                      categories[itemIndex].name,
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
                  boxShadow: [
                    BoxShadow(
                      color: ColorsUtils.grayscale_black_black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(SizeUtil.md, 0, SizeUtil.md, SizeUtil.sm_12),
                  child: Column(
                    spacing: SizeUtil.spaceBtwItems_24,
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

                      pageFormContain[pageFormContainIndex],
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
