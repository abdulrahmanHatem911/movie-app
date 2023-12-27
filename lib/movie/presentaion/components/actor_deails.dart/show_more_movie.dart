import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utills/api_keys.dart';
import '../../controller/actor_details/actor_details_bloc.dart';
import '../../screens/movie_detail_screen.dart';

class ShowMoreMovie extends StatelessWidget {
  const ShowMoreMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorDetailsBloc, ActorDetailsState>(
      builder: (context, state) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final recommendation = state.actorMoviesCredits[index];
              return FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(
                                    id: recommendation.id,
                                  ))),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        child: CachedNetworkImage(
                          imageUrl: AppConstant.imageUrl(
                              recommendation.posterPath.isEmpty
                                  ? '/wPLXqJMbGH5F4ralorSiRQJwDp3.jpg'
                                  : recommendation.posterPath),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          height: 180.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: Container(
                        height: 20.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.red.shade500.withOpacity(0.9),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        child: Center(
                            child: Text('${recommendation.voteAverage.toInt()}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14.0))),
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: state.actorMoviesCredits.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.7,
            crossAxisCount: 3,
          ),
        );
      },
    );
  }
}
