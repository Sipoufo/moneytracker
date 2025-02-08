import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/core/widgets/input_form.widget.dart';
import 'package:moneytracker/core/widgets/separator.widget.dart';
import 'package:moneytracker/core/widgets/text_button.widget.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  TextEditingController fullNameInputController = TextEditingController();
  TextEditingController usernameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  
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
              title: AppLocalizations.of(context).account,
              firstIcon: IconsUtils.back(context: context, onTap: () => Navigator.pop(context)),
            ),

            // Contain
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(SizeUtil.md),
                  child: Column(
                    spacing: SizeUtil.defaultSpace,
                    children: [
                      // Profile picture
                      Column(
                        spacing: SizeUtil.spaceBtwItems_12,
                        children: [
                          // Picture place
                          Container(
                            width: SizeUtil.imageSize,
                            height: SizeUtil.imageSize,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsUtils.primary_5,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "S",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ),

                          // text button
                          TextButtonWidget(
                            title: AppLocalizations.of(context).addProfilePicture,
                            onPress: () {},
                            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: ColorsUtils.primary_5,
                                ),
                          ),
                        ],
                      ),

                      // Separator
                      const Separator(),

                      // Form
                      Form(
                        child: Column(
                          spacing: SizeUtil.defaultSpace,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    AppLocalizations.of(context).userInformation,
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                TextButtonWidget(
                                  title: AppLocalizations.of(context).edit,
                                  onPress: () {},
                                  textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: ColorsUtils.primary_5,
                                      ),
                                ),
                              ],
                            ),

                            // Full name
                            InputFormWidget(
                              placeholder: AppLocalizations.of(context).fullName,
                              label: AppLocalizations.of(context).fullName,
                              controller: fullNameInputController,
                              textInputType: TextInputType.text,
                            ),

                            // User name
                            InputFormWidget(
                              placeholder: AppLocalizations.of(context).username,
                              label: AppLocalizations.of(context).username,
                              controller: fullNameInputController,
                              textInputType: TextInputType.text,
                            ),

                            // Email
                            InputFormWidget(
                              placeholder: AppLocalizations.of(context).email,
                              label: AppLocalizations.of(context).email,
                              controller: fullNameInputController,
                              textInputType: TextInputType.text,
                            ),// Valid

                            // Save button
                            ButtonWidget(
                              title: AppLocalizations.of(context).saveChanges,
                              textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: ColorsUtils.primary_5,
                              ),
                              onTap: () {},
                              padding: const EdgeInsets.all(SizeUtil.spaceBtwItems_16),
                              color: Theme.of(context).colorScheme.primary,
                              border: const BorderSide(
                                color: ColorsUtils.primary_5,
                                width: SizeUtil.borderRadiusXs,
                              ),
                            ),
                          ],
                        ),
                      )
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
