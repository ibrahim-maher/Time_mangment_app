import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_app_2/shared/book/cubit.dart';
Widget contactBuilder({
  required List contacts
})=>BuildCondition(
  condition: contacts.length > 0,
  builder: (context)=>  ListView.separated(
      itemBuilder: (context,index)=>buildcontactsItem(contacts[index],context,),
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
      itemCount: contacts.length),
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

Widget buildcontactsItem ( Map model, BuildContext context , ) => Dismissible(

  child:   Padding(

      padding: const EdgeInsets.all(20.0),
      child: Container(
          child: Row(
           children: [
             CircleAvatar(
                 backgroundColor:Colors.blueAccent,
               child: Icon(Icons.phone),
             ),
             SizedBox(width: 20,),
             Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("${model["name"]}",style: TextStyle(fontSize: 20),),
               SizedBox(height: 10,),
               Text("${model["number"]}",),
             ],
           ),],
          )
      )

  ),
  key: Key(model['id'].toString()),
  onDismissed: (direction)
  {
    BookCubit.get(context).deletedatabase_fromnotes(model['id']);
  },

);
