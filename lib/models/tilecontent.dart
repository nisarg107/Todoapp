class ToDo {
  String? id;
  String? tileText;
  bool isDone;

  ToDo({
    required this.id,
    required this.tileText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', tileText: 'Morning Excercise', isDone: true),
      ToDo(id: '02', tileText: 'Buy Groceries', isDone: true),
      ToDo(
        id: '03',
        tileText: 'Check Emails',
      ),
      ToDo(
        id: '04',
        tileText: 'Team Meeting',
      ),
      ToDo(
        id: '05',
        tileText: 'Work on mobile apps for 2 hour',
      ),
      ToDo(
        id: '06',
        tileText: 'Dinner with Jenny',
      ),
    ];
  }
}
