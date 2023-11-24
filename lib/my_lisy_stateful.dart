import 'package:flutter/material.dart';
import 'package:practice2/list_provider_movie.dart';
import 'package:provider/provider.dart';

import 'fav_movies.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavMoviesListScreen(),
                    ));
              },
              icon: Icon(Icons.favorite),
              label: Text(
                'Go to myList ${myList.length}',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 15)),
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                final currentMovie = movies[index];
                return Card(
                  key: ValueKey(currentMovie.title),
                  color: Colors.blue,
                  child: ListTile(
                    title: Text(
                      currentMovie.title,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      currentMovie.duration ?? 'No information',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: myList.contains(currentMovie)
                            ? Colors.red
                            : Colors.white,
                      ),
                      onPressed: () {
                        if (!myList.contains(currentMovie)) {
                          context.read<MovieProvider>().addToList(currentMovie);
                        } else {
                          context
                              .read<MovieProvider>()
                              .removeFromList(currentMovie);
                        }
                      },
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
