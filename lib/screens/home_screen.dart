import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritos_youtube/blocs/videos_bloc.dart';
import 'package:favoritos_youtube/delegates/data_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  //const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25.0,
          child: Image.asset("images/youtube-logo.jpg"),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          Align(
            alignment: Alignment.center,
            child: Text("0"),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star),
          ),
          IconButton(
            onPressed: () async {
              String results = await showSearch(
                context: context,
                delegate: DataSearch(),
              );
              if (results != null) ;
              //BlocProvider.
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
