import 'package:flutter/material.dart';
import 'package:kevin_demo/routes.dart';
import 'package:kevin_demo/routes/home_screen/widgets/home_screen_widgets.dart';
import 'package:kevin_demo/utils/data.dart';

class SignUpScreen extends StatefulWidget{
  const SignUpScreen({super.key});


  @override
  _signUpScreen createState () => _signUpScreen();

}

class _signUpScreen extends State<SignUpScreen>{

  final GlobalKey<FormState> key =   GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.arrow_back, color: Colors.white,)),
        
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: key,
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              const Text("Creat account to continue", style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold
              ),),
              const Text("Enter your details to creat your account", style: TextStyle(
                color: Colors.grey, fontSize: 14,
              ),),
              const SizedBox(height: 50,),
              Container(
                // constraints: const BoxConstraints.expand(height: 50),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 47, 47, 47)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  controller: _usernameController,
                  validator: usernameValidate,
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "UserName",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 148, 147, 147))
                  ),
                ),
              ),
              Container(
                // constraints: const BoxConstraints.expand(height: 50),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 47, 47, 47)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  controller: _emailController,
                  validator: gmailValidate,
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      
                      hintStyle: TextStyle(color: Color.fromARGB(255, 148, 147, 147))
                  ),
                ),
              ),

              Container(
                // constraints: const BoxConstraints.expand(height: 50),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 47, 47, 47)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                  obscureText: true,
                  obscuringCharacter: "*",
                  validator: passwordValidate,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 148, 147, 147))
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, RouteGenerate.loginScreen), 
                child: const Text("Already have an account? Login ")),
              const Expanded(child: SizedBox()),
              SimpleButton(
                label: "Signup", 
                onTap: (){
                  if(key.currentState?.validate()??false){
                    Data.user["username"] = _usernameController.text;
                    Data.user["password"] = _passwordController.text;
                    Data.user["gmail"] = _emailController.text;
                    Data.loggedIn = true;
                  Navigator.pushNamed(context, RouteGenerate.paymentOptionsScreen);
                  }
                }),
              const SizedBox(height: 20,)
           ],
          )),)),
    );
  }


  static String? passwordValidate(String? txt) {
    int length = txt?.length ?? 0;
    if (length < 8) {
      return "password should be atleast 8 characters long";
    }
    return null;
  }

  

  static String? usernameValidate(String? txt) {
    if (txt?.isEmpty ?? true) {
      return "enter your username please";
    }

    return null;
  }

  static String? gmailValidate(String? txt) {
    if (txt?.isEmpty ?? true) {
      return "enter your Email please";
    } else {
      String suffix = "@gmail.com";
      int lng = txt?.length ?? 0;
      String sub = txt?.substring((lng > 10) ? (lng - suffix.length) : 0) ?? "";

      if (sub != suffix) {
        return "please enter a valid gmail.";
      }
    }

    return null;
  }
}