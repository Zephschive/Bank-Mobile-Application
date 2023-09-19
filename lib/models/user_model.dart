
import 'package:bank2/config.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel{
  @HiveField(0)
  String id;
  @HiveField(1)
  String idNumber;
  @HiveField(2)
  String password;

  UserModel({
    required this.id,
    required this.idNumber,
    required this.password,
  });

  //Method
   //Method

   
  //Save a user
  void saveUser() {
    LocalDB.userBox.put(id, this);
  }

  //update a user
  void updateUser({String? idNumber, String? password}) {
    LocalDB.userBox.put(
        id,
        UserModel(
            id: id,
            idNumber: idNumber ?? this.idNumber,
            password: password ?? this.password));
  }

//delete a user
  void deleteUser() {
    LocalDB.userBox.delete(id);
  }
}
