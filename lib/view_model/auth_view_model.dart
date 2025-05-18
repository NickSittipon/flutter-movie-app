import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/model/user_model.dart';
import 'package:flutter_mvvm_provider/repository/auth_repository.dart';
import 'package:flutter_mvvm_provider/resources/app_url.dart';
import 'package:flutter_mvvm_provider/utilities/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/utilities/utils.dart';
import 'package:flutter_mvvm_provider/view_model/auth_view_model.dart'
    as _myRepo;
import 'package:flutter_mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signupLoading = false;
  bool get signupLoading => _signupLoading;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setSignupLoading(bool loading) {
    _signupLoading = loading;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo
        .loginApi(data)
        .then((value) {
          print("Login URL: ${AppUrl.loginEndPoint}");
          setLoading(false);
          final userPreferrence = Provider.of<UserViewModel>(
            context,
            listen: false,
          );
          userPreferrence.saveUser(UserModel(token: value['token'].toString()));
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

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignupLoading(loading);
    _myRepo
        .signUpApi(data)
        .then((value) {
          print("SignUp URL: ${AppUrl.registerApiEndPoint}");
          setSignupLoading(false);
          Utils.flushBarErrorMessage(context, 'SignUp successfully');
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
