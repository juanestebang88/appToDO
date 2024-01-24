import 'package:user_repository/user_repository.dart';

import '../entities/entities.dart';

class MyTaskModel{
  String taskId;
  String nameTask;
  DateTime createDate;
  MyUserModel myUserModel;
  bool stateTask;

	MyTaskModel({
		required this.taskId,
		required this.nameTask,
		required this.createDate,
		required this.myUserModel,
    required this.stateTask
	});

	/// Empty user which represents an unauthenticated user.
  static final empty = MyTaskModel(
		taskId: '', 
		nameTask: '',
		createDate: DateTime.now(), 
		myUserModel: MyUserModel.empty,
    stateTask: false
	);

	/// Modify MyUser parameters
	MyTaskModel copyWith({
    String? taskId,
    String? nameTask,
    DateTime? createDate,
    MyUserModel? myUserModel,
    bool? stateTask,
  }) {
    return MyTaskModel(
      taskId: taskId ?? this.taskId,
      nameTask: nameTask ?? this.nameTask,
      createDate: createDate ?? this.createDate,
      myUserModel: myUserModel ?? this.myUserModel,
      stateTask: stateTask ?? this.stateTask
    );
  }

	/// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == MyTaskModel.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != MyTaskModel.empty;

	MyTaskEntity toEntity() {
    return MyTaskEntity(
      taskId: taskId,
      nameTask: nameTask,
      createDate: createDate,
      myUserModel: myUserModel,
      stateTask: stateTask
    );
  }

	static MyTaskModel fromEntity(MyTaskEntity entity) {
    return MyTaskModel(
      taskId: entity.taskId,
      nameTask: entity.nameTask,
      createDate: entity.createDate,
      myUserModel: entity.myUserModel,
      stateTask: entity.stateTask
    );
  }

	@override
  String toString() {
    return '''MyTaskModel: {
      taskId: $taskId
      nameTask: $nameTask
      createDate: $createDate
      myUserModel: $myUserModel
      stateTask: $stateTask
    }''';
  }
	
}