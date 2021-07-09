class Video {
  final String id;
  final String title;
  final String thump;
  final String channel;

  Video({this.id, this.title, this.thump, this.channel});

  factory Video.fromJson(Map<dynamic, dynamic> json) {
    return Video(
        id: json["id"]["videoId"],
        title: json["snippet"]["title"],
        thump: json["snippet"]["thumbnails"]["high"]["url"],
        channel: json["snippet"]["channelTitle"]);
  }
}
