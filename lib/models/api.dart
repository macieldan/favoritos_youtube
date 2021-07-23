import 'dart:convert';

import 'package:favoritos_youtube/models/video.dart';
import 'package:http/http.dart' as http;

const API_KEY = "AIzaSyAIfLkHodOiqcAr8pKmxbazaydUreMcyUc";

class Api {
  String _search;
  String _nextToken;

  Future<List<Video>> search(String search) async {
    _search = search;

    http.Response response = await http.get(Uri.parse(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"));

    return decode(response);
  }

  Future<List<Video>> nextPage() async {

    http.Response response = await http.get(Uri.parse(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"));

    return decode(response);
  }

  List<Video> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decode = json.decode(response.body);
      //print(_search);

      _nextToken = decode["nextPageToken"];

      List<Video> videos = decode["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();
      return videos;

      //print(videos);
    } else {
      throw Exception("failed to load Videos");
    }
  }
}

// "https://www.googleapis.com/youtube/v3/search?part=snippet&q=casa&type=video&key=AIzaSyAIfLkHodOiqcAr8pKmxbazaydUreMcyUc&maxResults=10"
// https://www.googleapis.com/youtube/v3/search?part=snippet&q=casa&type=video&key=AIzaSyAIfLkHodOiqcAr8pKmxbazaydUreMcyUc&maxResults=10&pageToken=$_nextToken

// "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"
// "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"
// "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=yout

