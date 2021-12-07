import 'package:clean_todo_list/app/modules/todo_module/data/models/todo_model.dart';
import 'package:clean_todo_list/app/modules/todo_module/presentation/todo_list/controller/todo_list_controller.dart';
import 'package:clean_todo_list/app/modules/todo_module/presentation/todo_list/widgets/todo_card.dart';
import 'package:clean_todo_list/app/shared/core/behaviour/behaviour.dart';
import 'package:clean_todo_list/app/shared/widgets/builder_state_widget/builder_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState
    extends ModularState<TodoListPage, TodoListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        centerTitle: true,
      ),
      floatingActionButton: Observer(
        builder: (_) {
          return Visibility(
            visible: controller.behaviour == Behaviour.regular,
            child: FloatingActionButton(
              onPressed: () => Modular.to.pushNamed('/todoSavePage'),
              child: Icon(Icons.add),
            ),
          );
        },
      ),
      body: Observer(
        builder: (_) {
          return BuilderStateWidget(
            behaviour: controller.behaviour,
            regular: (context) {
              return Observer(
                builder: (_) {
                  return Visibility(
                    visible: controller.todos.isNotEmpty,
                    replacement: Center(
                      child: Text('Você não tem tarefas'),
                    ),
                    child: ListView.builder(
                      itemCount: controller.todos.length,
                      itemBuilder: (_, index) {
                        TodoModel todo = controller.todos[index];
                        return TodoCard(
                          todo: todo,
                          changeFinished: () => controller.changeTodoFinished(
                            todo: todo,
                            context: context,
                          ),
                          deleteTodo: () => controller.deleteTodo(
                            todo: todo,
                            context: context,
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
            loading: (context) {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    );
  }
}
