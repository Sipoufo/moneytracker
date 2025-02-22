import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/core/utils/helpers/functions.helper.dart';
import 'package:moneytracker/core/widgets/transaction_item.widget.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';

class DailyTransactionWidget extends StatelessWidget {
  const DailyTransactionWidget({
    super.key,
    this.title,
    required this.currency,
    required this.transactions,
  });

  final String? title;
  final String currency;
  final List<TransactionEntity> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SizeUtil.spaceBtwItems,
      children: [
        title != null
            ? Text(
                title!,
                style: Theme.of(context).textTheme.bodySmall,
              )
            : const SizedBox(),
        // Text(
        //   FormatterUtils.formatDate(date: dateTime),
        //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
        //         color: !HelperFunctions.isDarkMode(context)
        //             ? ColorsUtils.grayscale_gray_tinded_gray
        //             : ColorsUtils.grayscale_gray_pale_gray,
        //       ),
        // ),

        // Transaction items
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(
            height: SizeUtil.spaceBtwItems,
          ),
          itemCount: transactions.length,
          itemBuilder: (context, index) => TransactionItemWidget(
            transaction: transactions[index],
            currency: currency,
          ),
        ),
      ],
    );
  }
}
