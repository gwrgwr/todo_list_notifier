class CategorieTask {
  final String amount;
  final String type;

  CategorieTask({required this.amount, required this.type});

  static List<CategorieTask> getCategories() {
    List<CategorieTask> categories = [
      CategorieTask(amount: "42 tasks", type: "Business"),
      CategorieTask(amount: "30 tasks", type: "Sport"),
      CategorieTask(amount: "13 tasks", type: "Personal"),
      CategorieTask(amount: "27 tasks", type: "Family"),
    ];

    return categories;
  }
}
