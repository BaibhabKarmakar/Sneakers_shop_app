import 'package:e_commerce_app/components/bottom_nav_bar.dart';
import 'package:e_commerce_app/pages/cart_page.dart';
import 'package:e_commerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // this selected index is to control the bottom navigation bar
  int _selectedIndex = 0;
    // This method will update our selected index : 
    // When the user taps on the bottom bar : 
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display : 
  final List<Widget> _pages = [
    // shopping page : 
    const ShopPage(),


    // cart page : 
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        backgroundColor : Colors.grey[400],
        leading : Builder(
          builder: (context) {
            return IconButton(icon : Padding(
              padding: const EdgeInsets.only(left : 15.0),
              child: Icon(Icons.menu),
            ) ,
             onPressed: () {
              Scaffold.of(context).openDrawer();
             });
          }
        ),
      ),
      backgroundColor : Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body : _pages[_selectedIndex],
      drawer : Drawer(
        backgroundColor: Colors.grey[800],
        child : Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Column(
              children : [
            DrawerHeader(child: Image.asset('lib/images/nike.png',color : Colors.grey[100] , height : 100)),
            //Other pages : 
            Padding(
              padding: const EdgeInsets.only(left : 25),
              child: ListTile(
                leading : Icon(Icons.home , color : Colors.grey[100]),
                title : Text("Home" , style : TextStyle(color : Colors.grey[100])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left : 25),
              child: ListTile(
                leading : Icon(Icons.info , color : Colors.grey[100]),
                title : Text("About" , style : TextStyle(color : Colors.grey[100])),
              ),
            ),
              ]
            ),
            // Logo : 
            
            Padding(
              padding: const EdgeInsets.only(left : 25),
              child: ListTile(
                leading : Icon(Icons.logout , color : Colors.grey[100]),
                title : Text("Log Out" , style : TextStyle(color : Colors.grey[100])),
              ),
            ),

        ],)
      )
    );
  }
}