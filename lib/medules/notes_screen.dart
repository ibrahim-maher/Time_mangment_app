import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_app_2/shared/book/cubit.dart';
import 'package:gdsc_app_2/shared/book/state.dart';
import 'package:gdsc_app_2/shared/componants/note_item.dart';
class notes_screen extends StatelessWidget {
  const notes_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit,BookState>(
      listener: (context,state) {},
      builder: (context,state) {

        var notes = BookCubit.get(context).notes;

        return notesBuilder (
            notes: notes
        );
      } ,

    );
  }
}
