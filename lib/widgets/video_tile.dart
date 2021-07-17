import 'package:favoritos_youtube/models/video.dart';
import 'package:flutter/material.dart';

class VideoTile extends StatelessWidget {
  //const VideoTile({ Key? key }) : super(key: key);

  final Video video;
  VideoTile(this.video);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.network(
              video.thump,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        video.title,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        video.channel,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.star_border),
                color: Colors.white,
                iconSize: 30,
              )
            ],
          )
        ],
      ),
    );
  }
}
