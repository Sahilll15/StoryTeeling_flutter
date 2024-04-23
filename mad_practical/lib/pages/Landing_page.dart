import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mad_practical/services/navigationService.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late NavigationService _navigationService;
  final GetIt getIt = GetIt.instance;

  @override
  void initState() {
    super.initState();
    _navigationService = getIt.get<NavigationService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeGiveStory'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Text(
              'Welcome to StoryTeller',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJWptKnUNkoNj7-FbiBNmuXBpEWPZBh7kXbQ&s',
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Explore captivating stories from around the world. '
                'Immerse yourself in different cultures and experiences.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                _navigationService.pushNamed('/home');
              },
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                foregroundColor: Color.fromARGB(255, 26, 13, 140),
                shadowColor: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.black), // Border color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
