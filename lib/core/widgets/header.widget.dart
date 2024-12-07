import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

/// General header widget
/// [title] is the title of the header
/// [imageLeftPosition] is the image link of image position in left of title
/// [firstIcon] is the widget position of left of title
/// [secondIcon] is the widget position of first right of title
/// [thirdIcon] is the widget position of second right of title
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.title,
    this.imageLeftPosition,
    this.firstIcon,
    this.secondIcon,
    this.thirdIcon,
  });

  final String title;
  final String? imageLeftPosition;
  final Widget? firstIcon;
  final Widget? secondIcon;
  final Widget? thirdIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        SizeUtil.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          Row(
            children: [
              // First icon
              firstIcon ?? const SizedBox(),
              firstIcon != null ? const SizedBox(
                width: SizeUtil.defaultSpace,
              ) : const SizedBox(),

              // Image
              imageLeftPosition != null ? Container(
                padding: const EdgeInsets.all(SizeUtil.sm),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeUtil.borderRadiusSm),
                  color: ColorsUtils.primary_5,
                ),
                child: Container(
                  width: SizeUtil.defaultSpace,
                  height: SizeUtil.defaultSpace,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("$imageLeftPosition"),
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ) : const SizedBox(),
              imageLeftPosition != null ? const SizedBox(
                width: SizeUtil.defaultSpace,
              ) : const SizedBox(),

              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),

          // 2 Lefts button
          Row(
            children: [
              secondIcon ?? const SizedBox(),
              thirdIcon ?? const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
