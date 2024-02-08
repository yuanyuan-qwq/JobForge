
/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Login_Page/screen/first_screen.dart';
import 'new.dart';

class Upper extends StatefulWidget {
  Upper({Key? key}) : super(key: key);

  @override
  State<Upper> createState() => _UpperState();
}

class _UpperState extends State<Upper> {
  final PageController _controller = PageController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  Future<void> fetchdata() async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection('news').doc('gan5mZsjinYL2GXUzgCM').get();

      final List<String> data_name = ["news1", "news2", "news3"];

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

        for (String data_name in data_name) {
          if (data.containsKey(data_name)) {
            List<dynamic> imageUrlList = data[data_name];

            // Convert the dynamic list to a list of strings
            imageUrls.addAll(imageUrlList.map((url) => url.toString()));
          } else {
            print('Field $data_name not found in document.');
          }
        }
        print(imageUrls[0]);
        print(imageUrls[1]);
        print(imageUrls[2]);
      } else {
        print('Document with ID gan5mZsjinYL2GXUzgCM does not exist.');
      }
    } catch (e) {
      print('Error retrieving data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 200.0,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: imageUrls.map((url) {
                return news(
                  image: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: imageUrls.length,
            effect: SwapEffect(),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Login_Page/screen/first_screen.dart';
import 'new.dart';



class Upper extends StatelessWidget {



  Upper({Key? key}) : super(key: key);


  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: <Widget>[
        Container(
          height: 200.0,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            children: <Widget>[
              news(
                image: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/jobforge-a6c49.appspot.com/o/images.jpg?alt=media&token=077abe34-fe11-40fb-9c68-990e80ca1b1b',
                    fit: BoxFit.cover
                ),
              ),
              news(
                image: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/jobforge-a6c49.appspot.com/o/maxresdefault.jpg?alt=media&token=15c1197e-ad0d-4b10-8d45-404d8431e253',
                    fit: BoxFit.cover
                ),
              ),
              news(
                image: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/jobforge-a6c49.appspot.com/o/107188701-16754313081675431305-28039509961-1080pnbcnews.jpg?alt=media&token=16993464-b255-487d-8692-0c30548cb354',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: SwapEffect(),
          ),
          SizedBox(height: 15,),
        ],
      ),
    );




  }

}
