class Movie{
  late final int rank;
  late final String title;
  late final String thumbnail;
  late final String rating;
  late final String id;
  late final int year;
  late final String image;
  late final String description;
  late final String trailer;
  late final List<String> genre;
  late final List<String> director;
  late final List<String> writers;
  late final String imdbid;

  Movie({
    required this.rank,
    required this.title,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.image,
    required this.description,
    required this.trailer,
    required this.genre,
    required this.director,
    required this.writers,
    required this.imdbid,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    rank: json["rank"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    rating: json["rating"],
    id: json["id"],
    year: json["year"],
    image: json["image"],
    description: json["description"],
    trailer: json["trailer"],
    genre: List<String>.from(json["genre"].map((x) => x)),
    director: List<String>.from(json["director"].map((x) => x)),
    writers: List<String>.from(json["writers"].map((x) => x)),
    imdbid: json["imdbid"],
  );

  Map<String, dynamic> toJson() => {
    "rank": rank,
    "title": title,
    "thumbnail": thumbnail,
    "rating": rating,
    "id": id,
    "year": year,
    "image": image,
    "description": description,
    "trailer": trailer,
    "genre": List<String>.from(genre.map((x) => x)),
    "director": List<String>.from(director.map((x) => x)),
    "writers": List<String>.from(writers.map((x) => x)),
    "imdbid": imdbid,
  };

}