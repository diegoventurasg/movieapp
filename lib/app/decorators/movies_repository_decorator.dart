import 'package:movieapp/app/models/movies_model.dart';

import '../repositories/movies_repository.dart';

class MovieRepositoryDecorator implements MoviesRepository {
  final MoviesRepository _moviesRepository;
  MovieRepositoryDecorator(this._moviesRepository);

  @override
  Future<MoviesModel> getMovies() async {
    return await _moviesRepository.getMovies();
  }
}
