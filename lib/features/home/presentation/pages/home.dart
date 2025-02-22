import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/core/widgets/card.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/widgets/loading.widget.dart';
import 'package:moneytracker/features/home/presentation/widgets/transaction_home.widget.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.bloc.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.event.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime today = DateTime.now();
  DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));

  String currentCurrency = "";

  @override
  void initState() {
    context.read<TransactionBloc>().add(TransactionFetchAllOfTodayAndYesterdayEvent());
    getCurrentCurrency();
    super.initState();
  }

  getCurrentCurrency() async {
    final prefs = await InitValuesUtil.sharedPreferences;
    setState(() {
      currentCurrency = prefs.getString("currency") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoadingState) {
          return const Center(child: LoadingWidget());
        }
        if (state is TransactionSuccessFetchHomeDataState) {
          return Column(
            children: [
              // Header of home page
              HeaderWidget(
                title: AppLocalizations.of(context).appName,
                imageLeftPosition: "assets/pictures/logo/logo.png",
                secondIcon: IconsUtils.search(context: context, onTap: () {}),
                thirdIcon: IconsUtils.notification(context: context, onTap: () {}),
              ),

              // Body of home page
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: SizeUtil.md,
                  vertical: SizeUtil.sm_12,
                ),
                child: Column(
                  children: [
                    // Net balance card
                    CardWidget(
                      backgroundColor: ColorsUtils.primary_5,
                      padding: const EdgeInsets.all(SizeUtil.lg),
                      borderRadius: SizeUtil.borderRadiusSm,
                      title: AppLocalizations.of(context).netBalance,
                      titleStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ColorsUtils.text_white,
                          ),
                      content: FormatterUtils.formatCurrency((state.homeEntity.totalIncomeAmount - state.homeEntity.totalExpenseAmount), symbol: currentCurrency),
                      contextStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: ColorsUtils.text_white,
                          ),
                      isHorizontalCenter: false,
                    ),
                    const SizedBox(
                      height: SizeUtil.spaceBtwItems_16,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: CardWidget(
                              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                              padding: const EdgeInsets.all(SizeUtil.lg),
                              borderRadius: SizeUtil.borderRadiusSm,
                              title: AppLocalizations.of(context).income,
                              titleStyle: Theme.of(context).textTheme.bodySmall,
                              content: FormatterUtils.formatCurrencyCompact(state.homeEntity.totalIncomeAmount,
                                  symbol: currentCurrency),
                              contextStyle: Theme.of(context).textTheme.titleLarge,
                              icon: IconsUtils.incomeIcon,
                            ),
                          ),
                          const SizedBox(
                            width: SizeUtil.spaceBtwItems_16,
                          ),
                          Expanded(
                            child: CardWidget(
                              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                              padding: const EdgeInsets.all(SizeUtil.lg),
                              borderRadius: SizeUtil.borderRadiusSm,
                              title: AppLocalizations.of(context).expenses,
                              titleStyle: Theme.of(context).textTheme.bodySmall,
                              content: FormatterUtils.formatCurrencyCompact(state.homeEntity.totalExpenseAmount,
                                  symbol: currentCurrency),
                              contextStyle: Theme.of(context).textTheme.titleLarge,
                              icon: IconsUtils.expenseIcon,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: SizeUtil.spaceBtwItems_16,
                    ),
                  ],
                ),
              ),

              // Transaction section of home page
              TransactionHome(
                currency: currentCurrency,
                transactionOfToday: state.homeEntity.transactionOfToday,
                transactionOfYesterday: state.homeEntity.transactionOfYesterday,
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
