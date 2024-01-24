import 'package:task_repository/task_repository.dart';
abstract class TaskRepository{

  Future<MyTaskModel> createTask(MyTaskModel myTaskModel);

  Future<List<MyTaskModel>> getTask(String userId);

  Future<void> upTask(String tastId);

}