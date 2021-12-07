import 'package:clean_todo_list/app/modules/todo_module/data/datasources/finish_todo_datasource/finish_todo_datasource.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:clean_todo_list/app/shared/services/local_database/loca_database.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/entities/todo_entity.dart';

class FinishTodoDatasourceLocal implements FinishTodoDatasource {
  @override
  Future<Either<Failure, Success>> call(TodoEntity todo) async {
    try {
      final database = await LocalDatabase.getDatabase();
      final batch = await database.batch();

      final sql = "UPDATE todo SET finished = 1 WHERE id = ${todo.id}";

      batch.execute(sql);

      await batch.commit();

      return Right(
        Success(message: 'Tarefa finalizada com sucesso!'),
      );
    } catch (error) {
      print(error);

      return Left(
        Failure(message: 'Erro ao finalizar tarefa!'),
      );
    }
  }
}
