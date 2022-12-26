import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_scan_app/cubits/timer_tasks/timer_tasks_cubit.dart';
import 'package:timer_scan_app/data/timer_tasks_repository.dart';
import 'package:timer_scan_app/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      RepositoryProvider<TimerTasksRepository>(
        create: (_) => TimerTasksRepository(),
        child: BlocProvider<TimerTasksCubit>(
          create: (final BuildContext context) => TimerTasksCubit(
              timerTasksRepository: context.read<TimerTasksRepository>()),
          child: const MaterialApp(home: HomePage()),
        ),
      );
}
