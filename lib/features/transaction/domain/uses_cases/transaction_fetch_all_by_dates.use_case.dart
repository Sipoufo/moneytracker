import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/core/utils/enums/enums.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';
import 'package:moneytracker/features/transaction/domain/repositoies/transaction.repository.dart';

class TransactionFetchAllByDatesUseCase implements UseCase<List<TransactionEntity>, TransactionFetchAllByDatesParams> {
  final TransactionRepository transactionRepository;

  TransactionFetchAllByDatesUseCase(this.transactionRepository);

  @override
  Future<Either<Failure, List<TransactionEntity>>> call(TransactionFetchAllByDatesParams params) async {
    return transactionRepository.fetchAllTransactionsByDates(
      params.startDate,
      params.endDate,
      params.transactionFindTypeEnum,
    );
  }
}

class TransactionFetchAllByDatesParams {
  final DateTime startDate;
  final DateTime? endDate;
  final TransactionFindTypeEnum transactionFindTypeEnum;

  const TransactionFetchAllByDatesParams({
    required this.startDate,
    this.endDate,
    required this.transactionFindTypeEnum,
  });
}
