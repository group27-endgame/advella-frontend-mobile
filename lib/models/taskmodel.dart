class TaskModel {

  String title;
  String details;
  int price;
  double locationLatitude;
  double locationLongitude;
  int timePosted;
  String dueDate;
  double estimatedTime;
  String status;

  TaskModel(
      { required this.title,
        required this.details,
        required this.price,
        required this.locationLatitude,
        required this.locationLongitude,
        required this.timePosted,
        required this.dueDate,
        required this.estimatedTime,
        required this.status});
}