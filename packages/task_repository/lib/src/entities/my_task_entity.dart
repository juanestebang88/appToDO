import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/user_repository.dart';

class MyTaskEntity {
  String taskId;
  String nameTask;
  String descriptionTask;
  DateTime createDate;
  String userId;
  bool stateTask;

	MyTaskEntity({
		required this.taskId,
		required this.nameTask,
    required this.descriptionTask,
		required this.createDate,
		required this.userId,
    required this.stateTask
	});

	Map<String, Object?> toDocument() {
    return {
      'taskId': taskId,
      'nameTask': nameTask,
      'descriptionTask': descriptionTask,
      'createDate': createDate,
      'userId': userId,
      'stateTask': stateTask
    };
  }

	static MyTaskEntity fromDocument(Map<String, dynamic> doc) {
    return MyTaskEntity(
      taskId: doc['taskId'] as String,
			nameTask: doc['nameTask'] as String,
      descriptionTask: doc['descriptionTask'] as String,
      createDate: (doc['createDate'] as Timestamp).toDate(),
      userId: (doc['userId']) as String,
      stateTask: doc['stateTask'] as bool
    );
  }
	
	@override
	List<Object?> get props => [taskId, nameTask, descriptionTask, createDate, userId, stateTask];

	@override
  String toString() {
    return '''MyTaskEntity: {
      taskId: $taskId
      nameTask: $nameTask
      descriptionTask: $descriptionTask
      createDate: $createDate
      userId: $userId
      stateTask: $stateTask
    }''';
  }
}