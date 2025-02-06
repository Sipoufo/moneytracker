import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:moneytracker/core/utils/constants/Images.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/separator.widget.dart';

class NewTransactionAmountIconWidget extends StatelessWidget {
  const NewTransactionAmountIconWidget({super.key, required this.updateSelectedAmountIcon});

  final Function(String amountIcon) updateSelectedAmountIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: SizeUtil.md,
      ),
      padding: const EdgeInsets.all(SizeUtil.sm_12),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        border: Border.all(
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(SizeUtil.borderRadiusMd),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: ImagesUtils.iconsData(context).mapIndexed<Widget>((index, step) {
            // return GridView.count(
            //   crossAxisCount: 5,
            //   children: step["items"].mapIndexed<Widget>((index, step) {
            //     return Container(
            //       width: SizeUtil.defaultSpace,
            //       height: SizeUtil.defaultSpace,
            //       decoration: BoxDecoration(
            //         image: DecorationImage(
            //           image: AssetImage(step),
            //           alignment: Alignment.center,
            //           fit: BoxFit.contain,
            //         ),
            //       ),
            //     );
            //   }).toList(),
            // );
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step["title"],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: SizeUtil.sm_12),
                GridView.count(
                  crossAxisCount: 6,
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  addAutomaticKeepAlives: false,
                  children: step["items"].map<Widget>((step) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () => updateSelectedAmountIcon(step),
                          child: Image(
                            image: AssetImage(step),
                            height: SizeUtil.xl,
                            width: SizeUtil.xl,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                if (index < ImagesUtils.iconsData(context).length - 1)
                const Separator(),
              ],
            );
          }).toList(),
        )
      ),
    );
  }
}
