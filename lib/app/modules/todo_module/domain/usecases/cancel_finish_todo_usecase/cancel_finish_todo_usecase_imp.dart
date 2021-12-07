import 'package:clean_todo_list/app/modules/todo_module/domain/entities/todo_entity.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/repositories/cancel_finish_todo_repository/cancel_finish_todo_repository.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/cancel_finish_todo_usecase/cancel_finish_todo_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';

class CancelFinishTodoUsecaseImp implements CancelFinishTodoUsecase {
  final CancelFinishTodoRepository repository;

  CancelFinishTodoUsecaseImp(this.repository);

  @override
  Future<Either<Failure, Success>> call(TodoEntity todo) async {
    return await repository(todo);
  }
}
