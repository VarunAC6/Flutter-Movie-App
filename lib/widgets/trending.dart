import 'package:flutter/material.dart';
import 'package:tmdb_app/description.dart';
import 'package:tmdb_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({super.key,required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Trending Movies", size: 21, color: Colors.white,),
          SizedBox(height: 10,),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: trending[index]['title'], description: trending[index]['overview'], banner_url: trending[index]['backdrop_path'], poster_url: trending[index]['poster_path'], rating: trending[index]['vote_average'] .toString(), release_date: trending[index]['release_date'])));
                  },
                  child: trending[index]['title']!=null?Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('http://image.tmdb.org/t/p/w500'+trending[index]['poster_path']))),
                        ),
                        Container(child: modified_text(text: trending[index]['title']!=null?trending[index]['title']:'Loading', color: Colors.white, size: 14),)
                      ],
                    ),
                  ):Container(),
                );
              }),
          )
        ],
      ),
    );
  }
}