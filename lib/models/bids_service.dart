import 'package:advella/models/user_model.dart';

class BidsService
{
  final int bidValue;

  BidsService({required this.bidValue});

  static BidsService fromJson(json)
  {
    return BidsService(
      bidValue: json['amount']
    );
  }

  static Map<String, dynamic> toJson(BidsService bidsService)
  {
    Map<String, dynamic> jsonMap = {
      "amount": bidsService.bidValue
    };
    return jsonMap;
  }

}