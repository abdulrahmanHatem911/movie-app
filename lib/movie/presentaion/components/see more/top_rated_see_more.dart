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

class TopRatedSeeMoreComponent extends StatefulWidget {
  const TopRatedSeeMoreComponent({super.key});

  @override
  State<TopRatedSeeMoreComponent> createState() =>
      _TopRatedSeeMoreComponentState();
}

class _TopRatedSeeMoreComponentState extends State<TopRatedSeeMoreComponent> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false; // Add this line

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= 200 && !_isLoading) {
      // Check _isLoading here
      _isLoading = true; // Set _isLoading to true when loading starts
      context.read<MovieBloc>().add(GetTopRatedMoviesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        switch (state.topRatedState) {
          case RequestState.loading:
            return const LoadingWidgets();
          case RequestState.loaded:
            _isLoading = false;
            return ListView.separated(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
              physics: const BouncingScrollPhysics(),
              itemCount: state.topRatedMovies.length,
              itemBuilder: (context, index) {
                final movie = state.topRatedMovies[index];
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
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              height: 1.2,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.red[400],
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  movie.releaseDate.split('-')[0],
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    (movie.voteAverage / 2).toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    '(${(movie.voteAverage * 10).toInt()})',
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
                          const SizedBox(height: 5.0),
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
            );
          case RequestState.error:
            return Center(
              child: Text(state.popularMessage),
            );
        }
      },
    );
  }
}
