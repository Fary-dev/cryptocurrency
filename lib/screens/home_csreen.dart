import 'package:crypto_app/screens/screens.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _screenList = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_selectedIndex],
      backgroundColor: const Color.fromARGB(11, 12, 54, 1),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 0.6,width: double.infinity,color: Colors.white24,),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 25.0),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.stairs), label: 'Crypto'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.flutter_dash), label: 'Flutter Dash'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              ],

              // unselectedItemColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
