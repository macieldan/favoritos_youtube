import 'package:flutter/material.dart';

class Video {
  final String id;
  final String title;
  final String thump;
  final String channel;

  Video({this.id, this.title, this.thump, this.channel});

  factory Video.fromJson(Map<dynamic, dynamic> json) {
    if (json.containsKey("id"))
      return Video(
          id: json["id"]["videoId"],
          title: json["snippet"]["title"],
          thump: json["snippet"]["thumbnails"]["high"]["url"],
          channel: json["snippet"]["channelTitle"]);
    else
      return Video(
          id: json["videoId"],
          title: json["title"],
          thump: json["thumb"],
          channel: json["channel"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "videoId": id,
      "title": title,
      "thumb": thump,
      "channel": channel,
    };
  }
}
