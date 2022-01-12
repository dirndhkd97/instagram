import 'package:flutter/material.dart';
import 'package:instagram/style.dart' as style;
import 'package:instagram/home.dart' as home;
import 'package:instagram/search.dart' as search;
import 'package:instagram/add.dart' as add;
import 'package:instagram/like.dart' as like;
import 'package:instagram/me.dart' as me;

void main() {
  runApp(
      MaterialApp(
        theme: style.theme,
        darkTheme: ThemeData.dark(),
        home: MyApp()
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tabIndex = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            icon: Icon(Icons.message_outlined),
            onPressed: () {},
            iconSize: 30,
          )
        ],
      ),
      body: [home.home(), search.search(), add.add(), like.like(), me.me()][tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i){
          setState(() {
            tabIndex = i;
          });
        },
        currentIndex: tabIndex, //현재 선택된 Index
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_outlined), label: 'add'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined), label: 'like'),
          BottomNavigationBarItem(icon: Icon(Icons.remember_me_outlined), label: 'me'),
        ],
      ),
    );
  }
}


