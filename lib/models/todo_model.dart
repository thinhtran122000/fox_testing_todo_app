class Todo {
  final String id;
  final String title;
  bool isFavorite =  false;
  Todo({required this.id, required this.title, this.isFavorite=false});
  @override
  String toString() {
    return '$id $title';
  }

  static List<Todo> todos = [
    Todo(id: '1', title: 'Todo 1'),
    Todo(id: '2', title: 'Todo 2'),
    Todo(id: '3', title: 'Todo 3'),
    Todo(id: '4', title: 'Todo 4'),
  ];
}
