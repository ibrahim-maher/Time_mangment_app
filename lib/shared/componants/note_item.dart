import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_app_2/shared/book/cubit.dart';
Widget notesBuilder({
  required List notes
})=>BuildCondition(
  condition: notes.length > 0,
  builder: (context)=>  ListView.separated(
      itemBuilder: (context,index)=>buildNotesItem(notes[index],context,),
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
      itemCount: notes.length),
  fallback:(context)=>  Center(child: Column (
    mainAxisAlignment: MainAxisAlignment.center,

    children: [
      Icon( Icons.menu,
        size: 50,
        color: Colors.grey,),
      Text ( " No notes Yet , Please Add Some notes",
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey
        ),)
    ],
  ),
  ),
);

Widget buildNotesItem ( Map model, BuildContext context , ) => Dismissible(

  child:   Padding(

    padding: const EdgeInsets.all(20.0),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${model["title"]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("${model["time"]}"),
            ],
          ),
          SizedBox(height: 5,),
          Container(alignment: Alignment.centerLeft,
              child: Text("${model["content"]}",overflow: TextOverflow.ellipsis,)),
        ],
      )
    )

  ),
  key: Key(model['id'].toString()),
  onDismissed: (direction)
  {
    BookCubit.get(context).deletedatabase_fromnotes(model['id']);
  },

);
