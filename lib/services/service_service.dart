import 'dart:convert';

import 'package:advella/models/bids_service.dart';
import 'package:advella/models/service.dart';
import 'package:advella/models/service_category.dart';
import 'package:advella/models/service_image.dart';
import 'package:advella/models/user_model.dart';
import 'package:http/http.dart';

class ServiceService {
  //base url
  final String url = "https://api.advella.popal.dev/api/services";

  Future<List<Service>?> getAllServices() async
  {
    try {
      var response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        var responseDetails = jsonDecode(response.body);

        print(responseDetails);

        //List<Service> services = responseDetails.map((data) => Service.fromJson(data)).toList();

        List<Service> services = [];

        for (var s in responseDetails) {
          print('heyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
          print(s);

          if(s['posted'] is int)
            {

            }

          else {
            Service service = Service(
              serviceId: s['serviceId'],
              title: s['title'],
              detail: s['detail'],
              moneyAmount: s['moneyAmount'],
              duration: s['duration'],
              postedDateTime: s['postedDateTime'],
              deadline: s['deadline'],
              location: s['location'],
              numberOfBids: s['numberOfBids'],
              serviceStatus: s['serviceStatus'],
              serviceCategory: ServiceCategory.fromJson(s['serviceCategory']),
              userPosted: UserModel.fromJson(s['posted']),
              //serviceImages: s['serviceImages'].map((data) => ServiceImage.fromJson(data)).toList()
            );

            services.add(service);
          }
        }

        print('service length');
        print(services.length);

        return services;
      }
      else {
        throw Exception('Response failed');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}