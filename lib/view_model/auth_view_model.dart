import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/repository/auth_repository.dart';
import 'package:flutter_mvvm_provider/resources/app_url.dart';
import 'package:flutter_mvvm_provider/utilities/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/utilities/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo
        .loginApi(data)
        .then((value) {
          print("Login URL: ${AppUrl.loginEndPoint}");
          setLoading(false);
          Utils.flushBarErrorMessage(context, 'login successfully');
          Navigator.pushNamed(context, RoutesName.home);
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, stackTrace) {
          setLoading(false);
          Utils.flushBarErrorMessage(context, error.toString());
          if (kDebugMode) {
            setLoading(false);

            print(error.toString());
          }
        });
  }
}
