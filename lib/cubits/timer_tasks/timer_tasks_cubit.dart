import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:timer_scan_app/data/timer_task.dart';
import 'package:timer_scan_app/data/timer_tasks_repository.dart';

part 'timer_tasks_state.dart';

class TimerTasksCubit extends Cubit<TimerTasksState> {
  final TimerTasksRepository timerTasksRepository;

  TimerTasksCubit({required this.timerTasksRepository})
      : super(TimerTasksState.initial(timerTasksRepository.getTimerTasks));

  get getTimerTaskList => state.timerTasks.toList();
}
