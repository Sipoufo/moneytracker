import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/core/widgets/input_form.widget.dart';
import 'package:moneytracker/core/widgets/loading.widget.dart';
import 'package:moneytracker/core/widgets/separator.widget.dart';
import 'package:moneytracker/core/widgets/show_snackbar.widget.dart';
import 'package:moneytracker/core/widgets/text_button.widget.dart';
import 'package:moneytracker/features/setting/domain/entities/user/setting_user.entity.dart';
import 'package:moneytracker/features/setting/presentation/blocs/user/setting_user.bloc.dart';
import 'package:moneytracker/features/setting/presentation/blocs/user/setting_user.event.dart';
import 'package:moneytracker/features/setting/presentation/blocs/user/setting_user.state.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  TextEditingController fullNameInputController = TextEditingController();
  TextEditingController usernameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  bool canEdit = false;
  String? username;

  @override
  void initState() {
    context.read<SettingUserBloc>().add(const SettingFetchCurrentUserEvent());
    loadCurrentUsername();
    super.initState();
  }

  loadCurrentUsername() async {
    final prefs = await InitValuesUtil.sharedPreferences;
    setState(() {
      username = prefs.getString("username");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: BlocConsumer<SettingUserBloc, SettingUserState>(
          listener: (context, state) {
            // If response is successful
            if (state is SettingUserSuccessSaveState) {
              showSnackBar(context, "Successful updated", isError: false);
              context.read<SettingUserBloc>().add(const SettingFetchCurrentUserEvent());
            }

            if (state is SettingUserSuccessFetchState) {
              fullNameInputController = TextEditingController(text: state.settingUserEntity?.fullName ?? "");
              usernameInputController = TextEditingController(text: state.settingUserEntity?.userName ?? "");
              emailInputController = TextEditingController(text: state.settingUserEntity?.email ?? "");
              loadCurrentUsername();
            }
            if (state is SettingUserFailureState) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is SettingUserLoadingState) {
              return const Expanded(child: LoadingWidget());
            }
            return Column(
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
                                    username != null && username!.isNotEmpty ? username![0] : "S",
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
                                    if (!canEdit)
                                      TextButtonWidget(
                                        title: AppLocalizations.of(context).edit,
                                        onPress: () {
                                          setState(() {
                                            canEdit = true;
                                          });
                                        },
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
                                  readOnly: !canEdit,
                                ),

                                // User name
                                InputFormWidget(
                                  placeholder: AppLocalizations.of(context).username,
                                  label: AppLocalizations.of(context).username,
                                  controller: usernameInputController,
                                  textInputType: TextInputType.text,
                                  readOnly: !canEdit,
                                ),

                                // Email
                                InputFormWidget(
                                  placeholder: AppLocalizations.of(context).email,
                                  label: AppLocalizations.of(context).email,
                                  controller: emailInputController,
                                  textInputType: TextInputType.emailAddress,
                                  readOnly: !canEdit,
                                ), // Valid

                                // Save button
                                if (canEdit)
                                  ButtonWidget(
                                    title: AppLocalizations.of(context).saveChanges,
                                    textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                          color: ColorsUtils.primary_5,
                                        ),
                                    onTap: () {
                                      setState(() {
                                        canEdit = false;
                                      });
                                      context.read<SettingUserBloc>().add(
                                            SettingSaveCurrentUserEvent(
                                              SettingUserEntity(
                                                id: 0,
                                                fullName: fullNameInputController.text,
                                                userName: usernameInputController.text,
                                                email: emailInputController.text,
                                              ),
                                            ),
                                          );
                                    },
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
            );
          },
        ),
      ),
    );
  }
}
