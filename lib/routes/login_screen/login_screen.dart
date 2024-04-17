import 'package:flutter/material.dart';
import 'package:kevin_demo/routes.dart';
import 'package:kevin_demo/routes/home_screen/widgets/home_screen_widgets.dart';
import 'package:kevin_demo/utils/data.dart';

class LogingScreen extends StatefulWidget{
  const LogingScreen({super.key});


  @override
  _loginScreen createState () => _loginScreen();

}

class _loginScreen extends State<LogingScreen>{

  final GlobalKey<FormState> key =   GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();

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
              const Text("Login to continue", style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold
              ),),
              const Text("Enter your email and password to login", style: TextStyle(
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
                  controller: _emailController,
                  validator: emailValidate,
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
                onPressed: () => Navigator.pushNamed(context, RouteGenerate.signupScreen), 
                child: const Text("You dont have an account? SignUp ")),
              const Expanded(child: SizedBox()),
              SimpleButton(
                label: "Login", 
                onTap: (){
                  if(key.currentState?.validate()??false){
                    String gmail= _emailController.text;
                    String password = _passwordController.text;
                    if(password == Data.user["password"] && gmail == Data.user["gmail"]){
                      Data.loggedIn = true;
                      Navigator.pushNamed(context, RouteGenerate.paymentOptionsScreen);
                    }else{
                      showDialog(
                    context: context, 
                    barrierDismissible: false,
                    builder: (context){
                      return SimpleDialog(
                        insetPadding: EdgeInsets.all(010),
                        backgroundColor: Color.fromARGB(255, 27, 26, 26),
                        children: [
                            const Center(child:Text("Account not Found", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),)),
                            const SizedBox(height: 10,),
                            SimpleButton(
                              label: "SignUp", 
                              onTap: (){
                                Navigator.pushNamed(context, RouteGenerate.signupScreen);
                              })     
                          
                        ],
                      );
                    });
                    }
                    
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

  static String? emailValidate(String? txt) {
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