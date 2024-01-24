import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_repository/task_repository.dart';

part 'update_task_event.dart';
part 'update_task_state.dart';

class UpdateTaskBloc extends Bloc<UpdateTaskEvent, UpdateTaskState> {
  final TaskRepository _taskRepository;
  
  UpdateTaskBloc({
    required TaskRepository taskRepository
  }) : _taskRepository = taskRepository,
    super(UpdateTaskInitial()) {
    on<UpdateTask>((event, emit) async{
        emit(UpdateTaskLoading());
      try {
        await _taskRepository.upTask(event.myTaskModel.taskId);
        emit(UpdateTaskSuccess());
      } catch (e) {
        emit(UpdateTaskFailure());
      }
    });
  }
}
