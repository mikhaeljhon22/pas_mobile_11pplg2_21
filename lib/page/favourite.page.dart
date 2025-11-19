import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pas_mobile_11pplg2_21/db/db.helper.dart';
import 'package:pas_mobile_11pplg2_21/model/movie.model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final db = DBHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite")),
      body: FutureBuilder<List<MovieModel>>(
        future: db.getMovies(),
        builder: (context, snapshot) {
          final data = snapshot.data ?? [];

          if (data.isEmpty) {
            return const Center(child: Text("Belum ada favorite"));
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, i) {
              final p = data[i];

              print("all debugging ${p}");

              return Card(
                child: ListTile(
                  leading: CachedNetworkImage(imageUrl: p.image, width: 40),
                  title: Text(p.name),
                  subtitle: Text(
                    "Bahasa: ${p.language} Situs Official : ${p.url}",
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await db.delete(p.id);
                      setState(() {});
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
