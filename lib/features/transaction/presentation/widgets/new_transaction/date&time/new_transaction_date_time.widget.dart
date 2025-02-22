import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/information.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/monthly_screen.widget.dart';
import 'package:moneytracker/core/widgets/separator.widget.dart';
import 'package:moneytracker/core/widgets/show_snackbar.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/new_transaction/date&time/new_transaction_date_time.time_item.widget.dart';

class NewTransactionDateTimeWidget extends StatefulWidget {
  const NewTransactionDateTimeWidget({
    super.key,
    required this.updateFields,
    required this.updateTransactionStepIndex,
  });

  final Function(int step) updateTransactionStepIndex;
  final Function({required DateTime selectedDateTime}) updateFields;

  @override
  State<NewTransactionDateTimeWidget> createState() => _NewTransactionDateTimeWidgetState();
}

class _NewTransactionDateTimeWidgetState extends State<NewTransactionDateTimeWidget> {
  String hour = "${DateTime.now().hour}";
  String minute = "${DateTime.now().minute}";
  String dailySegment = "AM";
  double? containWidgetHeight;
  DateTime? date;
  bool openDateModal = false;

  void changeHour(String actualHour) {
    setState(() {
      hour = actualHour;
    });
  }

  void changeMinute(String actualMinute) {
    setState(() {
      minute = actualMinute;
    });
  }

  void changeDailySegment(String actualDailySegment) {
    setState(() {
      dailySegment = actualDailySegment;
    });
  }

  void changeDate(DateTime actualDate) {
    setState(() {
      date = actualDate;
    });
  }

  void changeOpenDateModal(bool value) {
    setState(() {
      openDateModal = value;
    });
  }

  void nextStep() {
    if (date == null) {
      showSnackBar(context, "Enter date !");
      return;
    }
    date!.copyWith(
      hour: dailySegment == "AM" ? int.parse(minute) : (int.parse(minute) + 12),
      minute: int.parse(minute),
    );
    widget.updateFields(selectedDateTime: date!);
    widget.updateTransactionStepIndex(2);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SizeUtil.sm_12,
            vertical: SizeUtil.md,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: SizeUtil.lg,
                    children: [
                      // Date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: SizeUtil.sm,
                        children: [
                          // Date
                          Text(
                            AppLocalizations.of(context).date,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),

                          // Date button selector
                          ButtonWidget(
                            title: date == null ? AppLocalizations.of(context).selectDate : "${date!.day} ${InformationUtil.monthValues(context)[date!.month - 1]} ${date!.year}",
                            textStyle: Theme.of(context).textTheme.titleMedium,
                            onTap: () {
                              changeOpenDateModal(true);
                            },
                            padding: const EdgeInsets.all(SizeUtil.md),
                            color: Theme.of(context).colorScheme.primaryContainer,
                            secondIcon: IconsUtils.arrowRight(context: context),
                            border: BorderSide(color: Theme.of(context).colorScheme.secondaryContainer),
                          ),
                        ],
                      ),

                      // Time
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: SizeUtil.sm,
                        children: [
                          // Date
                          Text(
                            AppLocalizations.of(context).time,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),

                          // Contain
                          Column(
                            spacing: SizeUtil.md,
                            children: [
                              // Date selector
                              Container(
                                height: SizeUtil.xl2,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
                                    border: Border.all(color: Theme.of(context).colorScheme.secondaryContainer)),
                                child: Row(
                                  children: [
                                    // Hours
                                    Expanded(
                                      child: NewTransactionDateTimeTimeItemWidget(
                                        values: InformationUtil.hours,
                                        initIndex: InformationUtil.hours.where((item) => item == hour).isNotEmpty
                                            ? int.parse(
                                                    InformationUtil.hours.where((item) => item == hour).toList()[0]) -
                                                1
                                            : 0,
                                        changeValue: changeHour,
                                      ),
                                    ),
                                    //Separator
                                    const Separator(
                                      margin: EdgeInsets.symmetric(vertical: SizeUtil.sm_12),
                                    ),
                                    // Minutes
                                    Expanded(
                                      child: NewTransactionDateTimeTimeItemWidget(
                                        values: InformationUtil.minutes,
                                        initIndex: InformationUtil.hours.where((item) => item == minute).isNotEmpty
                                            ? int.parse(
                                                InformationUtil.hours.where((item) => item == minute).toList()[0])
                                            : 0,
                                        changeValue: changeMinute,
                                      ),
                                    ),
                                    //Separator
                                    const Separator(
                                      margin: EdgeInsets.symmetric(vertical: SizeUtil.sm_12),
                                    ),
                                    // Dailies segments
                                    Expanded(
                                      child: NewTransactionDateTimeTimeItemWidget(
                                        values: InformationUtil.dailiesSegments,
                                        initIndex: 0,
                                        changeValue: changeDailySegment,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Separator
                              const Separator(),

                              // Date value
                              RichText(
                                text: TextSpan(style: Theme.of(context).textTheme.titleSmall, children: [
                                  TextSpan(text: hour),
                                  const TextSpan(text: ":"),
                                  TextSpan(text: minute),
                                  TextSpan(text: " $dailySegment"),
                                ]),
                              ),

                              // Separator
                              const Separator(),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Button button
              Column(
                children: [
                  // Next button
                  ButtonWidget(
                    title: AppLocalizations.of(context).next,
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                    onTap: () {
                      if (date == null) {
                        showSnackBar(context, "Enter the date !");
                      } else {
                        widget.updateTransactionStepIndex(3);
                      }
                    },
                    padding: const EdgeInsets.all(SizeUtil.md),
                    color: ColorsUtils.primary_5,
                  ),
                  // Previous button
                  ButtonWidget(
                    title: AppLocalizations.of(context).previous,
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                    onTap: () {
                      widget.updateTransactionStepIndex(1);
                    },
                    padding: const EdgeInsets.all(SizeUtil.md),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ],
          ),
        ),

        // Date
        if (openDateModal)
          Positioned(
            bottom: 0,
            child: Container(
              height: containWidgetHeight ?? (MediaQuery.of(context).size.height / 1.4),
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
                        height: SizeUtil.lg,
                      ),

                      Expanded(
                        child: SingleChildScrollView(
                          child: MonthlyScreenWidget(
                            date: date ?? DateTime.now(),
                            changeDate: changeDate,
                            changeOpenDateModal: changeOpenDateModal,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
