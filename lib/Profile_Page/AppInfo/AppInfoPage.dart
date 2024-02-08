import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About app"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 150.0, // Adjust width as needed
              height: 150.0, // Adjust height as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'images/Job_logo.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: 20.0),

            // About Us Section
            Text(
              "JobForge is your go-to app for a personalized job search experience. With advanced filters, personalized recommendations, and real-time notifications, finding the perfect job has never been easier. Track applications seamlessly and take control of your professional journey with JobForge.",
              textAlign: TextAlign.start,
            ),

            SizedBox(height: 40.0),

            Text(
              "Developer",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20.0),

            // Author Names and Personal email
            buildAuthor("Ang Wei Kang", "b032110301@student.utem.edu.my"),
            buildAuthor("Lum Fu Yuan", "b032110251@student.utem.edu.my"),
            buildAuthor("Sim Weng Jin", "b032110376@student.utem.edu.my"),
          ],
        ),
      ),
    );
  }

  Widget buildAuthor(String authorName, String websiteLink) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align from the left
      children: [
        SizedBox(height: 20.0),
        Text(
          authorName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        SizedBox(height: 8.0),
        InkWell(
          onTap: () => _launchURL(websiteLink),
          child: Text(
            websiteLink,
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutUsPage(),
  ));
}
