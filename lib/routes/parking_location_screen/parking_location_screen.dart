import 'package:flutter/material.dart';
import 'package:kevin_demo/routes.dart';
import 'package:kevin_demo/routes/home_screen/widgets/home_screen_widgets.dart';
import 'package:kevin_demo/utils/data.dart';

class MapScreen extends StatefulWidget{
  const MapScreen({super.key});


  @override
  _mapScreenState createState() =>  _mapScreenState();
  
}

class _mapScreenState extends State<MapScreen>{

  int _currentIndex = 0;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:  Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              const HomeTopWidget(title: "",),
              const SizedBox(height: 30,),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 53, 52, 52),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/map.png"))
                  ),
                  )),
              const SizedBox(height: 30,),
              MapBottomWidget(
                parkingName: Data.parkingSites[Data.currentPark]["parkingName"], 
                parkinglocation: Data.parkingSites[Data.currentPark]["parkingLocation"], 
                availableSlots: Data.parkingSites[Data.currentPark]["availableSlots"], 
                pricePerHour: Data.parkingSites[Data.currentPark]["pricePerHour"]),
              const SizedBox(height: 20,),
              SimpleButton(
                label: "Book Now", 
                onTap: () {
                  if(Data.loggedIn){
                    Navigator.pushNamed(context, RouteGenerate.paymentOptionsScreen);
                  }else{
                    Navigator.pushNamed(context, RouteGenerate.loginScreen);
                  }
                  }),
              const SizedBox(height: 20,),
              
            ],
          )),
          ),
    );
  }
}