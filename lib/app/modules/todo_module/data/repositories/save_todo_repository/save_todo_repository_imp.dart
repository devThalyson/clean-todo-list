import 'package:clean_todo_list/app/modules/todo_module/data/datasources/save_todo_datasource/save_todo_datasource.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/entities/todo_entity.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/repositories/save_todo_repository/save_todo_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';

class SaveTodoRepositoryImp implements SaveTodoRepository {
  final SaveTodoDatasource datasource;

  SaveTodoRepositoryImp(this.datasource);

  @override
  Future<Either<Failure, Success>> call(TodoEntity todo) async {
    return await datasource(todo);
  }
}
