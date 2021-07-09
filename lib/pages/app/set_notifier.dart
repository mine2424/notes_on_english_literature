import 'package:hooks_riverpod/hooks_riverpod.dart';

// TODO: setStateのように汎用的に実装する。
class SetNotifier extends StateNotifier<String> {
  SetNotifier() : super('Hello World');

  void change(String text) => state = text;
}

final setNotifier =
    StateNotifierProvider<SetNotifier, String>((ref) => SetNotifier());
