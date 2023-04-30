class SaveModel {
  late final int rank;
  late final int year;
  late final String title;
  late final String rating;
  late final String image;
  late final String description;
  late final String genre;
  late final String id;

  SaveModel(dynamic obj) {
    rank = obj['rank'];
    year = obj['year'];
    title = obj['title'];
    rating = obj['rating'];
    image = obj['image'];
    description = obj['description'];
    genre = obj['genre'];
    id = obj['id'];
  }

  SaveModel.fromJson(Map<String, dynamic> data) {
    rank = data['rank'];
    year = data['year'];
    title = data['title'];
    rating = data['rating'];
    image = data['image'];
    description = data['description'];
    genre = data['genre'];
    id = data['id'];
  }

  Map<String, dynamic> toMap() => {
        'rank': rank,
        'year': year,
        'title': title,
        'rating': rating,
        'image': image,
        'description': description,
        'genre': genre,
        'id': id,
  };
}
