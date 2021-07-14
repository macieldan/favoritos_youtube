import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.arrow_menu,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero).then((value) => close(context, query));
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty)
      return Container();
    else
      return FutureBuilder<List>(
          future: suggestions(query),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].toString()),
                      leading: Icon(Icons.play_arrow),
                      onTap: () {
                        close(context, snapshot.data[index]);
                      },
                    );
                  });
            }
          });
  }

  Future<List> suggestions(String search) async {
    http.Response response = await http.get(
      Uri.parse(
          "http://suggestqueries.google.com/complete/search?client=youtube&ds=yt&client=firefox&q=$search"),
    );
    if (response.statusCode == 200) {
      List<dynamic> sugestoes = json.decode(response.body)[1].map((v) {
        return v;
      }).toList();
      return sugestoes;
    } else {
      throw Exception("Failed to load suggestions");
    }
  }
}
