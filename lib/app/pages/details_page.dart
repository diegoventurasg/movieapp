import 'package:flutter/material.dart';

import '../models/movie_details_model.dart';
import '../utils/apis_utils.dart';

class DetailsPage extends StatelessWidget {
  final MovieDetailsModel movie;
  const DetailsPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .55,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    API.requestImg(movie.posterPath),
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return const CircularProgressIndicator.adaptive();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                movie.overview,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.title),
                  Text(movie.originalTitle),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.new_releases),
                  Text(movie.releaseDate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
