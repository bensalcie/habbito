class HabbitModel {
  final String title;
  final String description;
  final String? slug;
  final String? localimage;
  final bool shouldimprove;
  final int? id;

  HabbitModel(
      {this.id,
      required this.title,
      required this.description,
      required this.slug,
      required this.localimage,
      required this.shouldimprove});
}
