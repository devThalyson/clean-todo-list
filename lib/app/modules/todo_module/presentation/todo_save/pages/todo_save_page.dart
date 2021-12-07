import 'package:clean_todo_list/app/modules/todo_module/presentation/todo_save/controller/todo_save_controller.dart';
import 'package:clean_todo_list/app/shared/core/behaviour/behaviour.dart';
import 'package:clean_todo_list/app/shared/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoSavePage extends StatefulWidget {
  @override
  _TodoSavePageState createState() => _TodoSavePageState();
}

class _TodoSavePageState
    extends ModularState<TodoSavePage, TodoSaveController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova tarefa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Form(
            key: controller.formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Título'),
                  ),
                  validator: Validators.emptyFieldValidator,
                  textInputAction: TextInputAction.next,
                  controller: controller.titleTextController,
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Descrição'),
                  ),
                  validator: Validators.emptyFieldValidator,
                  controller: controller.descriptionTextController,
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () => controller.saveTodo(context),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Observer(
                      builder: (_) {
                        return Visibility(
                          visible: controller.behaviour == Behaviour.regular,
                          child: Text(
                            'SALVAR',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 21,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          replacement: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
