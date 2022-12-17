import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listofitems/screens/home/providers/list_items.dart';
import 'package:listofitems/screens/home/widgets/list_item.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(listItemProvider);

    final listKey = GlobalKey<AnimatedListState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List of items",
        ),
      ),
      body: AnimatedList(
        key: listKey,
        padding: const EdgeInsets.all(8),
        itemBuilder: (_, i, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: ListItem(
              text: items[i],
              onRemove: () {
                final removedItem =
                    ref.read(listItemProvider.notifier).removeItem(i);
                listKey.currentState?.removeItem(
                  i,
                  (context, animation) => SizeTransition(
                    sizeFactor: animation,
                    child: ListItem(
                      text: removedItem,
                    ),
                  ),
                );
              },
            ),
          );
        },
        initialItemCount: items.length,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final itemsLength =
                ref.read(listItemProvider.notifier).addItem("New item");
            listKey.currentState?.insertItem(itemsLength - 1);
          },
          child: const Icon(Icons.add)),
    );
  }
}
