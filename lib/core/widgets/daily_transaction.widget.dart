import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/core/utils/helpers/functions.helper.dart';
import 'package:moneytracker/core/widgets/transaction_item.widget.dart';

class DailyTransactionWidget extends StatelessWidget {
  const DailyTransactionWidget({
    super.key,
    required this.title,
    required this.dateTime,
  });

  final String title;
  final DateTime dateTime;


  @override
  Widget build(BuildContext context) {
    final List<Map> transactionItem = [
      {
        "transactionType": "income",
        "transactionCategory": "Business",
        "transactionName": "Food Sales",
        "amount": 120000.0,
      },
      {
        "transactionType": "income",
        "transactionCategory": "Business",
        "transactionName": "Food Sales",
        "amount": 120000.0,
      },
      {
        "transactionType": "expense",
        "transactionCategory": "Business",
        "transactionName": "Food Sales",
        "amount": 120000.0,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          FormatterUtils.formatDate(date: dateTime),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: !HelperFunctions.isDarkMode(context)
                    ? ColorsUtils.grayscale_gray_tinded_gray
                    : ColorsUtils.grayscale_gray_pale_gray,
              ),
        ),
        const SizedBox(
          height: SizeUtil.spaceBtwItems,
        ),

        // Transaction items
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(
            height: SizeUtil.spaceBtwItems,
          ),
          itemCount: transactionItem.length,
          itemBuilder: (context, index) => TransactionItemWidget(
              transactionType: transactionItem[index]["transactionType"],
              transactionCategory: transactionItem[index]["transactionCategory"],
              transactionName: transactionItem[index]["transactionName"],
              amount: transactionItem[index]["amount"],
          ),
        ),
      ],
    );
  }
}
