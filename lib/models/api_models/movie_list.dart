import 'package:movie_app/models/api_models/movie_model.dart';

class MovieList {
  late List<Movie> mainData;

  MovieList({
    required this.mainData,
  });

  MovieList.fromList(List<dynamic> list) {
    this.mainData = [];
    (list).forEach((element) {
      this.mainData.add(
        Movie.fromJson(element),
      );
    });
  }
}
