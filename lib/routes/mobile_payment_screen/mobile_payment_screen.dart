import 'package:flutter/material.dart';
import 'package:kevin_demo/routes.dart';
import 'package:kevin_demo/routes/home_screen/widgets/home_screen_widgets.dart';



class MobilePaymentScreen extends StatefulWidget{
  const MobilePaymentScreen({super.key});

  @override
  _mobilePaymentScreenState createState () => _mobilePaymentScreenState();
  
}


class _mobilePaymentScreenState extends State<MobilePaymentScreen>{

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: const Icon(Icons.arrow_back, color: Colors.white,)),
        // title: const Text("Payments"),
      ),
      
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              const Text("Complete payment", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
              const SizedBox(height: 10,),
              const Text("Enter your phone number to make the payment from", style: TextStyle(fontSize: 17, color: Colors.grey),),
              const SizedBox(height: 40,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 60, 60, 60)
                ),
                padding:  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child:TextFormField(
                controller: _controller,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                style: const TextStyle(fontSize: 18, color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.grey)
                ),
              )),
              const Expanded(
                child: SizedBox()),
              SimpleButton(
                label: "Confirm", 
                onTap: (){
                  showDialog(
                    context: context, 
                    builder: (context){
                      return const SimpleDialog(
                        insetPadding: EdgeInsets.all(0),
                        backgroundColor: Color.fromARGB(255, 27, 26, 26),
                        children: [
                          PinDialogWidget()
                        ],
                      );
                    });
                }),
              const SizedBox(height: 50,),
            ],
          ),)),
    );
  }
}