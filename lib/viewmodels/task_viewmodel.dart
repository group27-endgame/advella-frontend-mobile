import 'package:advella/models/taskmodel.dart';
import 'package:advella/services/task_service.dart';
import 'package:flutter/cupertino.dart';

enum LoadingStatus
{
  Completed,
  Searching,
  Empty,
}

class SharedPreferencesService{
  getLoginDetails() {}
}

class TaskViewModel with ChangeNotifier{
  LoadingStatus loadingStatus = LoadingStatus.Empty;
  TaskService taskService = new TaskService();
  TaskModel? taskModel;
  UserModel? userModel;

  var tasks = <TaskModel>[];

  final _storage = new SharedPreferencesService();

  Future<void> getAllTasks(double? latitude, double? longitude) async
  {
    if(latitude == null || longitude == null) {
      loadingStatus = LoadingStatus.Searching;
      userModel = await _storage.getLoginDetails();
      this.tasks = (await taskService.getAllTasks(userModel!.access_token))!;
      //notifyListeners();

      if (this.tasks.isEmpty) {
        loadingStatus = LoadingStatus.Empty;
      }

      else {
        loadingStatus = LoadingStatus.Completed;
      }
      //notifyListeners();
    }
    else
      {
        loadingStatus = LoadingStatus.Searching;
        userModel = await _storage.getLoginDetails();
        this.tasks = (await taskService.getAllTaskBasedOnLocations(latitude, longitude, userModel!.access_token))!;
        //notifyListeners();

        if (this.tasks.isEmpty) {
          loadingStatus = LoadingStatus.Empty;
        }

        else {
          loadingStatus = LoadingStatus.Completed;
        }
        //notifyListeners();
      }
  }




}

class UserModel {
  String get access_token => 'null';
}