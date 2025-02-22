import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/transaction/domain/uses_cases/transaction_delete_one.use_case.dart';
import 'package:moneytracker/features/transaction/domain/uses_cases/transaction_fetch_all.use_case.dart';
import 'package:moneytracker/features/transaction/domain/uses_cases/transaction_fetch_all_by_dates.use_case.dart';
import 'package:moneytracker/features/transaction/domain/uses_cases/transaction_fetch_one.use_case.dart';
import 'package:moneytracker/features/transaction/domain/uses_cases/transaction_save_one.use_case.dart';
import 'package:moneytracker/features/transaction/domain/uses_cases/transaction_update_one.use_case.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.event.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionFetchAllUseCase transactionFetchAllUseCase;
  final TransactionFetchAllByDatesUseCase transactionFetchAllByDatesUseCase;
  final TransactionFetchOneUseCase transactionFetchOneUseCase;
  final TransactionSaveOneUseCase transactionSaveOneUseCase;
  final TransactionUpdateOneUseCase transactionUpdateOneUseCase;
  final TransactionDeleteOneUseCase transactionDeleteOneUseCase;

  TransactionBloc({
    required this.transactionFetchAllUseCase,
    required this.transactionFetchAllByDatesUseCase,
    required this.transactionFetchOneUseCase,
    required this.transactionSaveOneUseCase,
    required this.transactionUpdateOneUseCase,
    required this.transactionDeleteOneUseCase,
  }) : super(TransactionInitialState()) {
    on<TransactionFetchAllEvent>(_onFetchAll);
    on<TransactionFetchAllByDatesEvent>(_onFetchAllByDates);
    on<TransactionFetchOneEvent>(_onFetchOne);
    on<TransactionSaveOneEvent>(_onSaveOne);
    on<TransactionUpdateOneEvent>(_onUpdateOne);
    on<TransactionDeleteOneEvent>(_onDeleteOne);
    on<TransactionEvent>((_, emit) {
      emit(TransactionLoadingState());
    });
  }

  void _onFetchAll(TransactionFetchAllEvent event, Emitter<TransactionState> emit) async {
    final res = await transactionFetchAllUseCase(NoParams());
    res.fold(
      (l) => emit(TransactionFailureState(l.message)),
      (r) => emit(TransactionSuccessFetchAllState(r)),
    );
  }

  void _onFetchAllByDates(TransactionFetchAllByDatesEvent event, Emitter<TransactionState> emit) async {
    final res = await transactionFetchAllByDatesUseCase(
      TransactionFetchAllByDatesParams(
        startDate: event.startDate,
        endDate: event.endDate,
        transactionFindTypeEnum: event.transactionFindTypeEnum,
      ),
    );
    res.fold(
      (l) => emit(TransactionFailureState(l.message)),
      (r) => emit(TransactionSuccessFetchAllState(r)),
    );
  }

  void _onFetchOne(TransactionFetchOneEvent event, Emitter<TransactionState> emit) async {
    final res = await transactionFetchOneUseCase(TransactionFetchOneParam(id: event.id));
    res.fold(
      (l) => emit(TransactionFailureState(l.message)),
      (r) => emit(TransactionSuccessFetchOneState(r)),
    );
  }

  void _onSaveOne(TransactionSaveOneEvent event, Emitter<TransactionState> emit) async {
    final res = await transactionSaveOneUseCase(TransactionSaveOneParam(transactionEntity: event.transaction));
    res.fold(
      (l) => emit(TransactionFailureState(l.message)),
      (r) => emit(TransactionSuccessSaveOneState(r)),
    );
  }

  void _onUpdateOne(TransactionUpdateOneEvent event, Emitter<TransactionState> emit) async {
    final res = await transactionUpdateOneUseCase(
        TransactionUpdateOneParam(id: event.id, transactionEntity: event.transaction));
    res.fold(
      (l) => emit(TransactionFailureState(l.message)),
      (r) => emit(TransactionSuccessUpdateOneState(r)),
    );
  }

  void _onDeleteOne(TransactionDeleteOneEvent event, Emitter<TransactionState> emit) async {
    final res = await transactionDeleteOneUseCase(TransactionDeleteOneParam(id: event.id));
    res.fold(
      (l) => emit(TransactionFailureState(l.message)),
      (r) => emit(TransactionSuccessDeleteOneState(r)),
    );
  }
}
