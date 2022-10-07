import 'package:datademo/model/user_model.dart';
import 'package:datademo/pages/signup_page.dart';
import 'package:datademo/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void openAccountPage(BuildContext ctx){
    Navigator.push(ctx, MaterialPageRoute(builder: (_){
      return const AccountPage();
    }));
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user = User(email: email, password: password);

    HiveDB().storeUser(user);

    var user2 = HiveDB().loadUser();
    print(user2.email);
    print(user2.password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
      body: Container(
        width: double.infinity,
        color: const Color.fromRGBO(9, 121, 105, 1),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(height: 50,),
        // #signup #welcome
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  image: const DecorationImage(
                      image: NetworkImage(
                    "https://bs-uploads.toptal.io/blackfish-uploads/components/image/content/file_file/file/537781/764x764-3f483634bbf0f89f0d6057da3ec6f3d3.jpg"
                  ),
                  fit: BoxFit.cover
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              const Text('Welcome', style: TextStyle(color: Colors.white70, fontSize: 20),),
              const SizedBox(height: 10,),
              const Text('Sig In', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
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
                        const Text("Password", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),),
                         const SizedBox(height: 10,),
                         TextField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: "Enter Password",
                          ),
                        ),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  ),
                  const Text("Forget Password ?", style: TextStyle(color: Colors.grey, fontSize: 20),),
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
                        onPressed: _doLogin,
                        child: const Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 16),),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: TextStyle(color: Colors.grey[700]!),),
                      const SizedBox(width: 5,),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
                        ),
                        onPressed: (){
                          openAccountPage(context);
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
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
