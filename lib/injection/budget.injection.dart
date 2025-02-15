import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.impl.dart';
import 'package:moneytracker/features/budget/data/models/budget.model.dart';
import 'package:moneytracker/features/budget/data/repositories/budget.repository_imple.dart';
import 'package:moneytracker/features/budget/data/services/budget.service.dart';
import 'package:moneytracker/features/budget/data/services/budget.service_impl.dart';
import 'package:moneytracker/features/budget/domain/repositories/budget.repository.dart';
import 'package:moneytracker/features/budget/domain/uses_cases/budget_delete_one.use_case.dart';
import 'package:moneytracker/features/budget/domain/uses_cases/budget_fetch_all.use_case.dart';
import 'package:moneytracker/features/budget/domain/uses_cases/budget_fetch_one.use_case.dart';
import 'package:moneytracker/features/budget/domain/uses_cases/budget_save_one.use_case.dart';
import 'package:moneytracker/features/budget/domain/uses_cases/budget_update_one.use_case.dart';
import 'package:moneytracker/features/budget/presentation/blocs/budget.bloc.dart';
import 'package:moneytracker/init_dependencies.main.dart';

class BudgetInjection {
  // Injection for budget
  static void budgetInjection() {
    serviceLocator
      ..registerFactory<LocalDataService<BudgetModel>>(
            () => LocalDataServiceImpl<BudgetModel>(
          serviceLocator<Box<BudgetModel>>(),
        ),
      )
      ..registerFactory<BudgetService>(
            () => BudgetServiceImpl(serviceLocator<LocalDataService<BudgetModel>>()),
      )
      ..registerFactory<BudgetRepository>(
            () => BudgetRepositoryImpl(serviceLocator<BudgetService>()),
      )
      ..registerFactory<BudgetFetchAllUseCase>(
            () => BudgetFetchAllUseCase(serviceLocator<BudgetRepository>()),
      )
      ..registerFactory<BudgetFetchOneUseCase>(
            () => BudgetFetchOneUseCase(serviceLocator<BudgetRepository>()),
      )
      ..registerFactory<BudgetSaveOneUseCase>(
            () => BudgetSaveOneUseCase(serviceLocator<BudgetRepository>()),
      )
      ..registerFactory<BudgetUpdateOneUseCase>(
            () => BudgetUpdateOneUseCase(serviceLocator<BudgetRepository>()),
      )
      ..registerFactory<BudgetDeleteOneUseCase>(
            () => BudgetDeleteOneUseCase(serviceLocator<BudgetRepository>()),
      )
      ..registerFactory<BudgetBloc>(
            () => BudgetBloc(
                budgetFetchAllUseCase : serviceLocator<BudgetFetchAllUseCase>(),
                budgetFetchOneUseCase : serviceLocator<BudgetFetchOneUseCase>(),
                budgetSaveOneUseCase : serviceLocator<BudgetSaveOneUseCase>(),
                budgetUpdateOneUseCase : serviceLocator<BudgetUpdateOneUseCase>(),
                budgetDeleteOneUseCase : serviceLocator<BudgetDeleteOneUseCase>(),
        ),
      );
  }
}