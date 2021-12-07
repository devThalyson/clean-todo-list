import 'package:clean_todo_list/app/modules/todo_module/data/datasources/cancel_finish_todo_datasource/cancel_finish_todo_datasource_local/cancel_finish_todo_datasource_local.dart';
import 'package:clean_todo_list/app/modules/todo_module/data/datasources/delete_todo_datasource/delete_todo_datasource_local/delete_todo_datasource_local.dart';
import 'package:clean_todo_list/app/modules/todo_module/data/datasources/finish_todo_datasource/finish_todo_datasource_local/finish_todo_datasource_local.dart';
import 'package:clean_todo_list/app/modules/todo_module/data/datasources/get_todos_datasource/get_todos_datasource_local/get_todo_datasource_loca.dart';
import 'package:clean_todo_list/app/modules/todo_module/data/datasources/save_todo_datasource/save_todo_datasource_local/save_todo_datasource_local.dart';
import 'package:clean_todo_list/app/modules/todo_module/data/repositories/cancel_finish_todo_repository/cancel_finish_todo_repository_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/data/repositories/delete_todo_repository/delete_todo_repository_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/data/repositories/finish_todo_repository/finish_todo_repository_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/data/repositories/get_todos_repository/get_todos_repository_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/data/repositories/save_todo_repository/save_todo_repository_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/cancel_finish_todo_usecase/cancel_finish_todo_usecase_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/delete_todo_usecase/delete_todo_usecase_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/finish_todo_usecase/finish_todo_usecase_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/get_todos_usecase/get_todos_usecase_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/save_todo_usecase/save_todo_usecase_imp.dart';
import 'package:clean_todo_list/app/modules/todo_module/presentation/todo_list/controller/todo_list_controller.dart';
import 'package:clean_todo_list/app/modules/todo_module/presentation/todo_list/pages/todo_list_page.dart';
import 'package:clean_todo_list/app/modules/todo_module/presentation/todo_save/controller/todo_save_controller.dart';
import 'package:clean_todo_list/app/modules/todo_module/presentation/todo_save/pages/todo_save_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // USECASES
        Bind.lazySingleton((i) => SaveTodoUsecaseImp(i())),
        Bind.lazySingleton((i) => GetTodosUsecaseImp(i())),
        Bind.lazySingleton((i) => FinishTodoUsecaseImp(i())),
        Bind.lazySingleton((i) => DeleteTodoUsecaseImp(i())),
        Bind.lazySingleton((i) => CancelFinishTodoUsecaseImp(i())),

        // REPOSITORIES
        Bind.lazySingleton((i) => SaveTodoRepositoryImp(i())),
        Bind.lazySingleton((i) => GetTodosRepositoryImp(i())),
        Bind.lazySingleton((i) => FinishTodoRepositoryImp(i())),
        Bind.lazySingleton((i) => DeleteTodoRepositoryImp(i())),
        Bind.lazySingleton((i) => CancelFinishTodoRepositoryImp(i())),

        // DATASOURCES
        Bind.lazySingleton((i) => SaveTodoDatasourceLocal()),
        Bind.lazySingleton((i) => GetTodosDatasourceLocal()),
        Bind.lazySingleton((i) => FinishTodoDatasourceLocal()),
        Bind.lazySingleton((i) => DeleteTodoDatasourceLocal()),
        Bind.lazySingleton((i) => CancelFinishTodoDatasourceLocal()),

        // CONTROLLERS
        Bind.lazySingleton(
          (i) => TodoListController(
            i(),
            i(),
            i(),
            i(),
          ),
        ),

        Bind.lazySingleton(
          (i) => TodoSaveController(
            i(),
            i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) {
            return TodoListPage();
          },
        ),
        ChildRoute(
          '/todoSavePage',
          child: (_, __) {
            return TodoSavePage();
          },
        ),
      ];
}
