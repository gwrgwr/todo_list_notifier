import 'package:flutter/material.dart';
import 'package:todo_list_notifier/models/task_list_model.dart';

class ListBuilderTask extends StatefulWidget {
  const ListBuilderTask(
      {required this.taskItem, super.key, required this.onDelete});

  final TaskModel taskItem;

  final VoidCallback onDelete;

  @override
  State<ListBuilderTask> createState() => _ListBuilderTaskState();
}

class _ListBuilderTaskState extends State<ListBuilderTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Color.fromARGB(255, 8, 23, 110), borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: Transform.scale(
          scale: 1.2,
          child: Checkbox(
            value: widget.taskItem.isFinished,
            onChanged: (value) {
              setState(() {
                widget.taskItem.isFinished = value;
              });
            },
          ),
        ),
        titleAlignment: ListTileTitleAlignment.center,
        title: Center(
          child: Text(
            widget.taskItem.name,
            style: TextStyle(
                decoration: widget.taskItem.isFinished!
                    ? TextDecoration.lineThrough
                    : null,
                fontSize: 20,
                color: Colors.white),
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: widget.taskItem.isFinished!
                ? Colors.white.withOpacity(0.4)
                : Colors.transparent,
            size: 32,
          ),
          onPressed: widget.onDelete,
        ),
      ),
    );
  }
}
