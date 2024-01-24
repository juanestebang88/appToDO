part of 'get_tasks_bloc.dart';

sealed class GetTasksEvent extends Equatable {
  const GetTasksEvent();

  @override
  List<Object> get props => [];
}

class GetTasks extends GetTasksEvent {
    final String myUserId;

  const GetTasks({required this.myUserId});
}
