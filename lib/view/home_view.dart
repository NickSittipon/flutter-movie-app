import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/data/response/status.dart';
import 'package:flutter_mvvm_provider/utilities/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/utilities/utils.dart';
import 'package:flutter_mvvm_provider/view_model/home_view_model.dart';
import 'package:flutter_mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    super.initState();
    homeViewViewModel.fetchMoviesList();
  }

  @override
  Widget build(BuildContext context) {
    final usePreferrence = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              usePreferrence.removeUser();
              Navigator.pushNamed(context, RoutesName.login);
            },
            child: Center(
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, _) {
            switch (value.movieList.status) {
              case Status.Loading:
                return Center(child: CircularProgressIndicator());
              case Status.Error:
                return Center(child: Text(value.movieList.message.toString()));
              case null:
                throw UnimplementedError();
              case Status.notStarted:
                throw UnimplementedError();
              case Status.Completed:
                return ListView.builder(
                  itemCount: value.movieList.data!.movies!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          value.movieList.data!.movies![index].posterurl
                              .toString(),
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, color: Colors.red);
                          },
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          value.movieList.data!.movies![index].title.toString(),
                        ),
                        subtitle: Text(
                          value.movieList.data!.movies![index].year.toString(),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              Utils.averageRating(
                                value.movieList.data!.movies![index].ratings!,
                              ).toStringAsFixed(1),
                            ),

                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        ),
                      ),
                    );
                  },
                );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
