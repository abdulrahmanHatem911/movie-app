class AppConstant {
  static const String BASE_URL = "https://api.themoviedb.org/3";
  static const String API_KEY = "";
  static const String getNowPlayingMove =
      "$BASE_URL/movie/now_playing?api_key=$API_KEY";
  static const String getPopularMovies =
      "$BASE_URL/movie/popular?api_key=$API_KEY&page=1";
  static String getTopRatedMovies(int index) =>
      "$BASE_URL/movie/top_rated?api_key=$API_KEY&page=$index";
  static const String getUpcomingMovie =
      "$BASE_URL/movie/upcoming?api_key=$API_KEY";
  //
  static String getRefreshPopularMovie(int index) =>
      "$BASE_URL/movie/popular?api_key=$API_KEY&page=$index";
  static String movieDetailsPath(int movieId) =>
      "$BASE_URL/movie/$movieId?api_key=$API_KEY";
  static String recommendationsMoviePath(int movieId) =>
      "$BASE_URL/movie/$movieId/recommendations?api_key=$API_KEY";

  //get movie cast
  static String getMovieCastPath(int movieId) =>
      "$BASE_URL/movie/$movieId/credits?api_key=$API_KEY&&language=en-US";
  // deteils about actor
  static String getActorDetailsPath(int actorId) =>
      "$BASE_URL/person/$actorId?api_key=$API_KEY&&language=en-US";
  static String getActorMovieCreditsPath(int actorId) =>
      "$BASE_URL/person/$actorId/movie_credits?api_key=$API_KEY&&language=en-US";
  static String getSearchMoviePath(String query) =>
      "$BASE_URL/search/movie?api_key=$API_KEY&query=$query";
  static String getMovieVideoPath(int movieId) =>
      "$BASE_URL/movie/$movieId/videos?api_key=$API_KEY";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => '$baseImageUrl$path';
}
