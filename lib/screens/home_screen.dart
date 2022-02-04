import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_model.dart';
import '../bloc/todos/todo_bloc.dart';
import '../widgets/add_todo_widget.dart';
import '../widgets/todo_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todos Bloc"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        if (state is TodoLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (state is TodoLoadedState) {
          if (state.todos.isEmpty) {
            return const Center(
              child: Text("Todo is empty!"),
            );
          } else {
            return ListView.builder(
              itemCount: state.todos.length,
              padding: const EdgeInsets.all(20.0),
              itemBuilder: (context, index) {
                TodoModel todo = state.todos[index];

                return TodoCardWidget(todo: todo);
              },
            );
          }
        } else {
          return const Center(
            child: Text("Something went wrong!"),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AddTodoWidget();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
