import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/information.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/drop_down_button.widget.dart';
import 'package:moneytracker/core/widgets/show_snackbar.widget.dart';
import 'package:moneytracker/core/widgets/tag.widget.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.bloc.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.event.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.state.dart';

class NewTransactionWalletCategoriesWidget extends StatefulWidget {
  const NewTransactionWalletCategoriesWidget({
    super.key,
    this.selectedWallet,
    required this.updateFields,
    required this.updateTransactionStepIndex,
  });

  final String? selectedWallet;
  final Function({required SettingWalletEntity selectWallet, required String selectTypeCategory, required String selectCategory}) updateFields;
  final Function(int step) updateTransactionStepIndex;

  @override
  State<NewTransactionWalletCategoriesWidget> createState() => _NewTransactionWalletCategoriesWidgetState();
}

class _NewTransactionWalletCategoriesWidgetState extends State<NewTransactionWalletCategoriesWidget> {
  String? category;
  SettingWalletEntity? selectedWallet;
  double? containWidgetHeight;
  String? selectedTypeCategory;
  bool loadWallet = true;

  List<SettingWalletEntity> wallets = [];

  @override
  void initState() {
    context.read<SettingWalletBloc>().add(const SettingFetchAllWalletsEvent());
    super.initState();
  }

  void nextStep() {
    if (selectedWallet == null) {
      showSnackBar(context, "Enter wallet !");
      return;
    }
    if (selectedTypeCategory == null) {
      showSnackBar(context, "Select category type !");
      return;
    }
    if (category == null) {
      showSnackBar(context, "Choose one category !");
      return;
    }
    widget.updateFields(selectWallet: selectedWallet!, selectTypeCategory: selectedTypeCategory!, selectCategory: category!);
    widget.updateTransactionStepIndex(1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BlocConsumer<SettingWalletBloc, SettingWalletState>(
        listener: (context, state) {
          if (state is SettingWalletSuccessFetchAllState) {
            setState(() {
              wallets = state.settingWalletsEntities;
              loadWallet = false;
            });
          }
        },
        builder: (context, state) {
          return const SizedBox();
        },
      ),

      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SizeUtil.sm_12,
          vertical: SizeUtil.md,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Step 1 contain
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Wallet
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Wallet
                      Text(
                        AppLocalizations.of(context).wallet,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),

                      // Spacing
                      const SizedBox(
                        height: SizeUtil.sm,
                      ),

                      DropDownButtonWidget<SettingWalletEntity>(
                        placeholder: AppLocalizations.of(context).wallet,
                        selectedValue: selectedWallet,
                        onChanged: (SettingWalletEntity? value) {
                          if (value != null) {
                            setState(() {
                              selectedWallet = value;
                            });
                          }
                        },
                        values: wallets.map<DropdownMenuItem<SettingWalletEntity>>((SettingWalletEntity wallet) {
                          return DropdownMenuItem<SettingWalletEntity>(
                            value: wallet,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              child: Text(
                                wallet.name,
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  // Spacing
                  const SizedBox(
                    height: SizeUtil.sm,
                  ),

                  // Categories types
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SizeUtil.sm_12,
                      vertical: SizeUtil.md,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (selectedWallet != null)
                          Text(
                            AppLocalizations.of(context).chooseCategory,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),

                        // Spacing
                        const SizedBox(
                          height: SizeUtil.sm_12,
                        ),

                        if (selectedWallet != null && category == null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedTypeCategory = AppLocalizations.of(context).income;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(SizeUtil.sm_12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: selectedTypeCategory == AppLocalizations.of(context).income
                                            ? ColorsUtils.primary_5
                                            : Theme.of(context).colorScheme.secondaryContainer,
                                      ),
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context).income,
                                          style: Theme.of(context).textTheme.titleSmall,
                                        ),

                                        // Spacing
                                        const SizedBox(
                                          height: SizeUtil.sm,
                                        ),

                                        Container(
                                          width: SizeUtil.buttonWidth_48,
                                          height: SizeUtil.buttonWidth_48,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/pictures/categories/income.png"),
                                              alignment: Alignment.center,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // Spacing
                              const SizedBox(
                                width: SizeUtil.md,
                              ),

                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedTypeCategory = AppLocalizations.of(context).expenses;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(SizeUtil.sm_12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: selectedTypeCategory == AppLocalizations.of(context).expenses
                                            ? ColorsUtils.primary_5
                                            : Theme.of(context).colorScheme.secondaryContainer,
                                      ),
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context).expenses,
                                          style: Theme.of(context).textTheme.titleSmall,
                                        ),

                                        // Spacing
                                        const SizedBox(
                                          height: SizeUtil.sm,
                                        ),

                                        Container(
                                          width: SizeUtil.buttonWidth_48,
                                          height: SizeUtil.buttonWidth_48,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/pictures/categories/expense.png"),
                                              alignment: Alignment.center,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        // Final choose category
                        if (category != null)
                          Container(
                            padding: const EdgeInsets.all(SizeUtil.sm_12),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primaryContainer,
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.secondaryContainer,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(SizeUtil.borderRadiusMd))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      category ?? "",
                                      style: Theme.of(context).textTheme.titleSmall,
                                      textAlign: TextAlign.left,
                                    ),
                                    const SizedBox(
                                      width: SizeUtil.sm,
                                    ),
                                    TagWidget(
                                      name: selectedTypeCategory ?? "",
                                      textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                                            color: ColorsUtils.text_black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                      backgroundColor: ColorsUtils.primary_2,
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      category = null;
                                    });
                                  },
                                  child: Text(
                                    "Edit",
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                          color: ColorsUtils.primary_4,
                                        ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom buttons
            Column(
              children: [
                ButtonWidget(
                  title: AppLocalizations.of(context).next,
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                  onTap: () {
                    nextStep();
                  },
                  padding: const EdgeInsets.all(SizeUtil.md),
                  color: ColorsUtils.primary_5,
                ),
                ButtonWidget(
                  title: AppLocalizations.of(context).cancel,
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  padding: const EdgeInsets.all(SizeUtil.md),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ),

      // List of category
      if (selectedTypeCategory != null && category == null)
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
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pan button
                    GestureDetector(
                      onPanUpdate: (detail) {
                        setState(() {
                          double value =
                              (containWidgetHeight ??= MediaQuery.of(context).size.height / 1.5) - detail.delta.dy;
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
                      height: SizeUtil.lg,
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TagWidget(
                              name: selectedTypeCategory!,
                              textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: ColorsUtils.text_black,
                                    fontWeight: FontWeight.w700,
                                  ),
                              backgroundColor: ColorsUtils.primary_2,
                            ),

                            // Spacing
                            const SizedBox(
                              height: SizeUtil.lg,
                            ),

                            // list of categories
                            Column(
                              children: InformationUtil.categoriesTypes(context).map((categoryType) {
                                return GestureDetector(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          categoryType["type"],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(color: Theme.of(context).colorScheme.tertiaryContainer),
                                        ),

                                        // Spacing
                                        const SizedBox(
                                          height: SizeUtil.sm,
                                        ),

                                        SizedBox(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: categoryType["values"].map<Widget>((value) {
                                              return Padding(
                                                padding: const EdgeInsets.symmetric(vertical: SizeUtil.xs_6),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      category = value;
                                                    });
                                                  },
                                                  child: Container(
                                                    clipBehavior: Clip.hardEdge,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
                                                      border: Border.all(
                                                        color: Theme.of(context).colorScheme.secondaryContainer,
                                                      ),
                                                      color: Theme.of(context).colorScheme.primaryContainer,
                                                    ),
                                                    child: IntrinsicHeight(
                                                      child: Row(
                                                        children: [
                                                          Container(width: SizeUtil.sm, color: ColorsUtils.primary_5),
                                                          Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(SizeUtil.sm_12),
                                                              child: Text(
                                                                value,
                                                                style: Theme.of(context).textTheme.titleSmall,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),

                                        // Spacing
                                        const SizedBox(
                                          height: SizeUtil.md_18,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    ]);
  }
}
