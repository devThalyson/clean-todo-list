import 'package:clean_todo_list/app/modules/todo_module/domain/entities/todo_entity.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/repositories/finish_todo_repository/finish_todo_repository.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/finish_todo_usecase/finish_todo_usecase.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';

class FinishTodoUsecaseImp implements FinishTodoUsecase {
  final FinishTodoRepository repository;

  FinishTodoUsecaseImp(this.repository);

  @override
  Future<Either<Failure, Success>> call(TodoEntity todo) async {
    return await repository(todo);
  }
}
