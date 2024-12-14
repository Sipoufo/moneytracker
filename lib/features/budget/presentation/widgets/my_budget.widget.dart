import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/core/widgets/separator.widget.dart';

class MyBudgetWidget extends StatelessWidget {
  const MyBudgetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/budget/budget-detail"),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeUtil.md, vertical: SizeUtil.sm_12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).yourBudget,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            // Spacing
            const SizedBox(
              height: SizeUtil.spaceBtwItems_24,
            ),

            Container(
              padding: const EdgeInsets.all(SizeUtil.md),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
              child: Column(
                children: [
                  // Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(SizeUtil.sm),
                        decoration: BoxDecoration(
                          color: ColorsUtils.malibu,
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: Image.asset(
                          "assets/pictures/categories/education.png",
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),

                      // Spacing
                      const SizedBox(
                        width: SizeUtil.spaceBtwItems_12,
                      ),

                      Expanded(
                        child: Text(
                          "John’s College Tuition",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),

                      // Spacing
                      const SizedBox(
                        width: SizeUtil.spaceBtwItems_12,
                      ),

                      // Vertical dots icons
                      IconsUtils.verticalDote(
                        context: context,
                        onTap: () {},
                      ),
                    ],
                  ),

                  // Spacing
                  const SizedBox(
                    height: SizeUtil.spaceBtwItems_16,
                  ),

                  // Body
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context).budgetPercentageTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(color: Theme.of(context).colorScheme.tertiaryContainer),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  FormatterUtils.formatCurrencyCompact(400000000),
                                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                    color: ColorsUtils.primary_6,
                                  ),
                                ),
                                Text(
                                  "/${FormatterUtils.formatCurrencyCompact(400000000)}",
                                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                    color: Theme.of(context).colorScheme.tertiaryContainer,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // Spacing
                      const SizedBox(
                        height: SizeUtil.spaceBtwItems_12,
                      ),

                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ColorsUtils.primary_1,
                                borderRadius: BorderRadius.circular(SizeUtil.borderRadiusXl)),
                            alignment: Alignment.centerLeft,
                            child: FractionallySizedBox(
                              widthFactor: 0.7,
                              child: Container(
                                height: SizeUtil.buttonHeight_30,
                                decoration: BoxDecoration(
                                    color: ColorsUtils.primary_4,
                                    borderRadius: BorderRadius.circular(SizeUtil.borderRadiusXl)),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Text(
                                "70%",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  const Separator(),

                  // Footer
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context).timeRemaining,
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                fontSize: 8.0,
                              ),
                            ),

                            // Spacing
                            const SizedBox(
                              height: SizeUtil.spaceBtwItems_4,
                            ),

                            Text(
                              "365 ${AppLocalizations.of(context).day}",
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context).achievementDate,
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                fontSize: 8.0,
                              ),
                            ),

                            // Spacing
                            const SizedBox(
                              height: SizeUtil.spaceBtwItems_4,
                            ),

                            Text(
                              FormatterUtils.formatDate(),
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context).categories,
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                fontSize: 8.0,
                              ),
                            ),

                            // Spacing
                            const SizedBox(
                              height: SizeUtil.spaceBtwItems_4,
                            ),

                            Text(
                              AppLocalizations.of(context).education,
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}