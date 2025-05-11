import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/utilities/routes/routes.dart';
import 'package:flutter_mvvm_provider/utilities/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/view/login_view.dart';
import 'package:flutter_mvvm_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
