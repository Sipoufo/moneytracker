import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/features/budget/presentation/pages/budget.dart';
import 'package:moneytracker/features/home/presentation/pages/home.dart';
import 'package:moneytracker/features/navigation/cubit/application_navigation_cubit.cubit.dart';
import 'package:moneytracker/features/navigation/cubit/application_navigation_state.cubit.dart';
import 'package:moneytracker/features/setting/presentation/pages/setting.dart';
import 'package:moneytracker/features/transaction/presentation/pages/transaction.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  static const List<Widget> _pages = [
    Home(),
    Transaction(),
    Budget(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationNavigationCubit, ApplicationNavigationState>(
        builder: (context, state) {
      return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: SafeArea(
            child: _pages.elementAt(state.pageIndex),
          ),
          bottomNavigationBar: BottomAppBar(
            padding: const EdgeInsets.all(0.0),
            color: Theme.of(context).colorScheme.primary,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: SizeUtil.defaultSpace,
                  vertical: SizeUtil.spaceBtwItems_16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconsUtils.home(
                    context: context,
                    isActive: state.pageIndex == 0,
                    onTap: () => context
                        .read<ApplicationNavigationCubit>()
                        .changePage(0),
                  ),
                  IconsUtils.transaction(
                    context: context,
                    isActive: state.pageIndex == 1,
                    onTap: () => context
                        .read<ApplicationNavigationCubit>()
                        .changePage(1),),
                  IconsUtils.add(
                    context: context,
                    onTap: () => Navigator.pushNamed(context, "/transaction/new-transaction"),),
                  IconsUtils.budget(
                    context: context,
                    isActive: state.pageIndex == 2,
                    onTap: () => context
                        .read<ApplicationNavigationCubit>()
                        .changePage(2),),
                  IconsUtils.setting(
                    context: context,
                    isActive: state.pageIndex == 3,
                    onTap: () => context
                        .read<ApplicationNavigationCubit>()
                        .changePage(3),),
                ],
              ),
            ),
          ));
    });
  }
}
