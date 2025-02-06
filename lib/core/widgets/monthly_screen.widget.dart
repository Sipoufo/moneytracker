import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/information.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';

class MonthlyScreenWidget extends StatefulWidget {
  const MonthlyScreenWidget({
    super.key,
    required this.date,
    required this.changeDate,
    required this.changeOpenDateModal,
  });

  final DateTime date;
  final Function(DateTime actualDate) changeDate;
  final Function(bool value) changeOpenDateModal;

  @override
  State<MonthlyScreenWidget> createState() => _MonthlyScreenWidgetState();
}

class _MonthlyScreenWidgetState extends State<MonthlyScreenWidget> {
  late DateTime currentMonth;
  late List<DateTime> datesGrid;

  @override
  void initState() {
    super.initState();
    currentMonth = widget.date;
    datesGrid = _generateDatesGrid(currentMonth);
  }

  List<DateTime> _generateDatesGrid(DateTime month) {
    int numDays = DateTime(month.year, month.month + 1, 0).day;
    int firstWeekday = DateTime(month.year, month.month, 1).weekday % 7;
    List<DateTime> dates = [];

    // Fill previous month's dates
    DateTime previousMonth = DateTime(month.year, month.month - 1);
    int previousMonthLastDay = DateTime(previousMonth.year, previousMonth.month + 1, 0).day;
    for (int i = firstWeekday; i > 0; i--) {
      dates.add(DateTime(previousMonth.year, previousMonth.month, previousMonthLastDay - i + 1));
    }

    // Fill current month's dates
    for (int day = 1; day <= numDays; day++) {
      dates.add(DateTime(month.year, month.month, day));
    }

    // Fill next month's dates
    int remainingBoxes = 42 - dates.length; // 6 weeks * 7 days
    for (int day = 1; day <= remainingBoxes; day++) {
      dates.add(DateTime(month.year, month.month + 1, day));
    }

    return dates;
  }

  void _changeMonth(int offset) {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month + offset);
      datesGrid = _generateDatesGrid(currentMonth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SizeUtil.defaultSpace,
      children: [
        // Calender
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: SizeUtil.sm_12,
              children: [
                IconsUtils.arrowLeft2(
                  context: context,
                  onTap: () => _changeMonth(-1),
                ),
                Text(
                  '${InformationUtil.monthValues(context)[currentMonth.month - 1]} ${currentMonth.year}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconsUtils.arrowRight2(
                  context: context,
                  onTap: () => _changeMonth(1),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    7,
                    (index) => Text(
                          ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][index],
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
              ),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
              itemCount: datesGrid.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              addAutomaticKeepAlives: false,
              itemBuilder: (context, index) {
                DateTime date = datesGrid[index];
                bool isSelectedCurrentMonth = date.month == widget.date.month;
                bool isCurrentMonth = date.month == currentMonth.month;
                bool isCurrentDate = date.day == widget.date.day;
                bool isSunday = date.weekday == 7;
                return GestureDetector(
                  onTap: () {
                    DateTime finalDate = DateTime(currentMonth.year, currentMonth.month, date.day);

                    setState(() {
                      currentMonth = finalDate;
                      widget.changeDate(finalDate);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: isSelectedCurrentMonth && isCurrentDate ? ColorsUtils.primary_5 : Colors.transparent,
                        borderRadius: BorderRadius.circular(SizeUtil.borderRadius2Xl)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        date.day.toString(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: isSunday && !isCurrentMonth && !isCurrentDate
                                  ? ColorsUtils.danger_3
                                  : isSunday && !isCurrentDate
                                      ? ColorsUtils.danger_5
                                      : isCurrentMonth
                                          ? Theme.of(context).colorScheme.surface
                                          : Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),

        // Validation button
        ButtonWidget(
          title: AppLocalizations.of(context).done,
          textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: ColorsUtils.primary_5,
              ),
          onTap: () {
            setState(() {
              widget.changeDate(currentMonth);
              widget.changeOpenDateModal(false);
            });
          },
          padding: const EdgeInsets.all(SizeUtil.spaceBtwItems_16),
          color: Theme.of(context).colorScheme.primary,
          border: const BorderSide(
            color: ColorsUtils.primary_5,
            width: SizeUtil.borderRadiusXs,
          ),
        )
      ],
    );
  }
}
