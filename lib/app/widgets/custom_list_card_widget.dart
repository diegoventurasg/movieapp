import 'package:flutter/material.dart';

import '../models/movie_details_model.dart';
import '../pages/details_page.dart';
import '../utils/apis_utils.dart';

class CustomListCardWidget extends StatelessWidget {
  final MovieDetailsModel movie;
  const CustomListCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailsPage(movie: movie),
              fullscreenDialog: true,
            ),
          );
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
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
        ),
      ),
    );
  }
}
