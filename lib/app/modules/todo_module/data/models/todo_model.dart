import 'package:clean_todo_list/app/modules/todo_module/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  final int? idModel;
  final String? titleModel;
  final String? descriptionModel;
  final int? finishedModel;

  TodoModel(
      {this.idModel,
      this.titleModel,
      this.descriptionModel,
      this.finishedModel})
      : super(
          description: descriptionModel,
          finished: finishedModel,
          id: idModel,
          title: titleModel,
        );

  static TodoModel fromMap(Map<String, dynamic> map) {
    return TodoModel(
      idModel: map['id'],
      titleModel: map['title'],
      descriptionModel: map['description'],
      finishedModel: map['finished'],
    );
  }
}
