import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}