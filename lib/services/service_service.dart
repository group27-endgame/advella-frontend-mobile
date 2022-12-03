import 'dart:convert';
import 'dart:io';

import 'package:advella/models/bids_service.dart';
import 'package:advella/models/service.dart';
import 'package:advella/models/service_category.dart';
import 'package:advella/models/service_image.dart';
import 'package:advella/models/user_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

class ServiceService {
  //base url
  final String url = "https://api.advella.popal.dev/api/services";

  Future<List<Service>?> getAllServices() async
  {
    try {
      var response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        var responseDetails = jsonDecode(response.body);

        //print('[SERVICE]: $responseDetails');

        //List<Service> services = responseDetails.map((data) => Service.fromJson(data)).toList();

        List<Service> services = [];

        for (var s in responseDetails) {

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

            if(s['serviceImages'].length > 0) service.serviceImages = ServiceImage.fromJson(s['serviceImages'][0]);


            //print(service.serviceId);

            services.add(service);
          }
        }

        //print('service length');
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

  Future postService(String? token, var service, File image) async
  {
    print('[FUCKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK] ${jsonEncode(service)}');
    var formData = dio.FormData.fromMap({
      'newService': await dio.MultipartFile.fromString(jsonEncode(service), contentType: MediaType.parse("application/json")),
      'image': await dio.MultipartFile.fromFile(image.path, filename: image.path.split("/").last)
    });

    var response = await dio.Dio().post('$url/new', data: formData, options: dio.Options(headers:{"Authorization": "Bearer $token", "Content-Type": "multipart/form-data"}));
    //print(response.statusCode);
    // try {
    //   await post(Uri.parse(url), headers: {
    //     "Authorization": "Bearer $token", "Content-Type": "application/json"
    //   }, body: product);//Product.toJson(product));
    // }
    // catch(e) {
    //   print(e.toString());
    // }
  }
  
  Future bidService(String? access_token, int serviceId, int moneyAmount) async
  {
    try {
      await post(Uri.parse(
          "https://api.advella.popal.dev/api/users/bid/service/$serviceId?amount=$moneyAmount"),
          headers: {
            "Authorization": "Bearer $access_token",
            "Content-Type": "application/json"
          });
    } catch (e) {
      print(e.toString());
    }
  }
}