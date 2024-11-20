import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeUtil.spaceBtwItems_2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(SizeUtil.sm),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeUtil.borderRadiusSm),
                  color: ColorsUtils.primary_5,
                ),
                child: Container(
                  width: SizeUtil.defaultSpace,
                  height: SizeUtil.defaultSpace,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/pictures/logo/logo.png"),
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: SizeUtil.defaultSpace,
              ),
              Text(
                AppLocalizations.of(context).appName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),

          // 2 Lefts button
          Row(
            children: [
              IconsUtils.search(context: context, onTap: () {}),
              IconsUtils.notification(context: context, onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
