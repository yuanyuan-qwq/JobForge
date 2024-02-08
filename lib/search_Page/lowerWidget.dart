import 'package:flutter/material.dart';


import 'item.dart';


class lower_widget_search extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_lower_widget_search();


}
class _lower_widget_search extends State<lower_widget_search>{



  @override
  Widget build(BuildContext context) {

    List<Item> searchList = ITEM_LIST
        .where((element) => element.name.toLowerCase().contains(text.toLowerCase()))
        .toList();

    return ListView.builder(
        itemBuilder: (context, index){
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 100,


                child: Row(
                  children: <Widget>[
                    Container(
                      height: 75,
                      width: 75,
                      child: Image.asset(
                        searchList[index].path,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: ButtonStyle(

                              backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(0, 76, 153,1)),

                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  searchList[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Row()
                                  ],
                                )
                              ],
                            ),

                            // funtion to put inside
                            onPressed: (){

                            },
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 5,
              )
            ],
            
          );
        },

      itemCount: searchList.length,
    
    );

    

  }

}