import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_scan_app/cubits/timer_tasks/timer_tasks_cubit.dart';
import 'package:timer_scan_app/data/timer_task.dart';
import 'package:timer_scan_app/pages/timer_task/timer_task_detail_page.dart';
import 'package:timer_scan_app/pages/timer_task/timer_task_list_view.dart';

class TimerTaskListPage extends StatelessWidget {
  const TimerTaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TimerTask> timerTaskList =
        context.watch<TimerTasksCubit>().state.timerTasks;

    Future<Widget?> _navigateToTimerTaskPage(
            final TimerTask timerTask, final int index) =>
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(seconds: 1),
                pageBuilder: (final _, final __, final ___) =>
                    TimerTaskDetailPage(timerTask: timerTask, index: index)));

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: const Text('Timer tasks',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 3200,
                  fontWeight: FontWeight.bold)),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: <Widget>[
              TimerTaskListView(
                  timerTaskList: timerTaskList,
                  onTap: _navigateToTimerTaskPage),
            ])));
  }
}
