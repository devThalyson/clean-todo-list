import 'package:clean_todo_list/app/modules/todo_module/domain/repositories/get_todos_repository/get_todos_repository.dart';
import 'package:clean_todo_list/app/modules/todo_module/domain/usecases/get_todos_usecase/get_todos_usecase.dart';
import 'package:clean_todo_list/app/shared/core/responses/success/success.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo_list/app/shared/core/responses/failure/failure.dart';

class GetTodosUsecaseImp implements GetTodosUsecase {
  final GetTodosRepository repository;

  GetTodosUsecaseImp(this.repository);

  @override
  Future<Either<Failure, Success>> call() async {
    return await repository();
  }
}
