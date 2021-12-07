import 'package:clean_todo_list/app/modules/todo_module/data/models/todo_model.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/save_todo_usecase/save_todo_usecase_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/presentation/todo_list/controller/todo_list_controller.dart';
import 'package:clean_todo_list/app/shared/core/behaviour/behaviour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'todo_save_controller.g.dart';

class TodoSaveController = _TodoSaveControllerBase with _$TodoSaveController;

abstract class _TodoSaveControllerBase extends Disposable with Store {
  ReactionDisposer? reactionDisposer;
  final SaveTodoUsecaseImp saveTodoUsecaseImp;
  final TodoListController todoListController;

  _TodoSaveControllerBase(this.saveTodoUsecaseImp, this.todoListController) {
    reactionDisposer = autorun((_) {});
  }

  var titleTextController = TextEditingController();
  var descriptionTextController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  TodoModel? todo;

  @observable
  Behaviour behaviour = Behaviour.regular;

  @action
  saveTodo(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      todo = TodoModel(
        titleModel: titleTextController.text,
        descriptionModel: descriptionTextController.text,
      );

      behaviour = Behaviour.loading;
      final saveTodoResult = await saveTodoUsecaseImp(todo!);
      behaviour = Behaviour.regular;

      saveTodoResult.fold(
        (l) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
              content: Text(
                l.message,
              ),
            ),
          );
        },
        (r) async {
          await todoListController.getTodos();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green[900],
              content: Text(
                r.message!,
              ),
            ),
          );
          titleTextController.clear();
          descriptionTextController.clear();
        },
      );
    }
  }

  @override
  void dispose() {
    reactionDisposer!();
    titleTextController.dispose();
    descriptionTextController.dispose();
  }
}
