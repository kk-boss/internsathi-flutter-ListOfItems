import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.text, this.onRemove});
  final String text;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  text,
                  maxLines: 1,
                  style: const TextStyle(
                    // fontWeight: task.isCompleted ? null : FontWeight.bold,
                    // color: task.isCompleted ? customColor?.gray : null,
                    // decorationColor: customColor?.black,
                    overflow: TextOverflow.ellipsis,
                    // decoration:
                    //     task.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (onRemove != null) {
                  onRemove!();
                }
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
