import 'package:flutter/material.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:gdsc_app_2/shared/book/cubit.dart';
import 'package:gdsc_app_2/shared/book/cubit.dart';
Widget buildTaksItem ( Map model, BuildContext context , ) => Dismissible(

  child:   Padding(

    padding: const EdgeInsets.all(20.0),
    child: CheckboxListTile(
      secondary:Text('${model["title"]}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      selected:model["status"] == 0 ? true : false,
      subtitle:Text('${model["date"]}'),
      title:  Text('${model["time"]}'),
      value: model["status"] == 0 ? true : false,
      onChanged: (bool? value) {

        print( model["status"]);
        print(BookCubit.get(context).valueofcheekboxinitemtaskbuilder);
        if(model["status"]== 0) {
          BookCubit.get(context).ChangeCheekboxstate(isShow: true);
          BookCubit.get(context).updatedatabase_tasks( 1 , model['id']);
        }
        else
          {
            BookCubit.get(context).updatedatabase_tasks( 0, model['id']);
            BookCubit.get(context).ChangeCheekboxstate(isShow: false);
          }
      },

    ),

  ),
  key: Key(model['id'].toString()),
  onDismissed: (direction)
  {
    BookCubit.get(context).deletedatabase_fromtasks(model['id']);
  },

);

Widget tasksBuilder({
  required List tasks
})=>BuildCondition(
  condition: tasks.length > 0,
  builder: (context)=>  ListView.separated(
      itemBuilder: (context,index)=>buildTaksItem(tasks[index],context,),
      separatorBuilder: (context,index) =>Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20,
        ),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],
        ),
      ) ,
      itemCount: tasks.length),
  fallback:(context)=>  Center(child: Column (
    mainAxisAlignment: MainAxisAlignment.center,

    children: [
      Icon( Icons.menu,
        size: 50,
        color: Colors.grey,),
      Text ( " No Tasks Yet , Please Add Some Tasks",
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey
        ),)
    ],
  ),
  ),
);