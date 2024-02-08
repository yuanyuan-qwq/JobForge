import 'package:flutter/material.dart';
import 'package:jobstreet/search_Page/speechToText.dart';
import 'item.dart';
import 'lowerWidget.dart';


class search extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => search_state();
}

class search_state extends State<search>{


  final String spoke ="";

  @override
  Widget build(BuildContext context) {

    // make a space between widget
    SizedBox spaceInBetween = SizedBox(width: 10,);

    //create a controller for an editable text field
    TextEditingController controller = TextEditingController();

    //code to Search on items by its name

    List<Item> searchList = ITEM_LIST
    .where((element) => element.name.toLowerCase().contains(text.toLowerCase()))
    .toList();





    Widget _allItems(String searchText){

      return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(0, 128, 255, 1)),
          ),
          onPressed: (){
            setState(() {
              text = searchText;
            });
          },
          child: Text(
            "All",
            style: TextStyle(
              color: Colors.white,
            ),
          )
      );
    }

    // to filter item
    Widget _singleItem(String searchText){

      return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(0, 128, 255, 1)),
          ),
          onPressed: (){
            setState(() {
              text = searchText;
            });
          },
          child: Text(
            searchText,
            style: TextStyle(
              color: Colors.white,
            ),
          )
      );
    }


    return Scaffold(


      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 51, 102, 1),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,

        title: Text(
          "Seek a job",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: <Widget>[
          IconButton(
              onPressed: () async {
                final confirmedText  = await Navigator.push<String>(
                    context,
                    // then : use to retrieve data from pushed page
                    MaterialPageRoute(builder: (context) => const speech_Home())).then((value) => {
                      if(value != null && value.isNotEmpty){
                        // Update the text value of the TextFormField controller
                        controller.text = value
                      }

                    }
                );


              },
              icon: Icon(
                  Icons.mic_none
              ),
          )
        ],

        //Preferredsize = to expanded size of app bar
        bottom: PreferredSize(
          //to control with app bar size
          preferredSize: Size(3,130),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(7),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white24,
                  ),

                  //UI of text TextformField
                  child: TextFormField(
                    controller: controller,

                    //code to search for input text om textformField we make it as covariant
                    //covariant = function to receive variable text
                    onFieldSubmitted: (covariant){
                      setState(() {
                        text = covariant;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Enter the field job",
                      hintStyle: TextStyle(
                        fontSize: 15,
                      ),
                      prefixIcon: Icon(
                          Icons.search,
                      ),
                      suffix: IconButton(
                        icon: Icon(
                            Icons.close
                        ),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },



                      ),

                    ),
                  ),
                ),
              ),

              //UI of section Field
              Container(
                height: 50,
                color: Color.fromRGBO(0, 51, 102, 1),
                //to creates a box in which a single widget can be scrolled
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),

                      //to call all item widget
                      _allItems(""),
                      spaceInBetween,
                      _singleItem("Architecture and Engineering"),
                      spaceInBetween,
                      _singleItem("Arts Culture and Entertainment"),
                      spaceInBetween,
                      _singleItem("Business, Management and Administration"),
                      spaceInBetween,
                      _singleItem("Communications"),
                      spaceInBetween,
                      _singleItem("Community and Social Services"),
                      spaceInBetween,
                      _singleItem("Education"),
                      spaceInBetween,
                      _singleItem("cience and Technology"),
                      spaceInBetween,
                      _singleItem("Installation, Repair and Maintenance"),
                      spaceInBetween,
                      _singleItem("Farming, Fishing and Forestry"),
                      spaceInBetween,
                      _singleItem("Government"),
                      spaceInBetween,
                      _singleItem("Health and Medicine"),
                      spaceInBetween,
                      _singleItem("Law and Public Policy"),
                      spaceInBetween,
                      _singleItem("Sales"),
                      spaceInBetween,

                    ],
                  ),
                ),
              ),
              Container(
                height: 30,
                width: double.infinity,
                color: Color.fromRGBO(0, 51, 102, 1),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 3),
                  child: Text(
                    "Search for: $text",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),

        ),

      ),
      body: Container(
        color: Color.fromRGBO(0, 76, 153,1),
        child: lower_widget_search(),
      )



    );






  }



}