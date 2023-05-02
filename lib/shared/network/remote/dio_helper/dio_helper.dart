import 'package:dio/dio.dart';
import 'package:movie_app/models/api_models/movie_list.dart';
import 'package:movie_app/models/api_models/movie_model.dart';

class DioHelper {
  static late Dio allMovies;
  static late Dio singleMovie;

  static init() {
    allMovies = Dio(
      BaseOptions(
        baseUrl: 'https://imdb-top-100-movies.p.rapidapi.com/',
        receiveDataWhenStatusError: true,
      ),
    );

    singleMovie = Dio(
      BaseOptions(
        baseUrl: 'https://imdb-top-100-movies.p.rapidapi.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<MovieList> getAllMovies() async {
    allMovies.options.headers = {
      'content-type': 'application/octet-stream',
      'X-RapidAPI-Key': '8db0fdb219msheccde7732ebca4fp17d22ajsn5836694b4cb9',
      'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com',
    };

    Response response = await allMovies.get(
      '',
    );

    if (response.statusCode! <= 299 && response.statusCode! >= 200) {
      MovieList movieList = MovieList.fromList(response.data);
      return movieList;
    } else {
      throw ('Request Fail');
    }
  }

  static Future<Movie> getMovieDetails(String id) async {
    singleMovie.options.headers = {
      'content-type': 'application/octet-stream',
      'X-RapidAPI-Key': '8db0fdb219msheccde7732ebca4fp17d22ajsn5836694b4cb9',
      'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com',
    };
    //8db0fdb219msheccde7732ebca4fp17d22ajsn5836694b4cb9 new
    //05822ee5c3msh0bc9c261abafb47p1b45cdjsn5ccebffdd1a2 old

    Response response = await allMovies.get(
      id,
    );

    if (response.statusCode! <= 299 && response.statusCode! >= 200) {
      Movie movie = Movie.fromJson(response.data);
      return movie;
    } else {
      throw ('Request Fail');
    }
  }
}
