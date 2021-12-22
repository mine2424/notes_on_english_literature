import 'package:hooks_riverpod/hooks_riverpod.dart';


class SetNotifier extends StateNotifier<String> {
  SetNotifier() : super('Hello World');

  void change(String text) => state = text;
}

final setNotifier =
    StateNotifierProvider<SetNotifier, String>((ref) => SetNotifier());
