import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utills/api_keys.dart';
import '../../../../core/utills/enum.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../controller/moice_event.dart';
import '../../controller/movie_bloc.dart';
import '../../controller/movie_state.dart';
import '../../screens/movie_detail_screen.dart';

class UpcomingSeeMoreComponent extends StatelessWidget {
  const UpcomingSeeMoreComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        switch (state.upcomingState) {
          case RequestState.loading:
            return const LoadingWidgets();
          case RequestState.loaded:
            return RefreshIndicator(
              onRefresh: () async {
                context.read<MovieBloc>().add(GetUpcomingMoviesEvent());
              },
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                physics: const BouncingScrollPhysics(),
                itemCount: state.upcomingMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.upcomingMovies[index];
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MovieDetailScreen(id: movie.id),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              imageUrl: AppConstant.imageUrl(movie.posterPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 18.0),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red[400],
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    movie.releaseDate.split('-')[0],
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      (movie.voteAverage / 2)
                                          .toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '(${movie.voteAverage})',
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              movie.overview,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10.0);
                },
              ),
            );
          case RequestState.error:
            return Center(
              child: Text(state.upcomingMessage),
            );
        }
      },
    );
  }
}
