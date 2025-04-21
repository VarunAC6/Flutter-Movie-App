// Container with top-rated tv shows 

import 'package:flutter/material.dart';
import 'package:tmdb_app/description.dart';
import 'package:tmdb_app/utils/text.dart';

class TVShows extends StatelessWidget {
  final List tvshows;
  const TVShows({super.key,required this.tvshows});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Top-Rated TV Shows", size: 21, color: Colors.white,),
          SizedBox(height: 10,),
          Container(
            height: 175,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvshows.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: tvshows[index]['original_name'], description: tvshows[index]['overview'], banner_url: tvshows[index]['backdrop_path'], poster_url: tvshows[index]['poster_path'], rating: tvshows[index]['vote_average'] .toString(), release_date: tvshows[index]['first_air_date'])));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(image: NetworkImage('http://image.tmdb.org/t/p/w500'+tvshows[index]['backdrop_path']),fit: BoxFit.cover)),
                        ),
                        Container(child: modified_text(text: tvshows[index]['original_name']!=null?tvshows[index]['original_name']:'Loading', color: Colors.white, size: 14),)
                      ],
                    ),
                  ),
                );
              }),
          )
        ],
      ),
    );
  }
}
