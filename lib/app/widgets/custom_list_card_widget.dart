import 'package:flutter/material.dart';

import '../models/movie_details_model.dart';
import '../utils/apis_utils.dart';

class CustomListCardWidget extends StatelessWidget {
  final MovieDetailsModel movie;
  const CustomListCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(color: Colors.black54),
      child: Row(
        children: [
          Image.network(
            API.requestImg(movie.posterPath),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headline6,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  const Spacer(),
                  Text('Popularidade: ${movie.popularity}'),
                  const SizedBox(height: 10),
                  Text('Votos: ${movie.voteAverage}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
