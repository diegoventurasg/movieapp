import '../models/movies_model.dart';
import '../services/dio_service.dart';
import '../utils/apis_utils.dart';
import 'movies_repository.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImp(this._dioService);

  @override
  Future<MoviesModel> getMovies() async {
    await Future.delayed(const Duration(seconds: 3));
    var result = await _dioService.getDio().get(API.requestMovieList);
    return MoviesModel.fromJson(result.data);
  }
}
