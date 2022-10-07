import 'package:hive/hive.dart';

import '../model/user_model.dart';

class HiveDB{
  var box = Hive.box("pdp_online");

  //User related
  void storeUser(User user) async{
    box.put("user", user.toJson());
  }

  User loadUser(){
    var user = User.fromJson(box.get("user"));
    return user;
  }

  void removeUser(){
    box.delete("user");
  }

  //Account related
  void storeAccount(Account account) async{
    box.put("account", account.toJson());
  }

  Account loadAccount(){
    var account = Account.fromJson(box.get("account"));
    return account;
  }

  void removeAccount(){
    box.delete("account");
  }
}