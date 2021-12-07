import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:dartz/dartz.dart';

abstract class GetTodosRepository {
  Future<Either<Failure, Success>> call();
}
