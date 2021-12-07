import 'package:clean_todo_list/app/modules/todo_module/domain/entities/todo_entity.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:dartz/dartz.dart';

abstract class CancelFinishTodoRepository {
  Future<Either<Failure, Success>> call(TodoEntity todo);
}
