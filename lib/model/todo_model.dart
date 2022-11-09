
class ToDoModel {
  String? id;
  String? todoText;
  bool isDone;

  ToDoModel({required this.id, required this.todoText, this.isDone = false});

  static List<ToDoModel> todoList() {
    return [
      ToDoModel(id: '01', todoText: 'Morning Excercise', isDone: true),
      ToDoModel(id: '02', todoText: 'Buy Groceries', isDone: true),
      ToDoModel(id: '03', todoText: 'Check Emails'),
      ToDoModel(id: '84', todoText: 'Team Meeting'),
      ToDoModel(id: '05', todoText: 'Work on mobile apps for 2 hour'),
      ToDoModel(id: '86', todoText: 'Dinner with Jenny'),
    ];
  }

}
