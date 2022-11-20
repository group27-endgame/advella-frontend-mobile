import 'package:advella/models/bids_service.dart';
import 'package:advella/models/service_category.dart';
import 'package:advella/models/service_image.dart';
import 'package:advella/models/user_model.dart';

class Service {

  final int serviceId;
  final String title;
  final String detail;
  final double moneyAmount;
  final int duration;
  final int postedDateTime;
  final int deadline;
  final String location;
  final int numberOfBids;
  final String serviceStatus;
  final ServiceCategory serviceCategory;
  final UserModel userPosted;
  //final List<ServiceImage> serviceImages;

  Service({
    required this.serviceId,
    required this.title,
    required this.detail,
    required this.moneyAmount,
    required this.duration,
    required this.postedDateTime,
    required this.deadline,
    required this.location,
    required this.numberOfBids,
    required this.serviceStatus,
    required this.serviceCategory,
    required this.userPosted,
    //required this.serviceImages
  });

  static Service fromJson(json) {
    return Service(
        serviceId: json['serviceId'],
        title: json['title'],
        detail: json['detail'],
        moneyAmount: json['moneyAmount'],
        duration: json['duration'],
        postedDateTime: json['postedDateTime'],
        deadline: json['deadline'],
        location: json['location'],
        numberOfBids: json['numberOfBids'],
        serviceStatus: json['serviceStatus'],
        serviceCategory: ServiceCategory.fromJson(json['serviceCategory']),
        userPosted: UserModel.fromJson(json['posted']),
        //serviceImages: json['serviceImages'].map((data) => ServiceImage.fromJson(data)).toList()
    );
  }

  static Map<String, dynamic> toJson(Service service) {
    Map<String, dynamic> jsonMap = {
      "serviceId": service.serviceId,
      "title": service.title,
      "detail": service.detail,
      "moneyAmount": service.moneyAmount,
      "duration": service.duration,
      "postedDateTime": service.postedDateTime,
      "deadline": service.deadline,
      "location": service.location,
      "numberOfBids": service.numberOfBids,
      "serviceStatus": service.serviceStatus,
      "serviceCategory": ServiceCategory.toJson(service.serviceCategory),
      "posted": UserModel.toJson(service.userPosted)
    };

    return jsonMap;
  }


}

class OldService
{
  String title;
  String location;
  String price;
  String duration;
  String dueDate;
  String category;
  String timeSincePosted;
  String description;
  String image;
  int numberOfBids;

  OldService({required this.title, required this.location, required this.price,
    required this.duration, required this.dueDate, required this.category,
    required this.timeSincePosted,required this.description,
    required this.image, required this.numberOfBids});
}