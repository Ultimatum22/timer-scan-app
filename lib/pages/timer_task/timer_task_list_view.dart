import 'package:flutter/material.dart';
import 'package:timer_scan_app/data/timer_task.dart';

class TimerTaskListView extends StatelessWidget {
  final List<TimerTask> timerTaskList;
  final Function(TimerTask timerTask, int index)? onTap;

  const TimerTaskListView({Key? key, required this.timerTaskList, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: timerTaskList.length,
      itemBuilder: (final _, final int index) {
        final TimerTask timerTask = timerTaskList.elementAt(index);
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
          // child: Text(timerTask.task)
          child: _buildListViewItem(timerTask, index),
        );
      },
    );
  }

  _buildListViewItem(final TimerTask timerTask, int index) => GestureDetector(
        onTap: () => onTap?.call(timerTask, index),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey, width: 0.5)),
          // child: Container(child: Text(timerTask.task)),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 26.0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        left: 8.0, top: 8.0, bottom: 8.0, right: 12.0),
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                        color: timerTask.color,
                        borderRadius: BorderRadius.circular(40.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(timerTask.title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold)),
                      const Text('Duration: 06:00:12',
                          style:
                              TextStyle(color: Colors.black, fontSize: 14.0)),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.navigate_next, color: timerTask.color)
                ],
              )),
        ),
      );
}
