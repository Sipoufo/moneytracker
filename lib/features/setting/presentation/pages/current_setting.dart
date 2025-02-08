import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/information.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/models/country_infos.model.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';

class CurrentSetting extends StatefulWidget {
  const CurrentSetting({super.key});

  @override
  State<CurrentSetting> createState() => _CurrentSettingState();
}

class _CurrentSettingState extends State<CurrentSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header of account setting page
            HeaderWidget(
              title: AppLocalizations.of(context).currency,
              firstIcon: IconsUtils.back(context: context, onTap: () => Navigator.pop(context)),
            ),

            // Current currency
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(SizeUtil.md),
              child: Column(
                spacing: SizeUtil.defaultSpace,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Current currency
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: SizeUtil.spaceBtwItems_12,
                    children: [
                      // Title
                      Text(
                        AppLocalizations.of(context).currentCurrency,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(color: Theme.of(context).colorScheme.tertiaryContainer),
                      ),

                      // Button add new wallet
                      ButtonWidget(
                        title: "Cameroon (FCFA)",
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        onTap: () {},
                        padding: const EdgeInsets.all(SizeUtil.md_18),
                        color: Theme.of(context).colorScheme.primaryContainer,
                        icon: const Text(
                          "🇨🇲",
                        ),
                        secondIcon: const Icon(
                          Icons.check_circle,
                          color: ColorsUtils.primary_4,
                          size: SizeUtil.iconMd,
                        ),
                        border: BorderSide(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      ),

                      // Description
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: SizeUtil.sm,
                        children: [
                          IconsUtils.info(context: context),
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context).currentCurrencyDetail,
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.tertiaryContainer,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Contain
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(SizeUtil.md),
                  child: Column(
                    spacing: SizeUtil.defaultSpace,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Current currency
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: SizeUtil.spaceBtwItems_12,
                        children: [
                          // Title
                          Text(
                            AppLocalizations.of(context).currentCurrency,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(color: Theme.of(context).colorScheme.tertiaryContainer),
                          ),

                          // Button add new wallet
                          FutureBuilder(
                            future: InformationUtil.countries(),
                            builder: (BuildContext context, AsyncSnapshot<List<CountryInfos>> countries) {
                              if (countries.connectionState == ConnectionState.waiting) {
                                return const Center(child: Text('Please wait its loading...'));
                              } else {
                                if (countries.hasError) {
                                  return Center(child: Text('Error: ${countries.error}'));
                                } else {
                                  return Column(
                                    spacing: SizeUtil.defaultSpace,
                                    children: countries.data!.map((country) {
                                      return ButtonWidget(
                                        title: "${country.name} (${country.currency.code})",
                                        textStyle: Theme.of(context).textTheme.titleMedium,
                                        onTap: () {},
                                        padding: const EdgeInsets.all(SizeUtil.md_18),
                                        color: Theme.of(context).colorScheme.primaryContainer,
                                        icon: Text(
                                          country.flag.emoji,
                                        ),
                                        secondIcon: const Icon(
                                          Icons.circle_outlined,
                                          color: ColorsUtils.grayscale_white_dark_white,
                                          size: SizeUtil.iconMd,
                                        ),
                                        border: BorderSide(color: Theme.of(context).colorScheme.secondaryContainer,),
                                      );
                                    }).toList(),
                                  );
                                }
                              }
                            },
                          ),
                        ],
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
