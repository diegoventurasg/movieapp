import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../controllers/movie_controller.dart';
import '../models/movies_model.dart';
import '../repositories/movies_repository_imp.dart';
import '../services/dio_service_imp.dart';
import '../widgets/custom_list_card_widget.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<MoviesModel?>(
                    valueListenable: _controller.movies,
                    builder: (_, movies, __) {
                      return Visibility(
                          visible: movies != null,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Movies',
                                  style: Theme.of(context).textTheme.headline3),
                              const SizedBox(height: 20),
                              TextField(
                                onChanged: _controller.onChanged,
                              ),
                            ],
                          ));
                    }),
                const SizedBox(height: 40),
                ValueListenableBuilder<MoviesModel?>(
                  valueListenable: _controller.movies,
                  builder: (_, movies, __) {
                    return movies != null
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: movies.movieList.length,
                            itemBuilder: (_, idx) => CustomListCardWidget(
                              movie: movies.movieList[idx],
                            ),
                            separatorBuilder: (_, __) => const Divider(),
                          )
                        : Lottie.asset('assets/lottie.json');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
