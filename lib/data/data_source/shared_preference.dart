import 'package:dize/domain/model/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._();
  static final SharedPref _instance = SharedPref._();
  static SharedPref get instance => _instance;

  late final SharedPreferences prefs;

  initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveData(DataModel dataModel) async {
   
    prefs.setInt('currentSecond', dataModel.currentSecond);
    prefs.setInt('randomNumber', dataModel.randomNumber);
    prefs.setInt('attempts', dataModel.attempts);
    prefs.setInt('successCount', dataModel.successCount);
    prefs.setInt('failureCount', dataModel.failureCount);
    prefs.setBool('valueGenerated', dataModel.valueGenerated);
  }

  Future<DataModel> loadData() async {
    if (prefs.containsKey('currentSecond') &&
        prefs.containsKey('randomNumber') &&
        prefs.containsKey('attempts') &&
        prefs.containsKey('failureCount') &&
        prefs.containsKey('successCount')) {
      return DataModel(
          currentSecond: prefs.getInt('currentSecond') ?? 0,
          randomNumber: prefs.getInt('randomNumber') ?? 0,
          attempts: prefs.getInt('attempts') ?? 0,
          failureCount: prefs.getInt('failureCount') ?? 0,
          successCount: prefs.getInt('successCount') ?? 0,
          valueGenerated: prefs.getBool('valueGenerated') ?? false);
    } else {
      return DataModel(
          currentSecond: 0,
          randomNumber: 0,
          attempts: 0,
          failureCount: 0,
          successCount: 0,
          valueGenerated: false);
    }
  }
}
