import 'package:flutter/material.dart';
import 'package:spotify/domain/entities/songs/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEnity songEnity;
  final Function ? function;
  const FavoriteButton({super.key, required this.songEnity, this.function});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
