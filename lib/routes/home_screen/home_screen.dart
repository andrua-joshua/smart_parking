import 'package:flutter/material.dart';
import 'package:kevin_demo/routes.dart';
import 'package:kevin_demo/routes/home_screen/widgets/home_screen_widgets.dart';
import 'package:kevin_demo/utils/data.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});


  @override
  _homeScreenState createState() =>  _homeScreenState();
  
}

class _homeScreenState extends State<HomeScreen>{

  int _currentIndex = 0;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:  Colors.black,
      body: SafeArea(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              const HomeTopWidget(title: 'Smart Parking',),
              const SizedBox(height: 30,),
              const Text("Find Your", style: TextStyle(fontSize: 30, color: Colors.white),),
              const Text("Parking Space", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
              const SizedBox(height: 40,),
              SizedBox(
                
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                        child:UnitNavItem(
                        isActive: _currentIndex== 0, 
                        label: "CAR", 
                        icon: Icons.car_repair_sharp)),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        child:UnitNavItem(
                        isActive: _currentIndex== 1, 
                        label: "BIKE", 
                        icon: Icons.bike_scooter)),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _currentIndex = 2;
                          });
                        },
                        child:UnitNavItem(
                        isActive: _currentIndex== 2, 
                        label: "TRUCK", 
                        icon: Icons.fire_truck)),
                    ],
                  ),
                ),
              ), 

              const SizedBox(height: 70,),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Parkings", style: TextStyle(
                      fontSize: 20, 
                      color: Colors.white, 
                      fontWeight: FontWeight.bold),),

                    IconButton(
                      onPressed: (){}, 
                      icon: const Icon(Icons.filter_list, color: Colors.white,))
                  ],
                ),
              ),

              const SizedBox(height: 20,),
              SizedBox(
                child: Column(
                  children: List.generate(
                    Data.parkingSites.length , (index) => GestureDetector(
                      onTap: (){
                        Data.currentPark = index;
                        Navigator.pushNamed(context, RouteGenerate.parkingLocationScreen);
                      },
                      child:UnitParkingWidget(
                      parkingName: Data.parkingSites[index]["parkingName"], 
                      parkingLocation: Data.parkingSites[index]["parkingLocation"]))),
                ),
              )
            ],
          )),
          )),
    );
  }
}