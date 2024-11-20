import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/icon_button.widget.dart';

class IconsUtils {
  // Navigation icons
  // Home icon
  static IconButtonWidget home({
    required BuildContext context,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return IconButtonWidget(
      onTap: onTap,
      color: isActive
          ? ColorsUtils.primary_5
          : Theme.of(context).colorScheme.secondary,
      icon: Icons.home,
    );
  }

  // Transaction icon
  static IconButtonWidget transaction({
    required BuildContext context,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return IconButtonWidget(
      onTap: onTap,
      color: isActive
          ? ColorsUtils.primary_5
          : Theme.of(context).colorScheme.secondary,
      icon: Icons.view_list_outlined,
    );
  }

  // Ad icon
  static IconButtonWidget add({
    required BuildContext context,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return IconButtonWidget(
      onTap: onTap,
      color: ColorsUtils.grayscale_black_black,
      icon: Icons.add,
      buttonStyle: IconButton.styleFrom(
          backgroundColor: ColorsUtils.primary_5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd))),
    );
  }

  // Budget icon
  static IconButtonWidget budget({
    required BuildContext context,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return IconButtonWidget(
      onTap: onTap,
      color: isActive
          ? ColorsUtils.primary_5
          : Theme.of(context).colorScheme.secondary,
      icon: Icons.balance_outlined,
    );
  }

  // Setting icon
  static IconButtonWidget setting({
    required BuildContext context,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return IconButtonWidget(
      onTap: onTap,
      color: isActive
          ? ColorsUtils.primary_5
          : Theme.of(context).colorScheme.secondary,
      icon: Icons.settings,
    );
  }

  // Home page
  // Search icon
  static IconButtonWidget search({
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return IconButtonWidget(
      onTap: onTap,
      color: Theme.of(context).colorScheme.tertiary,
      icon: Icons.search,
      buttonStyle: IconButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
          side: BorderSide(
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
      ),
    );
  }

  // Notification icon
  static IconButtonWidget notification({
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return IconButtonWidget(
      onTap: onTap,
      color: Theme.of(context).colorScheme.tertiary,
      icon: Icons.notifications_active,
      buttonStyle: IconButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
          side: BorderSide(
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
      ),
    );
  }

  // Income icon
  static const Icon incomeIcon = Icon(
    Icons.arrow_circle_up,
    color: ColorsUtils.primary_5,
  );

  // Expense icon
  static const Icon expenseIcon = Icon(
    Icons.arrow_circle_down,
    color: ColorsUtils.danger_6,
  );
}
