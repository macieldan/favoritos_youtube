import 'dart:convert';

import 'package:favoritos_youtube/models/video.dart';
import 'package:http/http.dart' as http;

const API_KEY = "AIzaSyAIfLkHodOiqcAr8pKmxbazaydUreMcyUc";

class Api {
  search(String search) async {
    http.Response response = await http.get(Uri.parse(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"));
    print(response);

    decode(response);
  }

  decode(http.Response response) {
    if (response.statusCode == 200) {
      var decode = json.decode(response.body);

      List<Video> videos = decode["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList<Video>();

      print(videos);
    }
  }
}



// "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"
// "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"
// "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=yout

