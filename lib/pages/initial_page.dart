import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/pages/home/home_page.dart';
import 'package:notes_on_english_literature/pages/notes/notes_list_page.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final List<Widget> _children = [
    const NotesBookPage(),
    const HomePage(),
    const SizedBox(),
    const SizedBox(),
  ];

  final bottomBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.source,
      ),
      label: 'notes',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.tablet_android,
      ),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.question_answer,
      ),
      label: 'Q&A',
    ),
  ];

  int _currentIndex = 1;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bottomBarItems[_currentIndex].label!),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: bottomBarItems,
      ),
    );
  }
}
