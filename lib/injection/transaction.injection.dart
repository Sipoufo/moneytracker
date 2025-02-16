import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.impl.dart';
import 'package:moneytracker/features/transaction/data/models/transaction.model.dart';
import 'package:moneytracker/features/transaction/data/repositories/transaction.repository_imple.dart';
import 'package:moneytracker/features/transaction/data/services/transaction.service.dart';
import 'package:moneytracker/features/transaction/data/services/transaction.service_impl.dart';
import 'package:moneytracker/features/transaction/domain/repositoies/transaction.repository.dart';
import 'package:moneytracker/features/transaction/domain/uses_cases/transaction_delete_one.use_case.dart';
import 'package:moneytracker/features/transaction/domain/uses_cases/transaction_fetch_all.use_case.dart';
import 'package:moneytracker/features/transaction/domain/uses_cases/transaction_fetch_one.use_case.dart';
import 'package:moneytracker/features/transaction/domain/uses_cases/transaction_save_one.use_case.dart';
import 'package:moneytracker/features/transaction/domain/uses_cases/transaction_update_one.use_case.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.bloc.dart';
import 'package:moneytracker/init_dependencies.main.dart';

class TransactionInjection {
  // Injection for Transaction
  static void transactionInjection() {
    serviceLocator
      ..registerFactory<LocalDataService<TransactionModel>>(
            () => LocalDataServiceImpl<TransactionModel>(
          serviceLocator<Box<TransactionModel>>(),
        ),
      )
      ..registerFactory<TransactionService>(
            () => TransactionServiceImpl(serviceLocator<LocalDataService<TransactionModel>>()),
      )
      ..registerFactory<TransactionRepository>(
            () => TransactionRepositoryImpl(serviceLocator<TransactionService>()),
      )
      ..registerFactory<TransactionFetchAllUseCase>(
            () => TransactionFetchAllUseCase(serviceLocator<TransactionRepository>()),
      )
      ..registerFactory<TransactionFetchOneUseCase>(
            () => TransactionFetchOneUseCase(serviceLocator<TransactionRepository>()),
      )
      ..registerFactory<TransactionSaveOneUseCase>(
            () => TransactionSaveOneUseCase(serviceLocator<TransactionRepository>()),
      )
      ..registerFactory<TransactionUpdateOneUseCase>(
            () => TransactionUpdateOneUseCase(serviceLocator<TransactionRepository>()),
      )
      ..registerFactory<TransactionDeleteOneUseCase>(
            () => TransactionDeleteOneUseCase(serviceLocator<TransactionRepository>()),
      )
      ..registerFactory<TransactionBloc>(
            () => TransactionBloc(
                transactionFetchAllUseCase : serviceLocator<TransactionFetchAllUseCase>(),
                transactionFetchOneUseCase : serviceLocator<TransactionFetchOneUseCase>(),
                transactionSaveOneUseCase : serviceLocator<TransactionSaveOneUseCase>(),
                transactionUpdateOneUseCase : serviceLocator<TransactionUpdateOneUseCase>(),
                transactionDeleteOneUseCase : serviceLocator<TransactionDeleteOneUseCase>(),
        ),
      );
  }
}