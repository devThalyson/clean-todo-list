import 'package:clean_todo_list/app/modules/todo_module/data/datasources/cancel_finish_todo_datasource/cancel_finish_todo_datasource.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/entities/todo_entity.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:clean_todo_list/app/shared/services/local_database/loca_database.dart';
import 'package:dartz/dartz.dart';

class CancelFinishTodoDatasourceLocal implements CancelFinishTodoDatasource {
  @override
  Future<Either<Failure, Success>> call(TodoEntity todo) async {
    try {
      final database = await LocalDatabase.getDatabase();
      final batch = await database.batch();

      final sql = "UPDATE todo SET finished = 0 WHERE id = ${todo.id}";

      batch.execute(sql);

      await batch.commit();

      return Right(
        Success(message: 'Tarefa reaberta com sucesso!'),
      );
    } catch (error) {
      print(error);

      return Left(
        Failure(message: 'Erro ao reabrir tarefa!'),
      );
    }
  }
}
