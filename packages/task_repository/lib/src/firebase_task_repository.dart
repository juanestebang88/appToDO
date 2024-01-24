import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_repository/task_repository.dart';
import 'package:uuid/uuid.dart';

class FirebaseTaskRepository implements TaskRepository{

  final taskCollection = FirebaseFirestore. instance.collection ('tasks');

  @override
  Future<MyTaskModel> createTask(MyTaskModel myTaskModel) async{
    try {
      myTaskModel.taskId = const Uuid().v1();
      myTaskModel.createDate = DateTime.now();
      myTaskModel.stateTask = false;

      await taskCollection
        .doc(myTaskModel.taskId)
        .set(myTaskModel.toEntity().toDocument());

      return myTaskModel;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<MyTaskModel>> getTask(){
    try {
      return taskCollection
        .get()
        .then((value) => value.docs.map((e) => 
          MyTaskModel.fromEntity(MyTaskEntity.fromDocument(e.data()))
          ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;      
    }
  }
}

