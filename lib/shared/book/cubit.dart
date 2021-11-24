
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_app_2/medules/appointments_screen.dart';
import 'package:gdsc_app_2/medules/contacts_screen.dart';
import 'package:gdsc_app_2/medules/notes_screen.dart';
import 'package:gdsc_app_2/medules/tasks_screen.dart';
import 'package:sqflite/sqflite.dart';

import 'state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookState().init());

  static BookCubit get( context) =>BlocProvider.of(context);

  int current_index = 0 ;

  List<Tab> Tabbar=[
    Tab(icon: Icon(Icons.calendar_today,),text: "calender ",),
    Tab(icon: Icon(Icons.contacts,),text: "contacts ",),
    Tab(icon: Icon(Icons.notes,),text: "notes ",),
    Tab(icon: Icon(Icons.task,),text: "tasks ",),
  ];


  List<Widget> Screens = [
    Calender_screen(),
    contacts_screen(),
    notes_screen(),
    tasks_screen(),
  ];

  List<String> Title = [
    "Task Title",
    "Note title",
    "Contant name",

  ];

  List<String> Time = [
    "Task time",
    "Note time",
    "contact number",

  ];
  List<String> Date = [
    "Task date",
    "Note content",
    "",

  ];

  void changetabbar (int index ){
    current_index=index;
    emit(BookTabBarState());
  }


  bool valueofcheekboxinitemtaskbuilder = false;


  void ChangeCheekboxstate ({
    required bool isShow,

  })
  {
    valueofcheekboxinitemtaskbuilder=isShow;
    emit(BookAppChangeCheekboxState ()
    );
  }
  late Database database;

  List tasks = [];
  List notes = [];
  List contacts = [];

  void createdatebase()  {
    openDatabase(
      'demo.db',
      version: 1,
      onCreate: (Database db, int version) async {
        print('Database created');
        await db.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, type TEXT,status INTEGER)');
        await db.execute(
                  'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, time TEXT,content TEXT)');
        await db.execute(
                  'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, number int');

      },
      onOpen: (database) {
        getDataFromDatabase_tasks(database);
        print('Database opened');
      },
    ).then((value)
    {
      database=value;
      emit(AppCreateDataBaseState());
    });
  }

  insertToDatabase_tasks({
    required String title,
    required String date,
    required String time,
  }) async {

    database.transaction((txn) {
      txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status , type) VALUES("$title", "$date", "$time","1", "tasks")')
          .then((value) {

        print('$value inserted in tasks successfully');
        emit(AppInsertDataBase_tasks_State());
        getDataFromDatabase_tasks(database);

      }).catchError((error) {

        print('Error when Inserting New Record ${error.toString()}');

      });
      return Future<Null>(() {});
    });
  }

  void getDataFromDatabase_tasks(database) {

    tasks=[];

    emit(GetDataBaseLoadingState());

    database.rawQuery("select *from tasks ").then((value) {
      value.forEach((elemnt) {
        tasks.add(elemnt);
        print (tasks);
      });
    });

    emit(BookAppGetDataBaseState_tasks());
  }

  void updatedatabase_tasks (
      int status,
      int  id,
      ) {
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        [ "$status" , id ])
        .then((value)
    {
      getDataFromDatabase_tasks(database);
      emit(AppUpdateDataBaseState());
    });
    print('updated: ');

  }
  void deletedatabase_fromtasks (
      int  id,
      ) {
    database
        .rawDelete('DELETE FROM tasks WHERE id = ?', [id])

        .then((value)
    {
      getDataFromDatabase_tasks(database);
      emit(AppDeleteDataBaseState_tasks());
    });
    print('deleted: ');

  }


  insertToDatabase_notes({
    required String title,
    required String content,
    required String time,
  }) async {

    database.transaction((txn) {
      txn.rawInsert(
          'INSERT INTO notes(title, time, content) VALUES("$title", "$time", "$content")')
          .then((value) {

        print('$value inserted in notes successfully');
        emit(AppInsertDataBase_notes_State());
        getDataFromDatabase_notes(database);

      }).catchError((error) {

        print('Error when Inserting New Record ${error.toString()}');

      });
      return Future<Null>(() {});
    });
  }

  void getDataFromDatabase_notes(database) {

    notes=[];

    emit(GetDataBaseLoadingState());

    database.rawQuery("select *from notes ").then((value) {
      value.forEach((elemnt) {
        notes.add(elemnt);
        print (notes);
      });
    });

    emit(BookAppGetDataBaseState_notes());
  }


  void deletedatabase_fromnotes (
      int  id,
      ) {
    database
        .rawDelete('DELETE FROM notes WHERE id = ?', [id])

        .then((value)
    {
      getDataFromDatabase_notes(database);
      emit(AppDeleteDataBaseState_notes());
    });
    print('deleted: ');

  }
  insertToDatabase_cont({
    required String number,
    required String name,
  }) async {

    database.transaction((txn) {
      txn.rawInsert(
          'INSERT INTO contacts(name, number) VALUES("$name", "$number")')
          .then((value) {

        print('$value inserted in tasks contacts');
        emit(AppInsertDataBase_contacts_State());
        getDataFromDatabase_cont(database);

      }).catchError((error) {

        print('Error when Inserting New Record ${error.toString()}');

      });
      return Future<Null>(() {});
    });
  }

  void getDataFromDatabase_cont(database) {

    contacts=[];

    emit(GetDataBaseLoadingState());

    database.rawQuery("select *from contacts ").then((value) {
      value.forEach((elemnt) {
        contacts.add(elemnt);
        print (contacts);
      });
    });

    emit(BookAppGetDataBaseState_contacts());
  }


  void deletedatabase_cont (
      int  id,
      ) {
    database
        .rawDelete('DELETE FROM contacts WHERE id = ?', [id])

        .then((value)
    {
      getDataFromDatabase_cont(database);
      emit(AppDeleteDataBaseState_contacts());
    });
    print('deleted: ');

  }


}

