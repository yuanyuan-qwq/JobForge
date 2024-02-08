import 'package:flutter/material.dart';
import '../../Theme/theme.dart';
import '../pic_list.dart';

class Middle extends StatefulWidget{
  const Middle({super.key});

  @override
  State<StatefulWidget> createState() => _Middle();

}

class _Middle extends State<Middle> {


  @override
  Widget build(BuildContext context) {

    List<Pic> piclist = PIC_LIST;

    return Container(
      alignment: Alignment.center,
      height: 130.0,

      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: iconBox(index: index,),
          );

        },

        itemCount: piclist.length,
      ),

    );



  }

}


class iconBox extends StatelessWidget{
  const iconBox({super.key, required this.index});


  final int index;

  @override
  Widget build(BuildContext context) {

    List<Pic> piclist = PIC_LIST;

    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: (){

          },
          child: Container(
            height: 100,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 45,
                  width: 45,
                  child: Image.asset(
                    piclist[index].path,
                    fit: BoxFit.cover,
                  ),

                ),
                Text(
                  piclist[index].name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: darkColorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),


          ),

        ),
        SizedBox(width: 15,),

      ],




      /*
      height: 100,
      width: 120,
      color: darkColorScheme.secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 45,
                    width: 45,
                    child: Image.asset(
                      piclist[index].path,
                      fit: BoxFit.cover,
                    ),

                  ),
                  Text(
                    piclist[index].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: darkColorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),


            ),

          ),
          SizedBox(width: 15,),

        ],
      ),

       */
    );

  }

}
