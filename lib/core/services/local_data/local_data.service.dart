/// Class use to centralize data local management
abstract interface class LocalDataService<T> {
  Future<int> addLocalData({required T data});
  Future<void> updateLocalData({required int id, required T data});
  Future<int> deleteAllLocalData();
  Future<void> deleteOneLocalData({required int id});
  List<T> loadData();
  T? loadOneData({required int id});
}