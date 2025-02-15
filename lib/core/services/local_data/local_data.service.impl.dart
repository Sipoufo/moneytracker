import 'package:hive/hive.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.dart';

/// Class use to centralize data local management
class LocalDataServiceImpl<T> implements LocalDataService<T> {
  final Box<T> box;
  LocalDataServiceImpl(this.box);

  @override
  Future<int> deleteAllLocalData() async {
    return await box.clear();
  }

  @override
  Future<void> deleteOneLocalData({required int id}) async {
    return await box.delete(id);
  }

  @override
  List<T> loadData() {
    return box.values.toList();
  }

  @override
  T? loadOneData({required int id}) {
    return box.get(id);
  }

  @override
  Future<int> addLocalData({required data}) async {
    return await box.add(data);
  }

  @override
  Future<void> updateLocalData({required int id, required data}) async {
    await box.put(id, data);
  }
}