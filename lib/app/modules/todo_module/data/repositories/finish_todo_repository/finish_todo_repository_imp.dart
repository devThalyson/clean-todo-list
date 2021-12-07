import 'package:clean_todo_list/app/modules/todo_module/data/datasources/finish_todo_datasource/finish_todo_datasource.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/entities/todo_entity.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/repositories/finish_todo_repository/finish_todo_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';

class FinishTodoRepositoryImp implements FinishTodoRepository {
  final FinishTodoDatasource datasource;

  FinishTodoRepositoryImp(this.datasource);

  @override
  Future<Either<Failure, Success>> call(TodoEntity todo) async {
    return await datasource(todo);
  }
}
