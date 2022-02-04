import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String id;
  final String task;
  final String description;
  final bool isCompleted;
  final bool isCancelled;

  const TodoModel({
    required this.id,
    required this.task,
    required this.description,
    this.isCompleted = false,
    this.isCancelled = false,
  });

  @override
  List<Object> get props => [
        id,
        task,
        description,
        isCompleted,
        isCancelled,
      ];

  TodoModel copyWith({
    id,
    task,
    description,
    isCompleted,
    isCancelled,
  }) {
    return TodoModel(
      id: id ?? this.id,
      task: task ?? this.task,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      isCancelled: isCancelled ?? this.isCancelled,
    );
  }
}
