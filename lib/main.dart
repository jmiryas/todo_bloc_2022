import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_2022/bloc/todos/todo_bloc.dart';
import 'package:todo_bloc_2022/models/todo_model.dart';

import '../config/theme.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Load semua todos

        BlocProvider(
          create: (context) => TodoBloc()
            ..add(
              const TodoLoadEvent(todos: [
                TodoModel(
                  id: "dsfdsf",
                  task: "dsfffdsf",
                  description: "fhgdfhdfhfdh",
                ),
                TodoModel(
                  id: "xcasdas",
                  task: "rtytryrt",
                  description: "cxvcxv",
                ),
              ]),
            ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Todos Bloc",
        theme: themeData(),
        home: const HomeScreen(),
      ),
    );
  }
}
