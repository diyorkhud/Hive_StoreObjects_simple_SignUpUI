import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../services/db_service.dart';
class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();

  void _createAccount(){
    String email = emailController.text.toString().trim();
    String number = numberController.text.toString().trim();
    String address = addressController.text.toString().trim();

    var account = Account(email: email, number: number, address: address);
    HiveDB().storeAccount(account);

    var account2 = HiveDB().loadAccount();
    print(account2.email);
    print(account2.number);
    print(account2.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(9, 121, 105, 1),
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,), onPressed: () {
            Navigator.pop(context);
          },),
        ),
        body: Container(
          width: double.infinity,
          color: const Color.fromRGBO(9, 121, 105, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5,),
              // #signup #welcome
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 10,),
                    Text('Welcome', style: TextStyle(color: Colors.white70, fontSize: 20),),
                    SizedBox(height: 10,),
                    Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                  ],
                ),

              ),
              const SizedBox(height: 10,),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Text("Email", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),),
                            const SizedBox(height: 10,),
                            TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                hintText: "Enter Email",
                              ),
                            ),
                            const SizedBox(height: 10,),
                            const Text("Number", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),),
                            const SizedBox(height: 10,),
                            TextField(
                              controller: numberController,
                              decoration: const InputDecoration(
                                hintText: "Enter Number",
                              ),
                            ),
                            const SizedBox(height: 10,),
                            const Text("Address", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),),
                            const SizedBox(height: 10,),
                            TextField(
                              controller: addressController,
                              decoration: const InputDecoration(
                                hintText: "Enter Address",
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(9, 121, 105, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: double.infinity,
                          height: 50,
                          child: FlatButton(
                            onPressed: _createAccount,
                            child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16),),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Text("Or", style: TextStyle(color: Colors.grey, fontSize: 20),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              child: Image(
                                  image: AssetImage("assets/images/facebook_ic.jpeg"))
                          ),
                          SizedBox(width: 30,),
                          Container(
                              width: 30,
                              height: 30,
                              child: Image(
                                  image: AssetImage("assets/images/tww.png"))
                          ),
                          SizedBox(width: 30,),
                          Container(
                              width: 30,
                              height: 30,
                              child: Image(
                                  image: AssetImage("assets/images/instagramm.png"))
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ],
          ),

        )
    );
  }
}
