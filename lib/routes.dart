import 'package:flutter/material.dart';
import 'package:kevin_demo/routes/home_screen/home_screen.dart';
import 'package:kevin_demo/routes/mobile_payment_screen/mobile_payment_screen.dart';
import 'package:kevin_demo/routes/parking_location_screen/parking_location_screen.dart';
import 'package:kevin_demo/routes/payments_screen/payments_screen.dart';

class RouteGenerate{
  
  static const String homeScreen = "/";
  static const String parkingLocationScreen = "/parkingLocationScreen";
  static const String paymentOptionsScreen = "/paymentOptionsScreen";
  static const String paymentScreen = "/paymentScreen";

  static Route<dynamic> onGenerate(RouteSettings settings){
    switch(settings.name){
      case homeScreen:
          return MaterialPageRoute(
            builder: (context) => const HomeScreen());

      case parkingLocationScreen:
          return MaterialPageRoute(
            builder: (context) => const MapScreen());
      
      case paymentScreen:
          return MaterialPageRoute(
            builder: (context) => const MobilePaymentScreen());
      
      case paymentOptionsScreen:
          return MaterialPageRoute(
            builder: (context) => const PaymentOptions());
      
      default:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen());
    }
  }

}