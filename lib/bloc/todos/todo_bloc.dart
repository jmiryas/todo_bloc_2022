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

  // Fungsi untuk me-load todo

  void _onTodoLoad(TodoLoadEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoadingState());

    await Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
      () => emit(
        TodoLoadedState(todos: event.todos),
      ),
    );
  }

  // Fungsi untuk menambah todo

  void _onTodoAdd(TodoAddEvent event, Emitter<TodoState> emit) {
    final state = this.state;

    if (state is TodoLoadedState) {
      emit(
        TodoLoadedState(
          todos: List.from(state.todos)..add(event.todo),
        ),
      );
    }
  }

  // Fungsi untuk mengedit todo

  void _onTodoEdit(TodoEditEvent event, Emitter<TodoState> emit) {
    final state = this.state;

    if (state is TodoLoadedState) {
      List<TodoModel> todos = state.todos
          .map((item) => item.id == event.todo.id ? event.todo : item)
          .toList();

      emit(
        TodoLoadedState(
          todos: List.from(todos),
        ),
      );
    }
  }

  // Fungsi untuk menghapus todo

  void _onTodoDelete(TodoDeleteEvent event, Emitter<TodoState> emit) {
    final state = this.state;

    if (state is TodoLoadedState) {
      List<TodoModel> todos = state.todos
          .where(
            (item) => item.id != event.todo.id,
          )
          .toList();

      emit(
        TodoLoadedState(
          todos: List.from(todos),
        ),
      );
    }
  }
}
