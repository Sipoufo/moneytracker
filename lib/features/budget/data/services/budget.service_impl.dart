import 'package:moneytracker/core/services/local_data/local_data.service.dart';
import 'package:moneytracker/features/budget/data/models/budget.model.dart';
import 'package:moneytracker/features/budget/data/services/budget.service.dart';

class BudgetServiceImpl implements BudgetService {
  final LocalDataService<BudgetModel> localDataService;

  BudgetServiceImpl(this.localDataService);

  /// Return all budgets
  @override
  List<BudgetModel> fetchAllBudgets() {
    List<BudgetModel> budgets = localDataService.loadData();
    return budgets;
  }

  /// [id] represent the id of budget that we want to fetch
  /// Return the budget find
  @override
  BudgetModel fetchOneBudget(int id) {
    BudgetModel? budgetFetch = localDataService.loadOneData(id: id);

    if (budgetFetch == null) {
      throw "This budget don't exist";
    }

    return budgetFetch;
  }

  /// [budget] represent budget that we want to save
  /// Return wallet saved
  @override
  Future<BudgetModel> saveOneBudget(BudgetModel budget) async {
    try {
      print("Je passe");
      if (fetchAllBudgets().where((item) => item.name == budget.name).isNotEmpty) {
        throw "This budget exist !";
      }

      int budgetSaveId = await localDataService.addLocalData(data: budget);
      budget.id = budgetSaveId;
      await localDataService.updateLocalData(id: budget.id, data: budget);
      return budget;
    } catch (e) {
      print(e);
      throw "This budget exist !";
    }
  }

  /// [id] represent id of budget that we want to update
  /// [budget] represent budget that we want to save
  /// Return wallet updated
  @override
  Future<BudgetModel> updateOneBudget(int id, BudgetModel budget) async {
    fetchOneBudget(id);

    await localDataService.updateLocalData(id: budget.id, data: budget);
    return budget;
  }

  /// [id] represent the id of budget that we want to delete
  /// Return bool indicate if delete is successful
  @override
  Future<bool> deleteOneBudget(int id) async {
    fetchOneBudget(id);
    await localDataService.deleteOneLocalData(id: id);
    return true;
  }

}