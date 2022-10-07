class User{
  late String email;
  late String password;

  User({required this.email, required this.password});

  User.fromJson(Map < String, dynamic > json)
      : email = json ['email'] ,
        password = json ['password'] ;


  Map<String, dynamic > toJson()=> {
    'email' : email ,
    'password' : password ,
  };
}

class Account{
  late String email;
  late String number;
  late String address;

  Account({required this.email, required this.number, required this.address,});
  factory Account.fromJson(Map<String, dynamic> parsedJson) {
    return Account(
      email: parsedJson['email'] ?? "",
      number: parsedJson['number'] ?? "",
      address: parsedJson['address'] ?? "",
    );

  }
  Map < String, dynamic > toJson(){
    return {
      "email": email,
      "number": number,
      "address": address,
    };

  }

}