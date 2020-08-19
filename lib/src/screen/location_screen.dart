import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF002da5),
        centerTitle: true,
        title: Text("Location"),
        ),

      body: IntroductionScreen(
        pages: [
           PageViewModel(
              title: "Pune, Maharashtra",
              body: "Pune is a sprawling city in the western Indian state of Maharashtra. It was once the base of the Peshwas (prime ministers) of the Maratha Empire, which lasted from 1674 to 1818. ",
              image: Center(
                child: Image.asset("assets/nearby_asset.png",height: 198,)
              ),
              decoration: const PageDecoration(
                //pageColor: Colors.blue,
                titleTextStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Color(0xFF1455d8)),
                bodyTextStyle: TextStyle(fontSize: 13),
              ),
              footer: MaterialButton(
                onPressed: () {
                  // On button presed
                },
                textColor: Colors.white,
                color: Color(0xFF002da5),
                child: const Text("Choose"),
                minWidth: 280,
                splashColor: Colors.blueAccent,
                elevation: 5,
              ),
            ),
            PageViewModel(title: "Pune, Maharashtra",body: "pune is a beautiful city"),
            PageViewModel(title: "Mumbai, Maharashtra",body: "mumbai is a city of dreams"),
        ],
        onDone: () {
                // When done button is press
              },  
        onSkip: () {
                // You can also override onSkip callback
              },  
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        showSkipButton: true,
        skip: const Text("Skip"),
        next: const Icon(Icons.navigate_next),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Color(0xFF1455d8),
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
          ),
      ),
      )
    );
  }
}

