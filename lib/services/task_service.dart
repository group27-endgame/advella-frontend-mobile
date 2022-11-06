import 'dart:convert';
import 'package:advella/models/taskmodel.dart';
import 'package:http/http.dart';

class TaskService
{
  final String url = "http://popal.cz:8080/api/";

  Future<List<TaskModel>?> getAllTasks(String access_token) async
  {
    try {
      Response response = await get(Uri.parse(url + "fh/task"), headers: {
        "Authorization": "Bearer $access_token"
      });

      if (response.statusCode == 200) {
        var taskDetails = jsonDecode(response.body);

        List<TaskModel> tasks = [];

        for (var t in taskDetails) {
          TaskModel taskModel = TaskModel(
              title: t['title'],
              details: t['details'],
              price: t['price'],
              locationLatitude: t['locationLatitude'],
              locationLongitude: t['locationLongitude'],
              timePosted: t['timePosted'],
              dueDate: t['dueDate'],
              estimatedTime: t['estimatedTime'],
              status: t['status']);
          tasks.add(taskModel);
        }
        return tasks;
      }
      else {
        throw Exception('Response failed');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  getAllTaskBasedOnLocations(double latitude, double longitude, String access_token) {}
}