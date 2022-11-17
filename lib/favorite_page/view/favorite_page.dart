import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => ListTile(
            title: Text('Item $index'),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
