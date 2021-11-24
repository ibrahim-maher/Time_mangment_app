import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_app_2/shared/book/cubit.dart';
import 'package:gdsc_app_2/shared/book/state.dart';
import 'package:gdsc_app_2/shared/componants/contact_item.dart';
class contacts_screen extends StatelessWidget {
  const contacts_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit,BookState>(
      listener: (context,state) {},
      builder: (context,state) {

        var contacts = BookCubit.get(context).contacts;

        return contactBuilder (
            contacts: contacts
        );
      } ,

    );
  }
}
