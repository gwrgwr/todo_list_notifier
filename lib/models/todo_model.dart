class TodoModel {
  final String title;
  bool completed;
  final String hoursSpent;
  final String hoursRemaining;

  TodoModel({
    required this.title,
    required this.completed,
    required this.hoursSpent,
    required this.hoursRemaining,
  });

  static TodoModel stub() => TodoModel(
        title: 'test',
        completed: true,
        hoursSpent: "10hrs",
        hoursRemaining: "2hrs",
      );
}
