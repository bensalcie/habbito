class HabbitScheduleModel {
  final String? expectedCompletiondDate;
  final String? userComment;
  final bool? isCompleted;
  final int? id;

  HabbitScheduleModel(
      {required this.expectedCompletiondDate,
      required this.userComment,
      required this.isCompleted,
      this.id});
}
