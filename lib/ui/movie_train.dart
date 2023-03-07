import 'package:flutter/material.dart';
import 'package:movie_train/ui/screens/home/home_screen.dart';

class MovieTrain extends StatelessWidget {
  const MovieTrain({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Train',
      theme: ThemeData(),
      home: const HomeScreen(),
    );
  }
}
