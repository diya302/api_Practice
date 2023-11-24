import 'package:flutter/material.dart';
import 'package:practice2/list_provider_movie.dart';
import 'package:provider/provider.dart';

class FavMoviesListScreen extends StatefulWidget {
  const FavMoviesListScreen({super.key});

  @override
  State<FavMoviesListScreen> createState() => _FavMoviesListScreenState();
}

class _FavMoviesListScreenState extends State<FavMoviesListScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<MovieProvider>().myList;
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: _myList.length,
            itemBuilder: (_, index) {
              final currentMovie = _myList[index];
              return Card(
                key: ValueKey(currentMovie.title),
                elevation: 4,
                child: ListTile(
                  title: Text(currentMovie.title),
                  subtitle: Text(currentMovie.duration ?? ''),
                  trailing: TextButton(
                    child: Text(
                      'remove',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      context
                          .read<MovieProvider>()
                          .removeFromList(currentMovie);
                    },
                  ),
                ),
              );
            }));
  }
}
