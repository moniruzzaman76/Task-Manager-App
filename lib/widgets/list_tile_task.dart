import 'package:flutter/material.dart';
import 'package:task_manager/data/model/task_list_model.dart';

class ListTileTask extends StatelessWidget {
  const ListTileTask({
    super.key,
    required this.color,
    required this.data,
    required this.onDeleteTap,
    required this.onEditTap,
  });
  final VoidCallback onDeleteTap, onEditTap;
  final TaskData data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.title ?? ""),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.description ?? ""),
          const SizedBox(
            height: 15,
          ),
          Text(data.createdDate ?? ""),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Chip(
                label: Text(
                  data.status ?? "New",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                backgroundColor: color,
              ),
              const Spacer(),
              IconButton(
                  onPressed: onEditTap,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed:onDeleteTap,
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
