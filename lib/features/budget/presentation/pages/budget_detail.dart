import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/core/widgets/separator.widget.dart';

class BudgetDetail extends StatefulWidget {
  const BudgetDetail({super.key});

  @override
  State<BudgetDetail> createState() => _BudgetDetailState();
}

class _BudgetDetailState extends State<BudgetDetail> {
  double? containWidgetHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header of transaction detail page
                HeaderWidget(
                  title: AppLocalizations.of(context).details,
                  firstIcon: IconsUtils.back(
                    context: context,
                    onTap: () => Navigator.pop(context),
                  ),
                  thirdIcon: IconsUtils.verticalDote(
                    context: context,
                    onTap: () {},
                  ),
                ),

                // General information
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: SizeUtil.md, vertical: SizeUtil.sm_12),
                  child: Column(
                    children: [
                      // Category icon
                      Container(
                        width: 100,
                        height: 100,
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
                        height: SizeUtil.spaceBtwItems_12,
                      ),

                      Text(
                        AppLocalizations.of(context).education,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.tertiaryContainer,
                            ),
                      ),

                      // Spacing
                      const SizedBox(
                        height: SizeUtil.spaceBtwItems_4,
                      ),

                      Text(
                        "John’s College Tuition",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),

                // download and upload
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: SizeUtil.md, vertical: SizeUtil.sm_12),
                  child: Column(
                    children: [
                      const Separator(),

                      // Spacing
                      const SizedBox(
                        height: SizeUtil.spaceBtwItems_12,
                      ),

                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Download
                            GestureDetector(
                              child: Column(
                                children: [
                                  IconsUtils.download(context: context),
                                  // Spacing
                                  const SizedBox(
                                    height: SizeUtil.spaceBtwItems_4,
                                  ),
                                  Text(
                                    AppLocalizations.of(context).addFunds,
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                          color: Theme.of(context).colorScheme.surfaceContainer,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.secondaryContainer,
                                ),
                              ),
                            ),
                            // Upload
                            GestureDetector(
                              child: Column(
                                children: [
                                  IconsUtils.upload(context: context),
                                  // Spacing
                                  const SizedBox(
                                    height: SizeUtil.spaceBtwItems_4,
                                  ),
                                  Text(
                                    AppLocalizations.of(context).withdraw,
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                          color: Theme.of(context).colorScheme.surfaceContainer,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Spacing
                      const SizedBox(
                        height: SizeUtil.spaceBtwItems_12,
                      ),

                      const Separator(),
                    ],
                  ),
                )
              ],
            ),

            // Bottom part
            Positioned(
              bottom: 0,
              child: Container(
                height: containWidgetHeight ?? (MediaQuery.of(context).size.height / 2.4),
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
                        child: SingleChildScrollView(
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Fund progress
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).fundProgress,
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                    ],
                                  ),
                                ),

                                // Spacing
                                const SizedBox(
                                  height: SizeUtil.spaceBtwItems_12,
                                ),

                                // Fund progress contain
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

                                      // Spacing
                                      const SizedBox(
                                        height: SizeUtil.spaceBtwItems_12,
                                      ),

                                      Row(
                                        children: [
                                          IconsUtils.info(context: context),

                                          // Spacing
                                          const SizedBox(
                                            width: SizeUtil.spaceBtwItems_8,
                                          ),

                                          Expanded(
                                            child: Text(
                                              AppLocalizations.of(context).fundInfo,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge
                                                  ?.copyWith(color: Theme.of(context).colorScheme.tertiaryContainer),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),

                                // Spacing
                                const SizedBox(
                                  height: SizeUtil.spaceBtwItems_24,
                                ),

                                // More details
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).moreDetails,
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                    ],
                                  ),
                                ),

                                // Spacing
                                const SizedBox(
                                  height: SizeUtil.spaceBtwItems_12,
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
                                      // Amount
                                      Wrap(
                                        spacing: SizeUtil.sm,
                                        direction: Axis.vertical,
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context).amount,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                              color: Theme.of(context).colorScheme.tertiaryContainer,
                                            ),
                                          ),
                                          Text(
                                            FormatterUtils.formatCurrency(120000),
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                              color: ColorsUtils.primary_5,
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Separator
                                      Container(
                                        margin: const EdgeInsets.only(top: SizeUtil.sm),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Theme.of(context).colorScheme.secondaryContainer,
                                          ),
                                        ),
                                      ),

                                      // Spacing
                                      const SizedBox(
                                        height: SizeUtil.defaultSpace,
                                      ),

                                      // Categories
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              AppLocalizations.of(context).categories,
                                              textAlign: TextAlign.start,
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                              ),
                                            ),
                                          ),

                                          // Spacing
                                          const SizedBox(
                                            width: SizeUtil.sm,
                                          ),

                                          Expanded(
                                            child: Text(
                                              "Investment",
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context).textTheme.titleSmall,
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Spacing
                                      const SizedBox(
                                        height: SizeUtil.defaultSpace,
                                      ),

                                      // Categories
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              AppLocalizations.of(context).type,
                                              textAlign: TextAlign.start,
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                              ),
                                            ),
                                          ),

                                          // Spacing
                                          const SizedBox(
                                            width: SizeUtil.sm,
                                          ),

                                          Expanded(
                                            child: Text(
                                              "Manual",
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context).textTheme.titleSmall,
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Spacing
                                      const SizedBox(
                                        height: SizeUtil.defaultSpace,
                                      ),

                                      // Categories
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              AppLocalizations.of(context).date,
                                              textAlign: TextAlign.start,
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                              ),
                                            ),
                                          ),

                                          // Spacing
                                          const SizedBox(
                                            width: SizeUtil.sm,
                                          ),

                                          Expanded(
                                            child: Text(
                                              FormatterUtils.formatDate(),
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context).textTheme.titleSmall,
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Spacing
                                      const SizedBox(
                                        height: SizeUtil.defaultSpace,
                                      ),

                                      // Categories
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              AppLocalizations.of(context).time,
                                              textAlign: TextAlign.start,
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                              ),
                                            ),
                                          ),

                                          // Spacing
                                          const SizedBox(
                                            width: SizeUtil.sm,
                                          ),

                                          Expanded(
                                            child: Text(
                                              FormatterUtils.formatTime(),
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context).textTheme.titleSmall,
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Spacing
                                      const SizedBox(
                                        height: SizeUtil.defaultSpace,
                                      ),

                                      // Categories
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              AppLocalizations.of(context).note,
                                              textAlign: TextAlign.start,
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                              ),
                                            ),
                                          ),

                                          // Spacing
                                          const SizedBox(
                                            width: SizeUtil.sm,
                                          ),

                                          Expanded(
                                            child: Text(
                                              "Dividend from AAPL stock",
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context).textTheme.titleSmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
