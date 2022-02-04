part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

// State pada saat loading dan loaded (loading usai)

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<TodoModel> todos;

  const TodoLoadedState({
    this.todos = const <TodoModel>[],
  });

  @override
  List<Object> get props => [todos];
}
