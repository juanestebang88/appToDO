part of 'update_task_bloc.dart';

sealed class UpdateTaskEvent extends Equatable {
  const UpdateTaskEvent();

  @override
  List<Object> get props => [];
}

class UpdateTask extends UpdateTaskEvent {
  final MyTaskModel myTaskModel;
  const UpdateTask(this.myTaskModel);
}
