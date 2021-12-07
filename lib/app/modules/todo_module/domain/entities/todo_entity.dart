abstract class TodoEntity {
  final int? id;
  final String? title;
  final String? description;
  final int? finished;
  TodoEntity({
    this.id,
    this.title,
    this.description,
    this.finished,
  });
}
