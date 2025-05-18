import 'package:flutter_mvvm_provider/data/network/BaseApiServices.dart';
import 'package:flutter_mvvm_provider/data/network/NetworkApiService.dart';
import 'package:flutter_mvvm_provider/model/movie_medel.dart';
import 'package:flutter_mvvm_provider/resources/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<MovieListModel> fetchMoviesList() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
        AppUrl.moviesListEndPoint,
      );
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
