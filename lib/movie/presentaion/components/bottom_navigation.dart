import 'package:film/core/services/services_locator.dart';
import 'package:film/movie/presentaion/controller/moice_event.dart';
import 'package:film/movie/presentaion/controller/movie_bloc.dart';
import 'package:film/movie/presentaion/controller/movie_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return BottomNavigationBar(
          onTap: (index) {
            BlocProvider.of<MovieBloc>(context).add(
              ChangePageEvent(
                currentPage: index,
              ),
            );
            print(index);
            print('--------------${state.currantIndex}');
          },
          currentIndex: BlocProvider.of<MovieBloc>(context).index,
          items: [
            BottomNavigationBarItem(
              label: 'Movie',
              icon: Image.asset(
                'assets/images/icon_bottom_navigation/movie.png',
                width: 25.0,
                height: 25.0,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: 'TV',
              icon: Image.asset(
                'assets/images/icon_bottom_navigation/tv-pngrepo-com.png',
                width: 25.0,
                height: 25.0,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Bookmark',
              icon: Image.asset(
                'assets/images/icon_bottom_navigation/bookmark.png',
                width: 25.0,
                height: 25.0,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Image.asset(
                'assets/images/icon_bottom_navigation/profile-pngrepo-com.png',
                width: 25.0,
                height: 25.0,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
