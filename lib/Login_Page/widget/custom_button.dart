import 'package:flutter/material.dart';

import '../../main_Controller.dart';
import '../../search_Page/searchWidget.dart';

class ButtonWidget extends StatelessWidget{
  const ButtonWidget({super.key, this.buttonText, this.onTap, this.color, this.textcolor});
  final String? buttonText;
  final Widget? onTap;
  final Color? color;
  final Color? textcolor;


  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => onTap!)
        );

      },
      child: Container(
        height: 60,
        width: 350,
        decoration: BoxDecoration(
          color: color!,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),

        child: Text(
          buttonText!,
          textAlign: TextAlign.center,
          style:  TextStyle(
            color: textcolor!,
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );




  }

}