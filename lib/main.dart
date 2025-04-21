import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:tmdb_app/utils/text.dart';
import 'package:tmdb_app/widgets/toprated.dart';
import 'package:tmdb_app/widgets/trending.dart';
import 'package:tmdb_app/widgets/tvshows.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,primaryColor: Colors.green),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies=[];
  List topratedmovies=[];
  List tvshows=[];
  final String apikey='744ad860f1b108ad496f027ee9517a4f';
  final readaccesstoken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NDRhZDg2MGYxYjEwOGFkNDk2ZjAyN2VlOTUxN2E0ZiIsIm5iZiI6MTc0MjM2NjE4MC44MzEsInN1YiI6IjY3ZGE2NWU0ZTgzMDI1MzMyMDZjYTc5YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bfOFdyo98lsN73vUGy71reVbTzoVm4RX7nrM51c0SGg';
  @override
  void initState(){
    loadmovies();
    super.initState();
  }
  
  loadmovies() async{
    TMDB tmdbWithCustomLogs=TMDB(ApiKeys(apikey, readaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    ));
    Map trendingresult=await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult=await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvshowsresult=await tmdbWithCustomLogs.v3.tv.getTopRated();
    setState(() {
      trendingmovies=trendingresult['results'];
      topratedmovies=topratedresult['results'];
      tvshows=tvshowsresult['results'];
    });
    print(tvshows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: modified_text(text: "TMDB App", color: Colors.white, size: 24,),),
      body: ListView(
        children: [
          TVShows(tvshows: tvshows),
          TrendingMovies(trending: trendingmovies),
          TopRatedMovies(toprated: topratedmovies)
        ],
      ),
    );
  }
}