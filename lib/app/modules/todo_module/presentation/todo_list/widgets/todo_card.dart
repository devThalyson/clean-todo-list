import 'package:clean_todo_list/app/modules/todo_module/data/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todo;

  final Function changeFinished;
  final Function deleteTodo;

  TodoCard({
    required this.todo,
    required this.changeFinished,
    required this.deleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () => deleteTodo(),
          ),
          Expanded(
            child: CheckboxListTile(
              value: todo.finishedModel! == 0 ? false : true,
              onChanged: (value) async {
                await changeFinished();
              },
              title: Text(
                todo.titleModel!,
              ),
              subtitle: Text(
                todo.descriptionModel!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
