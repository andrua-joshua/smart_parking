import 'package:flutter/material.dart';
import 'package:kevin_demo/routes.dart';
import 'package:kevin_demo/utils/data.dart';

class HomeTopWidget extends StatelessWidget{
  final String title;
  const HomeTopWidget({super.key, required this.title});
// 1ctn4k4w4

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(15),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/ic_launcher.png")),
            color: Colors.white
          ),
        ),
      const SizedBox(width: 10,),
      Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
      const SizedBox(width: 10,),
      IconButton(
        onPressed:(){} , 
        icon: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(15),
            color: const Color.fromARGB(255, 47, 46, 46)
          ),
          child: const Center(child: Icon(Icons.car_crash, color: Colors.white, size: 30,),),
        ),)
      ],
    );
  }
}




class UnitNavItem extends StatelessWidget{
  final String  label;
  final IconData icon;
  final bool isActive;
  const UnitNavItem({
    required this.isActive,
    required this.label,
    required this.icon,
    super.key
  });


  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isActive? Colors.orange: Colors.white
      ),

      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(icon, color: isActive? Colors.white: Colors.black,),
          Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isActive? Colors.white: Colors.black ),)
        ],
      ),
    );
  }


}




class UnitParkingWidget extends StatelessWidget{
  final String parkingName;
  final String parkingLocation;

  const UnitParkingWidget({
    required this.parkingName,
    required this.parkingLocation,
    super.key});

  
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color:const Color.fromARGB(255, 40, 39, 39),
        borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.all(10),
      margin:  const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(radius: 30,),
          const SizedBox(width: 10,),
          Expanded(
            child:SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(parkingName, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),),
                Text(parkingLocation, style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 111, 111, 111), fontWeight: FontWeight.w500))
              ],
            ),
          )),
          const SizedBox(width: 5,),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.map_rounded, color: Colors.orange, size: 30,))
        ],
      ),
    );
  }

}



class MapBottomWidget extends StatelessWidget{
  final String parkingName;
  final String parkinglocation;
  final int availableSlots;
  final int pricePerHour;

  const MapBottomWidget({
    required this.parkingName,
    required this.parkinglocation,
    required this.availableSlots,
    required this.pricePerHour,
    super.key
  });

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 66, 62, 62)
      ),
      padding:  const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                ), 
                const SizedBox(width: 10,),
                Expanded(
                  child:Column(
                    children: [
                      Text(parkingName, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),),
                      Text(parkinglocation, style: const TextStyle(color: Color.fromARGB(255, 150, 150, 150), fontSize: 18, fontWeight: FontWeight.w500),)
                    ],
                  ) ),
                const SizedBox(width: 10,),
                IconButton(
                  onPressed: (){
                    showDialog(
                    context: context, 
                    // barrierDismissible: false,
                    builder: (context){
                      return SimpleDialog(
                        insetPadding: EdgeInsets.all(010),
                        backgroundColor: Color.fromARGB(255, 27, 26, 26),
                        children: [
                            const Center(child:Text("Contact", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),)),
                            const SizedBox(height: 10,),
                            const Center(child:Text("MTN: 07783647382", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),)),
                            const Center(child:Text("Airtel: 0758937533", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),)),
                            const SizedBox(height: 10,),
                            SimpleButton(
                              label: "Okay", 
                              onTap: (){
                                Navigator.pop(context);
                              })     
                          
                        ],
                      );
                    });
                  }, 
                  icon: const Icon(Icons.info, color: Colors.white, size: 30,),
                  )
              ],
            ),
          ),
          const SizedBox(height: 40,),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      const Text("Amount per hour", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                      Text("\$$pricePerHour/hr", style: const TextStyle(fontSize: 19, color: Colors.white),),

                    ],
                  ),
                ),
                Container(
                  width: 2,
                  height: 40,
                  color: Colors.grey,
                ),

                SizedBox(
                  child: Column(
                    children: [
                      const Text("Available Slots", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                      Text("$availableSlots slots", style: const TextStyle(fontSize: 19, color: Colors.white),),

                    ],
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

}



class SimpleButton extends StatelessWidget{
  final String label;
  final Function() onTap;

  const SimpleButton({
    super.key, 
    required this.label,
    required this.onTap
    });

  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: ()=> onTap(),
      child:Container(
      constraints: const BoxConstraints.expand(height:50),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 66, 62, 62),
        borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.all(5),
      child: Center(child:Text(label, style: const TextStyle(color: Colors.white, fontSize: 17),)),
    ));
  }

}




class PinDialogWidget extends StatefulWidget{
  const PinDialogWidget({super.key});

  @override
  _pinDialogWidget createState ()=> _pinDialogWidget();
}


class _pinDialogWidget extends State<PinDialogWidget>{

  final TextEditingController controller = TextEditingController(); 

  @override
  Widget build(BuildContext context){
    
    return Container(
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color: const Color.fromARGB(255, 49, 48, 48)
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text("Enter Pin", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
          const SizedBox(height: 10,),
          Container(
                // constraints: const BoxConstraints.expand(height: 50),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 47, 47, 47)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      // hintText: "",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 148, 147, 147))
                  ),
                ),
              ),

              const Expanded(child: SizedBox()),
              SimpleButton(
                label: "Send", 
                onTap: (){
                  Data.parkingSites[Data.currentPark]["availableSlots"] = Data.parkingSites[Data.currentPark]["availableSlots"]-1;
                  Navigator.pop(context);
                  showDialog(
                    context: context, 
                    barrierDismissible: false,
                    builder: (context){
                      return SimpleDialog(
                        insetPadding: EdgeInsets.all(010),
                        backgroundColor: Color.fromARGB(255, 27, 26, 26),
                        children: [
                            const Center(child:Text("Transaction succesful", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),)),
                            const SizedBox(height: 10,),
                            SimpleButton(
                              label: "Okay", 
                              onTap: (){
                                Navigator.pushNamed(context, RouteGenerate.homeScreen);
                              })     
                          
                        ],
                      );
                    });
                })
        ],
      ),
    );
  }
}





