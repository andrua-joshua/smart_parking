import 'package:flutter/material.dart';
import 'package:kevin_demo/routes.dart';

class PaymentOptions extends StatelessWidget{
  const PaymentOptions({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:  Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Payment Options", style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),),
              const SizedBox(height: 10,),
              const Text("Select your a payment option of your choice",style: TextStyle(fontSize: 17, color: Colors.grey,),),
              const SizedBox(height: 90,),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, RouteGenerate.paymentScreen),
                child:Container(
                  constraints: const BoxConstraints.expand(height:50),
                      decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 66, 62, 62),
                      borderRadius: BorderRadius.circular(10)
                    ),
                padding: const EdgeInsets.all(5),
              child:  SizedBox(
                child: Row(
                  children: [
                    Container(
                      constraints:  const BoxConstraints.expand(width: 40), 
                      margin: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), 
                        color: Colors.black,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/mtn.jpg"))),),
                    const SizedBox(width: 20,),
                    const Text("MTN Mobile Money", style: const TextStyle(color: Colors.white, fontSize: 17))
                  ],
                ),
              ),
              )),
              const SizedBox(height: 15,),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, RouteGenerate.paymentScreen),
                child:Container(
                  constraints: const BoxConstraints.expand(height:50),
                      decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 66, 62, 62),
                      borderRadius: BorderRadius.circular(10)
                    ),
                padding: const EdgeInsets.all(5),
              child:  SizedBox(
                child: Row(
                  children: [
                    Container(
                      constraints:  const BoxConstraints.expand(width: 40), 
                      margin: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), 
                        color: Colors.black,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/airtel.png")),
                        ),),
                    const SizedBox(width: 20,),
                    const Text("Airtel Mobile Money", style: const TextStyle(color: Colors.white, fontSize: 17))
                  ],
                ),
              ),
              )),
              const SizedBox(height: 15,),
              TextButton(
                onPressed: (){},
                child:Container(
                  constraints: const BoxConstraints.expand(height:50),
                      decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 66, 62, 62),
                      borderRadius: BorderRadius.circular(10)
                    ),
                padding: const EdgeInsets.all(5),
              child:  SizedBox(
                child: Row(
                  children: [
                    Container(
                      constraints:  const BoxConstraints.expand(width: 40), 
                      margin: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), 
                        color: Colors.black,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/credit.jpg")),
                        ),),
                    const SizedBox(width: 20,),
                    const Text("Credit Card", style: const TextStyle(color: Colors.white, fontSize: 17))
                  ],
                ),
              ),
              )),
            ],
          ),)),
    );
  }
}