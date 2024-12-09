import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

/// It's the banner of budget that present a quick access to create a budget
class BudgetBanner extends StatelessWidget {
  const BudgetBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: SizeUtil.md, vertical: SizeUtil.sm_12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsUtils.primary_1,
        borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
      ),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Padding(
            padding: const EdgeInsets.all(SizeUtil.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/pictures/others/budget-planner-and-money-simple-flat.png",
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context).visualizeYourFinances,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: ColorsUtils.primary_8,
                          ),
                    ),

                    // Spacing
                    const SizedBox(
                      height: SizeUtil.spaceBtwItems_12,
                    ),

                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, "/budget/new-budget"),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: SizeUtil.sm_12, vertical: SizeUtil.sm_10),
                        decoration: BoxDecoration(
                          color: ColorsUtils.broom,
                          borderRadius: BorderRadius.circular(SizeUtil.borderRadiusXl),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add,
                              color: ColorsUtils.primary_8,
                              size: SizeUtil.iconXs,
                            ),
                            Text(
                              AppLocalizations.of(context).createABudgetToday,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                    color: ColorsUtils.primary_8,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: -40,
            left: -40,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: ColorsUtils.primary_2,
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            right: -40,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: ColorsUtils.primary_2,
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
