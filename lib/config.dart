
//import 'package:bank/models/user_model.dart';
import 'package:bank2/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';


class LocalDB{
  static void init() async{
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    await Hive.openBox<UserModel>('userBox');
  }

  static Box<UserModel> get userBox => Hive.box ('userBox');
}