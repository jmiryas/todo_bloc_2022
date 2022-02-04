import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoLoadingState()) {
    on<TodoLoadEvent>(_onTodoLoad);
    on<TodoAddEvent>(_onTodoAdd);
    on<TodoEditEvent>(_onTodoEdit);
    on<TodoDeleteEvent>(_onTodoDelete);
  }

  void _onTodoLoad(TodoLoadEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoadingState());

    await Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
      () => emit(
        TodoLoadedState(todos: event.todos),
      ),
    );
  }

  void _onTodoAdd(TodoAddEvent event, Emitter<TodoState> state) {}

  void _onTodoEdit(TodoEditEvent event, Emitter<TodoState> state) {}

  void _onTodoDelete(TodoDeleteEvent event, Emitter<TodoState> state) {}
}
