import 'package:clean_todo_list/app/modules/todo_module/data/models/todo_model.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/cancel_finish_todo_usecase/cancel_finish_todo_usecase_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/delete_todo_usecase/delete_todo_usecase_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/finish_todo_usecase/finish_todo_usecase_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/get_todos_usecase/get_todos_usecase_imp.dart';
import 'package:clean_todo_list/app/shared/core/behaviour/behaviour.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'todo_list_controller.g.dart';

class TodoListController = _TodoListControllerBase with _$TodoListController;

abstract class _TodoListControllerBase extends Disposable with Store {
  ReactionDisposer? reactionDisposer;
  final GetTodosUsecaseImp getTodosUsecaseImp;
  final FinishTodoUsecaseImp finishTodoUsecaseImp;
  final CancelFinishTodoUsecaseImp cancelFinishTodoUsecaseImp;
  final DeleteTodoUsecaseImp deleteTodoUsecaseImp;

  _TodoListControllerBase(
    this.getTodosUsecaseImp,
    this.finishTodoUsecaseImp,
    this.cancelFinishTodoUsecaseImp,
    this.deleteTodoUsecaseImp,
  ) {
    reactionDisposer = autorun((_) async {
      await getTodos();
    });
  }

  @observable
  Behaviour behaviour = Behaviour.regular;

  @observable
  String? errorMessage;

  @observable
  List<TodoModel> todos = ObservableList<TodoModel>();

  @action
  getTodos({bool changeStateForLoading = true}) async {
    if (changeStateForLoading == true) {
      behaviour = Behaviour.loading;
    }
    final getTodosResult = await getTodosUsecaseImp();
    if (changeStateForLoading == true) {
      behaviour = Behaviour.regular;
    }

    return getTodosResult.fold(
      (l) {
        errorMessage = l.message;
      },
      (r) {
        todos = r.response;
      },
    );
  }

  @action
  changeTodoFinished(
      {required TodoModel todo, required BuildContext context}) async {
    Either<Failure, Success> changeFinishedResult;

    if (todo.finishedModel == 0) {
      changeFinishedResult = await finishTodoUsecaseImp(todo);
    } else {
      changeFinishedResult = await cancelFinishTodoUsecaseImp(todo);
    }

    changeFinishedResult.fold(
      (l) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(milliseconds: 1500),
            backgroundColor: Colors.red,
            content: Text(
              l.message,
            ),
          ),
        );
      },
      (r) async {
        await getTodos(changeStateForLoading: false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(milliseconds: 1500),
            backgroundColor: Colors.green[900],
            content: Text(
              r.message!,
            ),
          ),
        );
      },
    );
  }

  @action
  deleteTodo({required TodoModel todo, required BuildContext context}) async {
    final deleteTodoResponse = await deleteTodoUsecaseImp(todo);

    deleteTodoResponse.fold(
      (l) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(milliseconds: 1500),
            backgroundColor: Colors.red,
            content: Text(
              l.message,
            ),
          ),
        );
      },
      (r) async {
        await getTodos(changeStateForLoading: false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(milliseconds: 1500),
            backgroundColor: Colors.green[900],
            content: Text(
              r.message!,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    reactionDisposer!();
  }
}
