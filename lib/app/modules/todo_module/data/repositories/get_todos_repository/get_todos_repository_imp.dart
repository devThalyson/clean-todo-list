import 'package:clean_todo_list/app/modules/todo_module/data/datasources/get_todos_datasource/get_todos_datasource.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/repositories/get_todos_repository/get_todos_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';

class GetTodosRepositoryImp implements GetTodosRepository {
  final GetTodosDatasource datasource;

  GetTodosRepositoryImp(this.datasource);

  @override
  Future<Either<Failure, Success>> call() async {
    return await datasource();
  }
}
