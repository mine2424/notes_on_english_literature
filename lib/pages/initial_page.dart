import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/di_container.dart';
import 'package:notes_on_english_literature/pages/book/note_list/note_list_page.dart';
import 'package:notes_on_english_literature/pages/home/home_page.dart';
import 'package:notes_on_english_literature/widgets/button/info_button.dart';

class InitialPage extends StatefulHookWidget {
  const InitialPage();
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final List<Widget> _children = [
    const NoteListPage(),
    const HomePage(),
    const SizedBox(),
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
  ];

  int _currentIndex = 1;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> checkForcedUpdate(BuildContext context) async {
    context.read(appNotifierProvider.notifier).checkForcedUpdate();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await checkForcedUpdate(context);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(bottomBarItems[_currentIndex].label!),
        actions: (_currentIndex == 0) ? [InfoButton(onPressed: () {})] : null,
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
