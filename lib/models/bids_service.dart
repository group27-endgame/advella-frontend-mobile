import 'package:advella/models/user_model.dart';

class BidsService
{
  final int id;
  final UserModel user;
  final int bidValue;

  BidsService({required this.id, required this.user, required this.bidValue});

  static BidsService fromJson(json)
  {
    return BidsService(
      id: json['id'],
      user: UserModel.fromJson(json['serviceBidder']),
      bidValue: json['amount']
    );
  }

  static Map<String, dynamic> toJson(BidsService bidsService)
  {
    Map<String, dynamic> jsonMap = {
      "id": bidsService.id,
      "serviceBidder": UserModel.toJson(bidsService.user),
      "amount": bidsService.bidValue
    };
    return jsonMap;
  }

}