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
  final String apikey='your_api_key';
  final readaccesstoken='api_read_access_token';

  // Run function at start of app
  
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

    // Storing data in map
    
    Map trendingresult=await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult=await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvshowsresult=await tmdbWithCustomLogs.v3.tv.getTopRated();
    setState(() {
      trendingmovies=trendingresult['results'];
      topratedmovies=topratedresult['results'];
      tvshows=tvshowsresult['results'];
    });
    
    // to check the data
    // print(tvshows);
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
