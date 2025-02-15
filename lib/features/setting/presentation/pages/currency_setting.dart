import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/information.util.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/models/country_infos.model.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/core/widgets/loading.widget.dart';

class CurrentSetting extends StatefulWidget {
  const CurrentSetting({super.key});

  @override
  State<CurrentSetting> createState() => _CurrentSettingState();
}

class _CurrentSettingState extends State<CurrentSetting> {
  List<CountryInfos> countriesInfos = [];
  CountryInfos? countryInfos;
  bool loadData = true;

  @override
  void initState() {
    loadAllCountries();
    super.initState();
  }

  loadAllCountries() async {
    List<CountryInfos> items = await InformationUtil.countries();
    final prefs = await InitValuesUtil.sharedPreferences;
    String? actualCountryName = prefs.getString("countryName");

    setState(() {
      countriesInfos = items;
    });
    for (CountryInfos item in items) {
      if (item.name == actualCountryName) {
        countryInfos = item;
      }
    }

    loadData = false;
  }

  updateCurrentCurrency(CountryInfos country) async {
    setState(() {
      countryInfos = country;
    });
    final prefs = await InitValuesUtil.sharedPreferences;
    await prefs.setString("currency", country.currency.symbol);
    await prefs.setString("countryName", country.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (loadData == true)
              const Expanded(child: LoadingWidget()),

            // Header of account setting page
            if (loadData == false)
            HeaderWidget(
              title: AppLocalizations.of(context).currency,
              firstIcon: IconsUtils.back(context: context, onTap: () => Navigator.pop(context)),
            ),

            // Current currency
            if (loadData == false)
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
                        title: countryInfos != null ? "${countryInfos?.name} (${countryInfos?.currency.code})" : "Cameroon (FCFA)",
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        onTap: () {},
                        padding: const EdgeInsets.all(SizeUtil.md_18),
                        color: Theme.of(context).colorScheme.primaryContainer,
                        icon: Text(
                          countryInfos?.flag.emoji ?? "🇨🇲",
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
            if (loadData == false)
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
                          Column(
                            spacing: SizeUtil.defaultSpace,
                            children: countriesInfos.map((country) {
                              return ButtonWidget(
                                title: "${country.name} (${country.currency.code})",
                                textStyle: Theme.of(context).textTheme.titleMedium,
                                onTap: () => updateCurrentCurrency(country),
                                padding: const EdgeInsets.all(SizeUtil.md_18),
                                color: Theme.of(context).colorScheme.primaryContainer,
                                icon: Text(
                                  country.flag.emoji,
                                ),
                                secondIcon: Icon(
                                  country.name == countryInfos?.name ? Icons.lightbulb_circle_sharp : Icons.circle_outlined,
                                  color: country.name == countryInfos?.name ? ColorsUtils.primary_4 : ColorsUtils.grayscale_white_dark_white,
                                  size: SizeUtil.iconMd,
                                ),
                                border: BorderSide(
                                  color: Theme.of(context).colorScheme.secondaryContainer,
                                ),
                              );
                            }).toList(),
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
