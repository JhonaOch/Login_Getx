import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/app/data/models/movie.dart';
import 'package:flutter_getx_pattern/app/modules/home/home_controller.dart';
import 'package:flutter_getx_pattern/app/modules/home/home_widgets/movie_item.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (_) => Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: _.logOut, icon: const Icon(Icons.exit_to_app))
              ],
            ),
            body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.transparent,
                    //padding: EdgeInsets.all(20),
                    child: ListView.builder(
                        itemCount: _.movies.length,
                        itemBuilder: (ctx, i) {
                          final Movie movie = _.movies[i];
                          return MovieItem(movie: movie);
                        })))));
  }
}
