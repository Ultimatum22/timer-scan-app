import 'package:flutter/material.dart';
import 'package:timer_scan_app/data/timer_task.dart';

class TimerTaskDetailPage extends StatelessWidget {
  const TimerTaskDetailPage(
      {Key? key, required TimerTask timerTask, required int index})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
        body: const Text('TimerTaskDetailPage'),
      );
}
