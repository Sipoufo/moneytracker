import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/home/domain/entities/home.entity.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';
import 'package:moneytracker/features/transaction/domain/repositoies/transaction.repository.dart';

class TransactionFetchAllOfTodayAndYesterdayUseCase implements UseCase<HomeEntity, NoParams> {
  final TransactionRepository transactionRepository;

  TransactionFetchAllOfTodayAndYesterdayUseCase(this.transactionRepository);

  @override
  Future<Either<Failure, HomeEntity>> call(NoParams param) async {
    return transactionRepository.fetchAllTransactionsOfTodayAndYesterday();
  }
}