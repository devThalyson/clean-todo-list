import 'package:clean_todo_list/app/modules/todo_module/domain/entities/todo_entity.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/repositories/delete_todo_repository/delete_todo_repository.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/delete_todo_usecase/delete_todo_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';

class DeleteTodoUsecaseImp implements DeleteTodoUsecase {
  final DeleteTodoRepository repository;

  DeleteTodoUsecaseImp(this.repository);

  @override
  Future<Either<Failure, Success>> call(TodoEntity todo) async {
    return await repository(todo);
  }
}
