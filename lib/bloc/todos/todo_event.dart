part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

// Fungsi untuk load semua todos

class TodoLoadEvent extends TodoEvent {
  final List<TodoModel> todos;

  const TodoLoadEvent({
    this.todos = const <TodoModel>[],
  });

  @override
  List<Object> get props => [todos];
}

// Fungsi untuk menambah todo

class TodoAddEvent extends TodoEvent {
  final TodoModel todo;

  const TodoAddEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

// Fungsi untuk edit todo

class TodoEditEvent extends TodoEvent {
  final TodoModel todo;

  const TodoEditEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

// Fungsi untuk remove todo

class TodoDeleteEvent extends TodoEvent {
  final TodoModel todo;

  const TodoDeleteEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}
