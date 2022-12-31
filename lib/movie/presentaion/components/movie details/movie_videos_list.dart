import 'package:film/movie/presentaion/controller/movie_details/movie_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utills/enum.dart';
import '../../../../core/widgets/loading_widget.dart';
import 'moive_videos.dart';

class MovieVideosListComponent extends StatelessWidget {
  const MovieVideosListComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.videosState) {
          case RequestState.loading:
            return Container();
          case RequestState.loaded:
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.24,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.videosList.length,
                itemBuilder: (context, index) {
                  final movieVideo = state.videosList[index];
                  return MovieVideosComponent(movieVideo: movieVideo);
                },
              ),
            );
          case RequestState.error:
            return Container();
        }
      },
    );
  }
}
