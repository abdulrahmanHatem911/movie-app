import 'package:flutter/material.dart';

class MovieTrailersScreen extends StatelessWidget {
  const MovieTrailersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Trailers'),
      ),
      body: const Center(
        child: Text('No Data'),
      ),
    );
  }
}
