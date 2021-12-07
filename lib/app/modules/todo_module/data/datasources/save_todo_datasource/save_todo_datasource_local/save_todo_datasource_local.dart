import 'package:clean_todo_list/app/modules/todo_module/data/datasources/save_todo_datasource/save_todo_datasource.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/entities/todo_entity.dart';
import 'package:clean_todo_list/app/shared/services/local_database/loca_database.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';

class SaveTodoDatasourceLocal implements SaveTodoDatasource {
  @override
  Future<Either<Failure, Success>> call(TodoEntity todo) async {
    try {
      final database = await LocalDatabase.getDatabase();
      final batch = await database.batch();

      final sql =
          "INSERT INTO todo (title, description, finished) values ('${todo.title}', '${todo.description}', 0)";

      batch.execute(sql);

      await batch.commit();

      return Right(
        Success(
          message: 'Tarefa salva com sucesso!',
        ),
      );
    } catch (error) {
      print(error);

      return Left(Failure(message: 'Erro ao salvar tarefa!'));
    }
  }
}
