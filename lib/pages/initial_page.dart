import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/di_container.dart';
import 'package:notes_on_english_literature/pages/book/note_list/note_list_page.dart';
import 'package:notes_on_english_literature/pages/home/home_page.dart';
import 'package:notes_on_english_literature/pages/onBoarding/on_boarding_page.dart';
import 'package:notes_on_english_literature/widgets/button/info_button.dart';

class InitialPage extends StatefulHookWidget {
  const InitialPage({Key? key}) : super(key: key);
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
        leading: null,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: (() {
              // 即時関数を使う
              switch (_currentIndex) {
                case 0:
                  return InfoButton(
                    onPressed: () {},
                  );
                case 1:
                  return IconButton(
                    icon: const Icon(Icons.settings),
                    iconSize: 26,
                    onPressed: () async {
                      // TODO: 設定画面への遷移
                      await context
                          .read(userNotifierProvider.notifier)
                          .signOut();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OnBoardingPage(),
                        ),
                      );
                    },
                  );
                case 2:
                  return InfoButton(
                    onPressed: () {},
                  );
                default:
                  return Container();
              }
            })(),
          ),
        ],
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
