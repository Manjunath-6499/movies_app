import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';
import 'package:movies_app/widgets/toprated.dart';
import 'package:movies_app/widgets/trending.dart';
import 'package:movies_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];

  final String apiKey = 'e543d3144213a7df199123a6cd0c4174';

  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNTQzZDMxNDQyMTNhN2RmMTk5MTIzYTZjZDBjNDE3NCIsInN1YiI6IjY1Yjc0NDUzMGZiMTdmMDBjOTMyZjM4NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tXCDmNJahlkLqFQ4JvjmnFaVihmJQxUD_diobDoxIIs';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbwithCustomLogs = TMDB(
        ApiKeys(
          apiKey,
          readAccessToken,
        ),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingResult = await tmdbwithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbwithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbwithCustomLogs.v3.tv.getPopular();

    print(trendingResult);

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
    });

    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const ModifiedText(
          text: 'Movies❤️',
          color: Colors.white,
          size: 26,
        ),
      ),
      body: ListView(
        children: [
          TvShows(tvshows: tv),
          TrendingMovies(
            trending: trendingMovies,
          ),
          TopRated(toprated: topRatedMovies),
        ],
      ),
    );
  }
}
