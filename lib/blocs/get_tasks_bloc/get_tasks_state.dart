part of 'get_tasks_bloc.dart';

sealed class GetTasksState extends Equatable {
  const GetTasksState();
  
  @override
  List<Object> get props => [];
}

final class GetTasksInitial extends GetTasksState {}

final class GetTasksFailure extends GetTasksState {}

final class GetTasksLoading extends GetTasksState {}

final class GetTasksSucces extends GetTasksState {
  final List<MyTaskModel> tasks;
  const GetTasksSucces(this.tasks);
}


