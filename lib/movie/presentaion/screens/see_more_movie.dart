import 'package:cached_network_image/cached_network_image.dart';
import 'package:film/core/utills/contant.dart';
import 'package:film/core/widgets/loading_widget.dart';
import 'package:film/movie/presentaion/components/see%20more/popular_see_more.dart';
import 'package:film/movie/presentaion/components/see%20more/top_rated_see_more.dart';
import 'package:film/movie/presentaion/controller/movie_bloc.dart';
import 'package:film/movie/presentaion/controller/movie_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utills/enum.dart';
import '../components/see more/upcoming_see_more.dart';
import '../controller/moice_event.dart';

class SeeMoreMovie extends StatelessWidget {
  final String title;
  const SeeMoreMovie({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MovieBloc>()
        ..add(
          GetPopularMoviesEvent(),
        )
        ..add(GetTopRatedMoviesEvent())
        ..add(GetUpcomingMoviesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: title == 'popular'
              ? Text('Popular Movies')
              : title == 'top_rated'
                  ? Text('Top Rated Movies')
                  : Text('Upcoming Movies'),
        ),
        body: _buildBody(title),
      ),
    );
  }

  Widget _buildBody(String title) {
    switch (title) {
      case 'popular':
        return const PopularSeeMoreComponent();
      case 'top rated':
        return const TopRatedSeeMoreComponent();
      case 'upcoming':
        return const UpcomingSeeMoreComponent();
      default:
        return const Center(
          child: Text('No Data'),
        );
    }
  }
}
