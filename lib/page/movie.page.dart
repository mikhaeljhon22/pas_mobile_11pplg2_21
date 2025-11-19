import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pas_mobile_11pplg2_21/db/db.helper.dart';
import 'package:pas_mobile_11pplg2_21/model/movie.model.dart';
import 'package:pas_mobile_11pplg2_21/service/movie.service.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final movieService = MovieService();
  final db = DBHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie Pages")),
      body: FutureBuilder<List<MovieModel>>(
        future: movieService.fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = snapshot.data ?? [];

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) {
              final p = products[i];

              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: p.image,
                    width: 50,
                    height: 50,
                    placeholder: (_, __) => const CircularProgressIndicator(),
                  ),
                  title: Text(p.name),
                  subtitle: Text(
                    "Bahasa: ${p.language} Situs Official : ${p.url}",
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.bookmark_add),
                    onPressed: () async {
                      await db.insert(p);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Ditambahkan ke Favorite"),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
