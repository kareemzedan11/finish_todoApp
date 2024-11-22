 

import 'package:flutter/material.dart';


import '../../../core/utiles/assets_Manager.dart';
import '../../../core/utiles/colors_Manager.dart';
import '../../../core/utiles/routes_Manager.dart';

class SplashScreen extends StatelessWidget {


  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
Future.delayed(const Duration(seconds: 2) , 
() {
  Navigator.pushReplacementNamed(context, RoutesManager.login) ;
},
) ;    
    return Container(
   
      color: ColorsManager.LightAppColor,
      child: Image.asset(AssetsManager.SplashLightLogo),
    
    );
  }
}