import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/models/api_models/movie_list.dart';
import 'package:movie_app/models/api_models/movie_model.dart';
import 'package:movie_app/models/db_models/save_model.dart';
import 'package:movie_app/shared/network/local/cache_helper/shared_preference.dart';
import 'package:movie_app/shared/network/remote/dio_helper/dio_helper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyProvider extends ChangeNotifier {
  bool isLight = false;

  checkIsTrue(bool? isLight) {
    if(isLight != null) {
      this.isLight = isLight;
    } else {
      this.isLight = !this.isLight;
      CacheHelper.setMode(this.isLight);
    }
  }

  changeAppMode({bool? isLight}) {
    checkIsTrue(isLight);
    notifyListeners();
  }


  bool value = false;

  handleCheckBox(bool value) {
    this.value = value;
    notifyListeners();
  }

  bool isPasswordShown = false;

  changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    notifyListeners();
  }

  int currentIndex = 0;

  changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  File? image;
  final imagePicker = ImagePicker();

  uploadImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) image = File(pickedImage.path);
    notifyListeners();
  }

  static List<Map<String, String>> searchForMovie = [];
  List<Movie> movies = [];
  Map<int, bool> saved = {};

  fillInTheMovieList(MovieList value) {
    for (var movie in value.mainData) {
      movies.add(movie);
    }
  }

  fillInTheSavedMap(Movie movie) {
    saved.addAll({
      movie.rank: false,
    });
  }

  handleSearchForAllMovies(Movie movie) {
    searchForMovie.add({
      'title': movie.title,
      'id': movie.id,
    });
  }

  createSavedMapAndHandleMoviesSearch() {
    for (var movie in movies) {
      fillInTheSavedMap(movie);
      handleSearchForAllMovies(movie);
    }
  }

  addedSavedItem(List value) {
    for (var saveItem in value) {
      saved[saveItem['rank']] = true;
    }
  }

  handleSavedMovies() {
    readAllSaveList().then((value) {
      addedSavedItem(value);
    });
  }

  getAllMoviesAndHandleSearch() {
    DioHelper.getAllMovies().then((value) {
      fillInTheMovieList(value);
    }).then((value) {
      createSavedMapAndHandleMoviesSearch();
    }).then((value) {
      handleSavedMovies();
    });
  }

  handleMovies() {
    if (movies.isEmpty) getAllMoviesAndHandleSearch();
    notifyListeners();
  }

  addToSaved(int rank) {
    saved[rank] = true;
    notifyListeners();
  }

  removeFromSaved(int rank) {
    saved[rank] = false;
    notifyListeners();
  }

  Database? database;
  String dbPath = 'movie.db';
  String saveTable =
      'CREATE TABLE save(rank INTEGER, year INTEGER, title TEXT, rating TEXT, genre TEXT, image TEXT,description TEXT,id TEXT)';

  Future<Database?> openDataBase() async {
    if (database != null) {
      return database;
    } else {
      String path = join(await getDatabasesPath(), dbPath);
      Database? database =
          await openDatabase(path, version: 1, onCreate: (db, v) {
        db.execute(saveTable);
      });
      return database;
    }
  }

  Future<int> insertToSaveList(SaveModel saveModel) async {
    Database? database = await openDataBase();
    return database!.insert('save', saveModel.toMap());
  }

  Future<List> readAllSaveList() async {
    Database? database = await openDataBase();
    return database!.query('save');
  }

  Future<int> deleteFromSaveList(int rank) async {
    Database? database = await openDataBase();
    return database!.delete('save', where: 'rank = ?', whereArgs: [rank]);
  }

  Future<int> updateSaveItem(int rank, SaveModel saveModel) async {
    Database? database = await openDataBase();
    return database!.update('save', saveModel.toMap(),
        where: 'rank = ?', whereArgs: [rank]);
  }
}
