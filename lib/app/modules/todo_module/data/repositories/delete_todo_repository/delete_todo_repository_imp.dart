import 'package:clean_todo_list/app/modules/todo_module/data/datasources/delete_todo_datasource/delete_todo_datasource.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/entities/todo_entity.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/repositories/delete_todo_repository/delete_todo_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';

class DeleteTodoRepositoryImp implements DeleteTodoRepository {
  final DeleteTodoDatasource datasource;

  DeleteTodoRepositoryImp(this.datasource);

  @override
  Future<Either<Failure, Success>> call(TodoEntity todo) async {
    return await datasource(todo);
  }
}
