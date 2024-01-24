import 'package:user_repository/user_repository.dart';

import '../entities/entities.dart';

class MyTaskModel{
  String taskId;
  String nameTask;
  String descriptionTask;
  DateTime createDate;
  String userId;
  bool stateTask;

	MyTaskModel({
		required this.taskId,
		required this.nameTask,
    required this.descriptionTask,
		required this.createDate,
		required this.userId,
    required this.stateTask
	});

	/// Empty user which represents an unauthenticated user.
  static final empty = MyTaskModel(
		taskId: '', 
		nameTask: '',
    descriptionTask: '',
		createDate: DateTime.now(), 
		userId: '',
    stateTask: false
	);

	/// Modify MyUser parameters
	MyTaskModel copyWith({
    String? taskId,
    String? nameTask,
    String? descriptionTask,
    DateTime? createDate,
    String? userId,
    bool? stateTask,
  }) {
    return MyTaskModel(
      taskId: taskId ?? this.taskId,
      nameTask: nameTask ?? this.nameTask,
      descriptionTask: descriptionTask ?? this.descriptionTask,
      createDate: createDate ?? this.createDate,
      userId: userId ?? this.userId,
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
      descriptionTask: descriptionTask,
      createDate: createDate,
      userId: userId,
      stateTask: stateTask
    );
  }

	static MyTaskModel fromEntity(MyTaskEntity entity) {
    return MyTaskModel(
      taskId: entity.taskId,
      nameTask: entity.nameTask,
      descriptionTask: entity.descriptionTask,
      createDate: entity.createDate,
      userId: entity.userId,
      stateTask: entity.stateTask
    );
  }

	@override
  String toString() {
    return '''MyTaskModel: {
      taskId: $taskId
      nameTask: $nameTask
      descriptionTask: $descriptionTask
      createDate: $createDate
      userId: $userId
      stateTask: $stateTask
    }''';
  }
	
}