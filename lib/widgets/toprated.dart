import 'package:flutter/material.dart';
import 'package:tmdb_app/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;
  const TopRatedMovies({super.key,required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Top-Rated Movies", size: 21, color: Colors.white,),
          SizedBox(height: 10,),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: () {
                    
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('http://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']))),
                        ),
                        Container(child: modified_text(text: toprated[index]['title']!=null?toprated[index]['title']:'Loading', color: Colors.white, size: 14),)
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