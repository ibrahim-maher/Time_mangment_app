import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_app_2/shared/book/cubit.dart';
import 'package:gdsc_app_2/shared/book/state.dart';
import 'package:gdsc_app_2/shared/componants/task_items.dart';
class tasks_screen extends StatelessWidget {
  const tasks_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit,BookState>(
      listener: (context,state) {},
      builder: (context,state) {

        var tasks = BookCubit.get(context).tasks;

        return tasksBuilder (
            tasks: tasks
        );
      } ,

    );
  }
}
