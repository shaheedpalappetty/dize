import 'package:dize/data/data_source/shared_preference.dart';
import 'package:dize/domain/model/data_model.dart';

class DizeRepo {

  Future<DataModel> getData() async {
    return SharedPref.instance.loadData();
  }

  Future<void>saveData(dataModel)async{
    SharedPref.instance.saveData(dataModel);
  }
}
