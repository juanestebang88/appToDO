import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/user_repository.dart';

class MyTaskEntity {
  String taskId;
  String nameTask;
  DateTime createDate;
  MyUserModel myUserModel;
  bool stateTask;

	MyTaskEntity({
		required this.taskId,
		required this.nameTask,
		required this.createDate,
		required this.myUserModel,
    required this.stateTask
	});

	Map<String, Object?> toDocument() {
    return {
      'taskId': taskId,
      'nameTask': nameTask,
      'createDate': createDate,
      'myUserModel': myUserModel.toEntity().toDocument(),
      'stateTask': stateTask
    };
  }

	static MyTaskEntity fromDocument(Map<String, dynamic> doc) {
    return MyTaskEntity(
      taskId: doc['taskId'] as String,
			nameTask: doc['nameTask'] as String,
      createDate: (doc['createDate'] as Timestamp).toDate(),
      myUserModel: MyUserModel.fromEntity(MyUserEntity.fromDocument(doc['myUserModel'])),
      stateTask: doc['stateTask'] as bool
    );
  }
	
	@override
	List<Object?> get props => [taskId, nameTask, createDate, myUserModel, stateTask];

	@override
  String toString() {
    return '''MyTaskEntity: {
      taskId: $taskId
      nameTask: $nameTask
      createDate: $createDate
      myUserModel: $myUserModel
      stateTask: $stateTask
    }''';
  }
}