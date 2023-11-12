import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utills/api_keys.dart';
import '../../../core/utills/enum.dart';
import '../controller/moice_event.dart';
import '../controller/movie_bloc.dart';
import '../controller/movie_state.dart';
import 'movie_detail_screen.dart';

TextEditingController _searchController = TextEditingController();

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          sl<MovieBloc>()..add(GetSearchMovieEvent('d')),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<MovieBloc, MovieState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      controller: _searchController,
                      onChanged: (value) {
                        BlocProvider.of<MovieBloc>(context)
                            .add(GetSearchMovieEvent(value));
                        print(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: state.searchState == RequestState.loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : state.searchState == RequestState.loaded
                            ? ListView.separated(
                                physics: BouncingScrollPhysics(),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 20,
                                ),
                                itemCount: state.searchMovies.length,
                                itemBuilder: (context, index) {
                                  final movie = state.searchMovies[index];
                                  return Container(
                                    padding: const EdgeInsets.all(8.0),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade800,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        MovieDetailScreen(
                                                            id: movie.id),
                                              ),
                                            );
                                          },
                                          child: SizedBox(
                                            width: 100,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                imageUrl: AppConstant.imageUrl(
                                                  movie.posterPath.isEmpty
                                                      ? '/6aU58nbrPXECyVEfa8i4i5iW2OG.jpg'
                                                      : movie.posterPath,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 18.0),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                movie.title,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 8.0),
                                              Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.star,
                                                          color: Colors.amber,
                                                          size: 16.0),
                                                      const SizedBox(
                                                          width: 4.0),
                                                      Text(
                                                        (movie.voteAverage / 2)
                                                            .toStringAsFixed(1),
                                                        style: const TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          letterSpacing: 1.2,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          width: 4.0),
                                                      Text(
                                                        '(${movie.voteAverage})',
                                                        style: const TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          letterSpacing: 1.2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 10.0),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 2.0,
                                                      horizontal: 8.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.red[400],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child: Text(
                                                      movie.releaseDate
                                                          .split('-')[0],
                                                      style: const TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
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
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey.shade300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : Container(),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
