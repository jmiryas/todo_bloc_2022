import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_model.dart';
import '../bloc/todos/todo_bloc.dart';

class TodoCardWidget extends StatelessWidget {
  const TodoCardWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(todo.task),
        subtitle: Text(todo.description),
        trailing: SizedBox(
          width: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<TodoBloc>(context).add(
                    TodoEditEvent(
                      todo: todo.copyWith(isCompleted: !todo.isCompleted),
                    ),
                  );
                },
                icon: Icon(
                  Icons.check,
                  color: Colors.green.shade300,
                ),
              ),
              IconButton(
                onPressed: () {
                  BlocProvider.of<TodoBloc>(context).add(
                    TodoDeleteEvent(todo: todo),
                  );
                },
                icon: Icon(
                  Icons.clear,
                  color: Colors.red.shade300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
