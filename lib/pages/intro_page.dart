import 'package:e_commerce_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Colors.grey[300],
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [
            // logo : 
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset('lib/images/nike.png', height : 300), 
            ),
            const SizedBox(height : 60),

            // Title : 
            Text("Just Do It !" , style : TextStyle(fontWeight : FontWeight.bold , fontSize : 25)),
            const SizedBox(height : 24),
            // Sub title : 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Brand new Sneakers and custom kicks made of premium quality!" , style : TextStyle(fontSize : 20 , color  :Colors.grey[600]) , textAlign: TextAlign.center),
            ),
            const SizedBox(height : 50),
            // Start now button : 
            GestureDetector(
              onTap : () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())),
              child: Container(
                decoration : BoxDecoration(
                  color : Colors.black87,
                  borderRadius : BorderRadius.circular(12),
                ),
                child : Padding(
                  padding: const EdgeInsets.only(left : 50 , right : 50 , top : 10 , bottom : 10),
                  child: Text("Shop Now" , style : TextStyle(fontSize : 20 , color : Colors.grey[300] , fontWeight : FontWeight.bold)),
                ),
              ),
            )
          ]
        ),
      )
    );
  }
}