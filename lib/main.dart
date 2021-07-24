import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritos_youtube/blocs/favorite_bloc.dart';
import 'package:favoritos_youtube/blocs/videos_bloc.dart';
import 'package:favoritos_youtube/models/api.dart';
import 'package:favoritos_youtube/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  Api api = Api();
  api.search("casa");
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         blocs: [
//           Bloc((i) => VideosBloc()),
//         ],
//         child: BlocProvider(
//             blocs: [Bloc((i) => FavoriteBloc())],
//             child: MaterialApp(
//               title: 'YouTubeLikes',
//               theme: ThemeData(
//                 primarySwatch: Colors.blue,
//               ),
//               home: Home(),
//             ),
//             dependencies: null),
//         dependencies: null);
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: [
          Bloc<VideosBloc>((i) => VideosBloc()), Bloc<FavoriteBloc>((i) => FavoriteBloc())
        ],
        child:  MaterialApp(
              title: 'YouTubeLikes',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Home(),
            ),
      dependencies: null);
  }
}
