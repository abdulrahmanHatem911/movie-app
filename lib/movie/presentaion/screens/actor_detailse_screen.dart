import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utills/api_keys.dart';
import '../../../core/utills/enum.dart';
import '../../../core/widgets/loading_widget.dart';
import '../components/actor_deails.dart/show_more_movie.dart';
import '../controller/actor_details/actor_details_bloc.dart';

class ActorDetailsScreen extends StatelessWidget {
  final int actorId;
  const ActorDetailsScreen({super.key, required this.actorId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ActorDetailsBloc>()
        ..add(GetActorDetailsEvent(actorId))
        ..add(GetActorMoviesCreditsEvent(actorId)),
      child: Scaffold(
        body: _buildMainBodyScreen(),
      ),
    );
  }

  Widget _buildMainBodyScreen() {
    return BlocBuilder<ActorDetailsBloc, ActorDetailsState>(
        builder: (context, state) {
      switch (state.requestState) {
        case RequestState.loading:
          return const LoadingWidgets();
        case RequestState.error:
          return Center(
            child: Text(state.message),
          );
        case RequestState.loaded:
          return CustomScrollView(
            key: const Key('actorDetailsScrollView'),
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 300.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.5, 1.0, 1.0],
                        ).createShader(
                          Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                        );
                      },
                      blendMode: BlendMode.dstIn,
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        imageUrl: AppConstant.imageUrl(
                            state.actorDetails!.profilePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.actorDetails!.name,
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            )),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 18,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  state.actorDetails!.birthday,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                state.actorDetails!.placeOfBirth.split(',')[0],
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          state.actorDetails!.biography,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                sliver: SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      'MOVIES',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: ShowMoreMovie()),
            ],
          );
        default:
          return const Center(
            child: CircularProgressIndicator(),
          );
      }
    });
  }
}
