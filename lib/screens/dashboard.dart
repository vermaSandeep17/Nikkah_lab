import 'package:flutter/material.dart';
import 'package:new_nikkah_lab/screens/chats.dart';
import 'package:new_nikkah_lab/screens/home.dart';
import 'package:new_nikkah_lab/screens/profile.dart';
import 'package:new_nikkah_lab/screens/top_picks.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    TopPickScreen(),
    ChatListScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Color(0xff7D7D7D),
        backgroundColor: Color(0xffFFF5F5),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
            backgroundColor: Color(0xffFFF5F5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chats',
            backgroundColor: Color(0xffFFF5F5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
            backgroundColor: Color(0xffFFF5F5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color(0xffFFF5F5),
          ),
        ],
      ),
    );
  }
}
