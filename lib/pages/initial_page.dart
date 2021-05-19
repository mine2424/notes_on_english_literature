import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/pages/home/home_page.dart';
import 'package:notes_on_english_literature/pages/notes/book_list/book_list_page.dart';
import 'package:notes_on_english_literature/pages/notes/book/create_sentence_page.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final List<Widget> _children = [
    const BookBookPage(),
    const HomePage(),
    const SizedBox(),
    // const SizedBox(),
  ];

  final bottomBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.source,
      ),
      label: 'Notes',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.question_answer,
      ),
      label: 'Chats',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.phone_outlined),
    //   label: 'Q&A',
    // ),
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
        actions: (_currentIndex == 0)
            ? [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (_) => CreateSentencePage(),
                    ),
                  ),
                ),
              ]
            : null,
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
