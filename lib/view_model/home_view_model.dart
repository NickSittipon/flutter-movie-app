import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/data/response/api_response.dart';
import 'package:flutter_mvvm_provider/model/movie_medel.dart';
import 'package:flutter_mvvm_provider/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<MovieListModel> movieList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieListModel> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesList() async {
    setMovieList(ApiResponse.loading());
    try {
      final value = await _myRepo.fetchMoviesList();
      setMovieList(ApiResponse.completed(value));
    } catch (error) {
      setMovieList(ApiResponse.error(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
