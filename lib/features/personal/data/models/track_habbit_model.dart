class TrackHabbitModel {
  final String? startDate;
  final String? endDate;
  final int? daysCompleted;
  final int? habbitId;
  final int? id;

  TrackHabbitModel(
      {required this.startDate,
      required this.endDate,
      required this.daysCompleted,
      required this.habbitId,
      this.id});
}
