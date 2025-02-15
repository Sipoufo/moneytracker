import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/information.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/models/country_infos.model.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/drop_down_button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/widgets/input_form.widget.dart';
import 'package:moneytracker/core/widgets/loading.widget.dart';
import 'package:moneytracker/core/widgets/show_snackbar.widget.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.bloc.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.event.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.state.dart';

class AddWalletSetting extends StatefulWidget {
  const AddWalletSetting({super.key});

  @override
  State<AddWalletSetting> createState() => _AddWalletSettingState();
}

class _AddWalletSettingState extends State<AddWalletSetting> {
  TextEditingController walletInputController = TextEditingController();
  TextEditingController amountInputController = TextEditingController();
  CountryInfos? countrySelected;
  List<CountryInfos> countries = [];

  @override
  void initState() {
    loadCountry();
    context.read<SettingWalletBloc>().add(const SettingFetchAllWalletsEvent());
    super.initState();
  }

  loadCountry() async {
    List<CountryInfos> countriesResult = await InformationUtil.countries();
    setState(() {
      countries = countriesResult;
    });
  }

  saveWallet(BuildContext context) {
    if (walletInputController.text.trim() == "") {
      showSnackBar(context, "Enter the name of your wallet");
      return;
    }
    if (amountInputController.text.trim() == "") {
      showSnackBar(context, "Enter your initial amount");
      return;
    }
    if (countrySelected == null) {
      showSnackBar(context, "Enter your country");
      return;
    }
    context.read<SettingWalletBloc>().add(
          SettingSaveWalletEvent(
            SettingWalletEntity(
              name: walletInputController.text.trim(),
              country: countrySelected!,
              amount: double.parse(amountInputController.text.trim()),
              isSelected: false,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: BlocConsumer<SettingWalletBloc, SettingWalletState>(
          listener: (context, state) {
            if (state is SettingWalletSuccessSaveWalletState) {
              showSnackBar(context, "Wallet saved !", isError: false);
              context.read<SettingWalletBloc>().add(const SettingFetchAllWalletsEvent());
              Navigator.pop(context);
            }
            if (state is SettingWalletFailureState) {
              showSnackBar(context, state.message, isError: true);
            }
          },
          builder: (context, state) {
            if (state is SettingWalletLoadingState) {
              return const Expanded(child: LoadingWidget());
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header of account setting page
                HeaderWidget(
                  title: AppLocalizations.of(context).createWallet,
                  firstIcon: IconsUtils.back(context: context, onTap: () => Navigator.pop(context)),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(SizeUtil.md),
                      child: Form(
                        child: Column(
                          spacing: SizeUtil.defaultSpace,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Full name
                            InputFormWidget(
                              placeholder: AppLocalizations.of(context).nameWallet,
                              label: AppLocalizations.of(context).nameWallet,
                              controller: walletInputController,
                              textInputType: TextInputType.text,
                            ),

                            // User name
                            Column(
                              spacing: SizeUtil.sm,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context).selectCountry,
                                  style: Theme.of(context).textTheme.displayLarge,
                                ),
                                DropDownButtonWidget<CountryInfos>(
                                  placeholder: AppLocalizations.of(context).wallet,
                                  selectedValue: countrySelected,
                                  onChanged: (CountryInfos? value) {
                                    setState(() {
                                      countrySelected = value;
                                    });
                                  },
                                  values: countries.map<DropdownMenuItem<CountryInfos>>((CountryInfos country) {
                                    return DropdownMenuItem<CountryInfos>(
                                      value: country,
                                      child: Row(
                                        spacing: SizeUtil.spaceBtwItems_8,
                                        children: [
                                          Text(
                                            country.flag.emoji,
                                            style: Theme.of(context).textTheme.bodySmall,
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            "${country.name} (${country.currency.symbol})",
                                            style: Theme.of(context).textTheme.bodySmall,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),

                            // Email
                            InputFormWidget(
                              placeholder: AppLocalizations.of(context).initialAmount,
                              label: AppLocalizations.of(context).initialAmount,
                              controller: amountInputController,
                              textInputType: TextInputType.number,
                            ), // Valid

                            // Save button
                            ButtonWidget(
                              title: AppLocalizations.of(context).saveChanges,
                              textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: ColorsUtils.primary_5,
                              ),
                              onTap: () => saveWallet(context),
                              padding: const EdgeInsets.all(SizeUtil.spaceBtwItems_16),
                              color: Theme.of(context).colorScheme.primary,
                              border: const BorderSide(
                                color: ColorsUtils.primary_5,
                                width: SizeUtil.borderRadiusXs,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
