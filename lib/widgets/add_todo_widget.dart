import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_2022/bloc/todos/todo_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

import '../models/todo_model.dart';
import '../widgets/info_widget.dart';
import '../widgets/input_field_widget.dart';

class AddTodoWidget extends StatelessWidget {
  const AddTodoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _todoTaskController = TextEditingController();
    TextEditingController _todoDescriptionController = TextEditingController();

    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        title: const Text(
          "Add Todo",
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              InputFieldWidget(
                title: "Task:",
                hintText: "Enter task ...",
                controller: _todoTaskController,
              ),
              InputFieldWidget(
                title: "Description:",
                hintText: "Enter description ...",
                controller: _todoDescriptionController,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Colors.grey.shade900,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (_todoTaskController.text.isEmpty ||
                  _todoDescriptionController.text.isEmpty) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const InfoWidget(
                          title: "Error",
                          content: "Field is not allowed to be empty!");
                    });
              } else {
                const uuid = Uuid();

                final todo = TodoModel(
                  id: uuid.v4(),
                  task: _todoTaskController.text,
                  description: _todoDescriptionController.text,
                );

                BlocProvider.of<TodoBloc>(context).add(
                  TodoAddEvent(todo: todo),
                );

                Navigator.pop(context);
              }
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: Colors.grey.shade900,
              ),
            ),
          ),
        ],
      );
    });
  }
}
