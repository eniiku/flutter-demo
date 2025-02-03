import 'package:flutter/foundation.dart';
import 'package:todo_app/src/providers/todo_provider.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;
  List<Todo> get completedTodos => _todos.where((todo) => todo.isCompleted).toList();
  List<Todo> get pendingTodos => _todos.where((todo) => !todo.isCompleted).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners()
  }

  void toggleTodoStatus(String id) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    if (todoIndex >= 0) {
      _todos[todoIndex] = _todos[todoIndex].copyWith(
        isCompleted: !_todos[todoIndex].isCompleted,
      );
      notifyListeners();
    }
  }

  void updateTodo(Todo updatedTodo) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == updatedTodo.id);
    if (todoIndex >= 0) {
      _todos[todoIndex] = updatedTodo;
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}