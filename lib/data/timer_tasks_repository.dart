import 'package:flutter/material.dart';
import 'package:timer_scan_app/data/timer_task.dart';

class TimerTasksRepository {
  get getTimerTasks {
    return <TimerTask>[
      const TimerTask(title: 'Task1', color: Colors.green),
      const TimerTask(title: 'Task2', color: Colors.deepOrange),
    ];
  }
}
