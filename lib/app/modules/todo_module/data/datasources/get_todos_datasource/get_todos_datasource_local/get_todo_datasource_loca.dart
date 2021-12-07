import 'package:clean_todo_list/app/modules/todo_module/data/datasources/get_todos_datasource/get_todos_datasource.dart';
import 'package:clean_todo_list/app/modules/todo_module/data/models/todo_model.dart';
import 'package:clean_todo_list/app/shared/services/local_database/loca_database.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';

class GetTodosDatasourceLocal implements GetTodosDatasource {
  @override
  Future<Either<Failure, Success>> call() async {
    try {
      List<TodoModel> todos = [];
      final database = await LocalDatabase.getDatabase();

      final sql = "SELECT * FROM todo";

      final todoList = await database.rawQuery(sql);

      if (todoList.isNotEmpty) {
        todoList.forEach(
          (todo) {
            todos.add(
              TodoModel.fromMap(todo),
            );
          },
        );
      }

      return Right(
        Success(
          response: todos,
        ),
      );
    } catch (error) {
      print(error);

      return Left(
        Failure(message: 'Erro ao listar fazendas!'),
      );
    }
  }
}
