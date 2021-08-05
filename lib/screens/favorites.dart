import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritos_youtube/blocs/favorite_bloc.dart';
import 'package:favoritos_youtube/models/video.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<FavoriteBloc>();

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("Favorites"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: StreamBuilder<Map<String, Video>>(
        stream: bloc.outFav,
        initialData: {},
        builder: (context, snapshot) {
          return ListView(
            children: snapshot.data.values.map((v) {
              return InkWell(
                onTap: () {},
                onLongPress: () {
                  bloc.toggleFavorite(v);
                },
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      child: Image.network(v.thump),
                    ),
                    Expanded(
                        child: Text(
                      v.title,
                      style: TextStyle(color: Colors.white70),
                      maxLines: 2,
                    ))
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
