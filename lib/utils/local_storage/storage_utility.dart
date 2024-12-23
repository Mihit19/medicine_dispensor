import 'package:get_storage/get_storage.dart';
class EELocalStorage {

  static EELocalStorage? _instance;
  late final GetStorage storage;
  EELocalStorage._internal();


  factory EELocalStorage.instance() {
    _instance ??= EELocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = EELocalStorage._internal();
    _instance!.storage = GetStorage(bucketName);
  }


// Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await storage.write(key, value);
  }

// Generic method to read data
  T? readData<T>(String key) {
    return storage.read<T> (key);
  }

  // Generic method to remove data
  Future<void> removeData (String key) async {
    await storage.remove(key);
  }
// Clear all data in storage
  Future<void> clearAll() async {
    await storage.erase();
  }
}
