/// Class use to centralize data local management
abstract interface class LocalDataService<T> {
  Future<void> updateLocalData({required String id, required T data});
  Future<int> deleteAllLocalData();
  Future<void> deleteOneLocalData({required String id});
  List<T> loadData();
  T? loadOneData({required String id});
}