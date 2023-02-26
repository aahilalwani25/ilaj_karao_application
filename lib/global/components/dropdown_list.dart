import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DropdownList{

  String? selectedOption;

  final void Function() onTap;
  DatabaseReference databaseReference;
  bool toggle;

  DropdownList({required this.onTap, required DatabaseReference this.databaseReference, required this.toggle});

  Widget getDropdownLists() {
    if (toggle) {
      return StreamBuilder(
          stream: databaseReference.onValue,
          builder: (builder, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator(
                strokeWidth: 2,
              );
            }
            Map<dynamic, dynamic> hos = snapshot.data!.snapshot.value
                as Map<dynamic, dynamic>; //take all values of key

            List<dynamic> lists = hos.values.toList();

            return ListView.builder(
                itemCount: snapshot.data!.snapshot.children.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    style: ListTileStyle.list,
                    title: InkWell(
                      onTap: (){
                        selectedOption = lists[index]['name'].toString();
                      },
                      child: Text(lists[index]['name'])),
                  );
                });
          });
    }
    return Container();
  }
}