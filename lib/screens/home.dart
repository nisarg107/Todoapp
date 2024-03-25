import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/models/tilecontent.dart';
import 'package:todoapp/widgets/tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final tileList = ToDo.todoList();
  List<ToDo> searchtodo = [];
  final todocontroller = TextEditingController();
  @override
  void initState() {
    searchtodo = tileList;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: buildappbar(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  searchbar(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 15,right: 25),
                          height: 70,
                          child: Text(
                            "ALL EVENTS",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                        for (ToDo i in searchtodo)
                          Tiles(
                            tile: i,
                            onToDochanged: handlechanges,
                            onDeleteItem: deleteitem,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            todoadd()
          ],
        ));
  }

  void handlechanges(ToDo tile) {
    setState(() {
      tile.isDone = !tile.isDone;
    });
  }

  void deleteitem(String id) {
    setState(() {
      tileList.removeWhere((item) => item.id == id);
    });
  }

  void todoitem(String tile) {
    setState(() {
      tileList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          tileText: tile));
    });
    todocontroller.clear();
  }

  void runfilter(String enterkeyword) {
    List<ToDo> result = [];
    if (enterkeyword.isEmpty) {
      result = tileList;
    } else {
      result = tileList
          .where((item) =>
              item.tileText!.toLowerCase().contains(enterkeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      searchtodo = result;
    });
  }

//addtile
  Align todoadd() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: tdGrey,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: todocontroller,
              decoration: InputDecoration(
                hintText: "Add Events",
                border: InputBorder.none,
              ),
            ),
          )),
          Container(
            margin: EdgeInsets.only(
              bottom: 20,
              right: 20,
            ),
            child: ElevatedButton(
                onPressed: () {
                  todoitem(todocontroller.text);
                },
                style: ElevatedButton.styleFrom(
                  primary: tdBlue,
                  minimumSize: Size(60, 60),
                  elevation: 10,
                ),
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 40),
                )),
          )
        ],
      ),
    );
  }

  //searchbar
  Container searchbar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => runfilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

//appbar
  AppBar buildappbar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network("https://static.vecteezy.com/system/resources/thumbnails/025/284/015/small/close-up-growing-beautiful-forest-in-glass-ball-and-flying-butterflies-in-nature-outdoors-spring-season-concept-generative-ai-photo.jpg",fit: BoxFit.cover,),
            ),
          )
        ],
      ),
    );
  }
}
