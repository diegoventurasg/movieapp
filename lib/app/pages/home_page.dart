import 'package:flutter/material.dart';

import '../controllers/movie_controller.dart';
import '../models/movies_model.dart';
import '../repositories/movies_repository_imp.dart';
import '../services/dio_service_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImp(DioServiceImp()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Movies?>(
        valueListenable: _controller.movies,
        builder: (_, movies, __) {
          return movies != null
              ? ListView.builder(
                  itemCount: movies.results.length,
                  itemBuilder: (_, index) => Text(
                    _controller.movies.value!.results[index].title,
                  ),
                )
              : Container();
        },
      ),
    );
  }
}
