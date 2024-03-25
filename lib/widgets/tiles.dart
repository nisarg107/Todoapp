import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/models/tilecontent.dart';

class Tiles extends StatelessWidget {
  final ToDo tile;
  final onToDochanged;
  final onDeleteItem;
  const Tiles({super.key,required this.tile,required this.onDeleteItem,required this.onToDochanged});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20,top: 20),
      child: ListTile(
        onTap: () {
          onToDochanged(tile);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(tile.isDone?Icons.check_box:Icons.check_box_outline_blank_outlined,color: tdBlack,),
        title: Text(tile.tileText!,style: TextStyle(
          fontSize: 16,
          color: tdBlack,
          decoration: tile.isDone?TextDecoration.lineThrough:null,
          ),
        ),  
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 6),
            height: MediaQuery.of(context).size.height*0.125,
            width: MediaQuery.of(context).size.width * 0.125,
            decoration: BoxDecoration(
              color: tdRed,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: IconButton(icon: Icon(Icons.delete,size: 20,),
              onPressed: () {
                onDeleteItem(tile.id);
              },
              ),
            )
            ),
      ),
    );
  }
}