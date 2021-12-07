// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoListController on _TodoListControllerBase, Store {
  final _$behaviourAtom = Atom(name: '_TodoListControllerBase.behaviour');

  @override
  Behaviour get behaviour {
    _$behaviourAtom.reportRead();
    return super.behaviour;
  }

  @override
  set behaviour(Behaviour value) {
    _$behaviourAtom.reportWrite(value, super.behaviour, () {
      super.behaviour = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_TodoListControllerBase.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$todosAtom = Atom(name: '_TodoListControllerBase.todos');

  @override
  List<TodoModel> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(List<TodoModel> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  final _$getTodosAsyncAction = AsyncAction('_TodoListControllerBase.getTodos');

  @override
  Future getTodos({bool changeStateForLoading = true}) {
    return _$getTodosAsyncAction.run(
        () => super.getTodos(changeStateForLoading: changeStateForLoading));
  }

  final _$changeTodoFinishedAsyncAction =
      AsyncAction('_TodoListControllerBase.changeTodoFinished');

  @override
  Future changeTodoFinished(
      {required TodoModel todo, required BuildContext context}) {
    return _$changeTodoFinishedAsyncAction
        .run(() => super.changeTodoFinished(todo: todo, context: context));
  }

  final _$deleteTodoAsyncAction =
      AsyncAction('_TodoListControllerBase.deleteTodo');

  @override
  Future deleteTodo({required TodoModel todo, required BuildContext context}) {
    return _$deleteTodoAsyncAction
        .run(() => super.deleteTodo(todo: todo, context: context));
  }

  @override
  String toString() {
    return '''
behaviour: ${behaviour},
errorMessage: ${errorMessage},
todos: ${todos}
    ''';
  }
}
