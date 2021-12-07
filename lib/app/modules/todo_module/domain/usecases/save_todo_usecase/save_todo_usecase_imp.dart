import 'package:clean_todo_list/app/modules/todo_module/domain/entities/todo_entity.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/repositories/save_todo_repository/save_todo_repository.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/save_todo_usecase/save_todo_usecase.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';

class SaveTodoUsecaseImp implements SaveTodoUsecase {
  final SaveTodoRepository repository;

  SaveTodoUsecaseImp(this.repository);

  @override
  Future<Either<Failure, Success>> call(TodoEntity todo) async {
    return await repository(todo);
  }
}
