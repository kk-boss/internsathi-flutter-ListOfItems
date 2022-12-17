import 'package:riverpod/riverpod.dart';

final listItemProvider = StateNotifierProvider<ListItems, List<String>>((ref) {
  final initialState = List.generate(5, (i) => "List item ${i + 1}");
  return ListItems(initialState);
});

class ListItems extends StateNotifier<List<String>> {
  ListItems(super.state);

  String removeItem(int index) {
    return state.removeAt(index);
  }

  int addItem(String item) {
    state.add(item);
    return state.length;
  }
}
