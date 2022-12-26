part of 'timer_tasks_cubit.dart';

@immutable
class TimerTasksState extends Equatable {
  final List<TimerTask> timerTasks;

  const TimerTasksState({required this.timerTasks});

  const TimerTasksState.initial(final List<TimerTask> timerTasks)
      : this(timerTasks: timerTasks);

  @override
  List<Object?> get props => <Object>[timerTasks];

  TimerTasksState copyWith({List<TimerTask>? timerTasks}) {
    return TimerTasksState(timerTasks: timerTasks ?? this.timerTasks);
  }
}
