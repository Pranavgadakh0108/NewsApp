import 'package:flutter/material.dart';
import 'package:news_app/ui/bookmark.dart';
import 'package:news_app/ui/dashboard.dart';
import 'package:news_app/ui/discover.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

  List<Widget> screens = [Dashboard(), Discover(), Bookmark()];

  void onTapSelectItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        elevation: 2,
        selectedItemColor: Colors.deepOrange,
        onTap: onTapSelectItem,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Discover"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "BookMarks",
          ),
        ],
      ),
    );
  }
}
