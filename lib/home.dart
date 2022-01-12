import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  var data = [];
  var scroll = ScrollController();

  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var decodeResult = jsonDecode(result.body);
    setState(() {
      data = decodeResult;
    });
  }

  getMoreData() async {
    var more = await http.get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    var decodeMore = jsonDecode(more.body);
    setState(() {
      data.add(decodeMore);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    scroll.addListener(() {
      if(scroll.position.pixels == scroll.position.maxScrollExtent){
        getMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    if(data.isNotEmpty){
      return ListView.builder(itemCount: data.length, controller: scroll, itemBuilder: (c, i){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(data[i]['image']),
            Text('좋아요 ${data[i]['likes']}'),
            Text(data[i]['user']),
            Text(data[i]['content'])
          ],
        );
      },);
    } else {
      return CircularProgressIndicator();
    }

  }
}
