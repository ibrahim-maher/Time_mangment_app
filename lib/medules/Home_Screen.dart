import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_app_2/shared/book/cubit.dart';
import 'package:gdsc_app_2/shared/book/state.dart';
import 'package:gdsc_app_2/shared/componants/form_field.dart';
import 'package:intl/intl.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookCubit()..createdatebase() ,
      child: BlocConsumer<BookCubit, BookState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = BookCubit.get(context);

          var scafflodkey = GlobalKey<ScaffoldState>();
          var formkey = GlobalKey<FormState>();

          var titlecontroller = TextEditingController();
          var timecontroller = TextEditingController();
          var datecontroller = TextEditingController();

          int  index= 2;
          switch(cubit.current_index) {
            case 3: {
              index= 0 ;
            }
            break;

            case 2: {
              index= 1 ;
            }
            break;

            default: {
              //statements;
            }
            break;
          }
          return DefaultTabController(
            initialIndex: cubit.current_index,
            length: 4,
            child: Scaffold(
              key: scafflodkey,
              appBar: AppBar(
                title: Text("FLutter book"),
                bottom: TabBar(
                    onTap: (index) {
                      cubit.changetabbar(index);
                    },
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.calendar_today,
                        ),
                        text: "appointments ",
                      ),
                      Tab(
                        icon: Icon(
                          Icons.contacts,
                        ),
                        text: "contacts ",
                      ),
                      Tab(
                        icon: Icon(
                          Icons.note_add,
                        ),
                        text: "notes ",
                      ),
                      Tab(
                        icon: Icon(
                          Icons.task,
                        ),
                        text: "tasks ",
                      ),
                    ]),
              ),
              body: cubit.Screens[cubit.current_index],
              floatingActionButton: Visibility(
                visible: cubit.current_index !=0 ? true :false,
                child: FloatingActionButton(
                    onPressed: () {
                    showModalBottomSheet(

                        context: context,
                        builder: (builder){
                          return   Container(
                                      padding: EdgeInsets.all(15),
                                      child: OverflowBox(
                                        maxHeight: 355,
                                        child: Form(
                                            key: formkey,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                defaultFormFeild(
                                                    autofocus:true,
                                                    controller: titlecontroller,
                                                    type: TextInputType.text,
                                                    validate: (value) {
                                                      if (value!.isEmpty) {
                                                        return " title must not be embty ";
                                                      }
                                                      return null;
                                                    },
                                                    label:cubit.Title[index],
                                                    prefix: Icons.title),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                defaultFormFeild(

                                                    controller: timecontroller,
                                                    type: TextInputType.datetime,
                                                    onTap: () {
                                                      if (index==2) {}
                                                      else {
                                                        showTimePicker(
                                                        context: context,
                                                        initialTime: TimeOfDay.now(),
                                                      ).then((value) {
                                                        timecontroller.text =
                                                            value!.format(context).toString();
                                                      });}


                                                    },
                                                    validate: (value) {
                                                      if (value!.isEmpty) {
                                                        return " time must not be embty ";
                                                      }
                                                      return null;
                                                    },
                                                    label: cubit.Time[index],
                                                    prefix: index==2? Icons.phone : Icons.watch_later_outlined),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Visibility(
                                                  visible: index ==2? false:true,
                                                  child: defaultFormFeild(
                                                      controller: datecontroller,
                                                      type: index==3 ? TextInputType.datetime :TextInputType.text ,
                                                      onTap: () {
                                                       if (index==0 )
                                                       {
                                                         showDatePicker(
                                                         context: context,
                                                         initialDate: DateTime.now(),
                                                         firstDate: DateTime.now(),
                                                         lastDate: DateTime(2050),
                                                       ).then((value) {
                                                         datecontroller.text =
                                                             DateFormat.yMMMd().format(value!);
                                                       });}

                                                          },
                                                      validate: (value) {
                                                        if (value!.isEmpty) {
                                                          return " date must not be embty ";
                                                        }
                                                        return null;
                                                      },
                                                      label: cubit.Date[index],
                                                      prefix: index==0?Icons.calendar_today : Icons.content_paste,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.blueAccent,
                                                    borderRadius: BorderRadius.circular(30)
                                                  ),
                                                  child: IconButton(
                                                    color: Colors.white,
                                                      onPressed: (){
                                                        if (formkey.currentState!.validate()) {
                                                          if(index==0)
                                                             { cubit.insertToDatabase_tasks(title: titlecontroller.text, date: datecontroller.text, time: timecontroller.text);}
                                                          else if (index==1)
                                                            {
                                                              cubit.insertToDatabase_notes(title:  titlecontroller.text, content:  datecontroller.text, time: timecontroller.text);
                                                            }
                                                          else if (index==2)
                                                          {
                                                            cubit.insertToDatabase_cont( name:  titlecontroller.text, number:  timecontroller.text,);
                                                          }
                                                          Navigator.pop(context);
                                                        }
                                                        },
                                                      icon: Icon(Icons.add)),
                                                )
                                              ],
                                            ),
                                    ),
                                      ),

                          ); });


                },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


}


