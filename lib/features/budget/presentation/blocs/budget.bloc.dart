import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/budget/domain/uses_cases/budget_delete_one.use_case.dart';
import 'package:moneytracker/features/budget/domain/uses_cases/budget_fetch_all.use_case.dart';
import 'package:moneytracker/features/budget/domain/uses_cases/budget_fetch_one.use_case.dart';
import 'package:moneytracker/features/budget/domain/uses_cases/budget_save_one.use_case.dart';
import 'package:moneytracker/features/budget/domain/uses_cases/budget_update_one.use_case.dart';
import 'package:moneytracker/features/budget/presentation/blocs/budget.event.dart';
import 'package:moneytracker/features/budget/presentation/blocs/budget.state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final BudgetFetchAllUseCase budgetFetchAllUseCase;
  final BudgetFetchOneUseCase budgetFetchOneUseCase;
  final BudgetSaveOneUseCase budgetSaveOneUseCase;
  final BudgetUpdateOneUseCase budgetUpdateOneUseCase;
  final BudgetDeleteOneUseCase budgetDeleteOneUseCase;

  BudgetBloc ({
    required this.budgetFetchAllUseCase,
    required this.budgetFetchOneUseCase,
    required this.budgetSaveOneUseCase,
    required this.budgetUpdateOneUseCase,
    required this.budgetDeleteOneUseCase,
  }) : super (BudgetInitialState()) {
    on<BudgetFetchAllEvent>(_onFetchAll);
    on<BudgetFetchOneEvent>(_onFetchOne);
    on<BudgetSaveOneEvent>(_onSaveOne);
    on<BudgetUpdateOneEvent>(_onUpdateOne);
    on<BudgetDeleteOneEvent>(_onDeleteOne);
    on<BudgetEvent>((_, emit) {
      emit(BudgetLoadingState());
    });
  }

  void _onFetchAll(BudgetFetchAllEvent event, Emitter<BudgetState> emit) async {
    final res = await budgetFetchAllUseCase(NoParams());
    res.fold(
        (l) => emit(BudgetFailureState(l.message)),
        (r) => emit(BudgetSuccessFetchAllState(r)),
    );
  }

  void _onFetchOne(BudgetFetchOneEvent event, Emitter<BudgetState> emit) async {
    final res = await budgetFetchOneUseCase(BudgetFetchOneParam(id: event.id));
    res.fold(
          (l) => emit(BudgetFailureState(l.message)),
          (r) => emit(BudgetSuccessFetchOneState(r)),
    );
  }

  void _onSaveOne(BudgetSaveOneEvent event, Emitter<BudgetState> emit) async {
    final res = await budgetSaveOneUseCase(BudgetSaveOneParam(budgetEntity: event.budget));
    res.fold(
          (l) => emit(BudgetFailureState(l.message)),
          (r) => emit(BudgetSuccessSaveOneState(r)),
    );
  }

  void _onUpdateOne(BudgetUpdateOneEvent event, Emitter<BudgetState> emit) async {
    final res = await budgetUpdateOneUseCase(BudgetUpdateOneParam(id: event.id, budgetEntity: event.budget));
    res.fold(
          (l) => emit(BudgetFailureState(l.message)),
          (r) => emit(BudgetSuccessUpdateOneState(r)),
    );
  }

  void _onDeleteOne(BudgetDeleteOneEvent event, Emitter<BudgetState> emit) async {
    final res = await budgetDeleteOneUseCase(BudgetDeleteOneParam(id: event.id));
    res.fold(
          (l) => emit(BudgetFailureState(l.message)),
          (r) => emit(BudgetSuccessDeleteOneState(r)),
    );
  }
}