import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/model/user_model.dart';

import 'package:flutter_mvvm_provider/utilities/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/view_model/user_view_model.dart';

class SplashService {
  Future<UserModel?> getUserData() async {
    return await UserViewModel().getUser();
  }

  void checkAuthentication(BuildContext context) async {
    getUserData()
        .then((value) async {
          if (value == null || value.token == null || value.token!.isEmpty) {
            await Future.delayed(const Duration(seconds: 3));
            if (!context.mounted) return;
            Navigator.pushNamed(context, RoutesName.login);
          } else {
            print("Token: ${value.token}");
            await Future.delayed(const Duration(seconds: 3));
            if (!context.mounted) return;
            Navigator.pushNamed(context, RoutesName.home);
          }
        })
        .onError((error, stackTrace) {
          if (kDebugMode) {
            print("Error in checkAuthentication: $error");
          }
        });
  }
}
