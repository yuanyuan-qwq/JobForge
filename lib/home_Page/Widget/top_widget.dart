import 'package:flutter/material.dart';
import 'package:jobstreet/home_Page/Widget/post_widget.dart';

import '../../Login_Page/screen/first_screen.dart';
import '../post_list.dart'; // Import the file where fetchPosts is defined

class topper extends StatelessWidget {
  const topper({
    Key? key,
    required this.child,
    required this.middleChild,
    required this.postChild,
  }) : super(key: key);

  final Widget child;
  final Widget middleChild;
  final Widget postChild;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
      // Use StreamBuilder to listen for changes in the data
      stream: streamPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while fetching data
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle error
          return Text('Error: ${snapshot.error}');
        } else {
          // Data fetched successfully, proceed with building UI
          List<Post> posts = snapshot.data!;

          return CustomScrollView(
            slivers: [
        SliverAppBar(
          backgroundColor: Color.fromRGBO(0, 51, 102, 1),
          title: const Row(
            children: [
              Text(
                "Job",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              Text(
                "Forge",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          centerTitle: false,
          floating: true ,
          actions: [
            Container(

              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.logout_outlined),
                iconSize: 30.0,
                color: Colors.white70,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) =>  firstPage()),
                        (route) => false, // Remove all previous routes
                  );
                },
              ),
            )
          ],
        ),
        SliverToBoxAdapter(
          child: child,
        ),

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: middleChild,
          ),

        ),

         SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final Post post = posts[index];
                    return PostContainer(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
        SliverToBoxAdapter(
          child: SizedBox(height: 70),
        )

            ],
          );
        }
      },
    );
  }
}



          


