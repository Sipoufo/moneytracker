import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

class IconsUtils {
  // Navigation icons
  // Home icon
  static IconButton home({
    required BuildContext context,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.home,
        size: SizeUtil.iconMd,
        color: isActive ? ColorsUtils.primary_5 : Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  // Transaction icon
  static IconButton transaction({
    required BuildContext context,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.view_list_outlined,
        size: SizeUtil.iconMd,
        color: isActive ? ColorsUtils.primary_5 : Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  // Ad icon
  static IconButton add({
    required BuildContext context,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return IconButton(
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: ColorsUtils.primary_5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd)
        )
      ),
      icon: const Icon(
        Icons.add,
        size: SizeUtil.iconMd,
        color: ColorsUtils.grayscale_black_black,
      ),
    );
  }

  // Budget icon
  static IconButton budget({
    required BuildContext context,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.balance_outlined,
        size: SizeUtil.iconMd,
        color: isActive ? ColorsUtils.primary_5 : Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  // Setting icon
  static IconButton setting({
    required BuildContext context,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.settings,
        size: SizeUtil.iconMd,
        color: isActive ? ColorsUtils.primary_5 : Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
