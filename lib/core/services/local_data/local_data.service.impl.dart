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
  Future<void> deleteOneLocalData({required String id}) async {
    return await box.delete(id);
  }

  @override
  List<T> loadData() {
    return box.values.toList();
  }

  @override
  T? loadOneData({required String id}) {
    return box.get(id);
  }

  @override
  Future<void> updateLocalData({required String id, required data}) async {
    await box.put(id, data);
  }
}