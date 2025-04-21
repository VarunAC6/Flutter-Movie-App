import 'package:flutter/material.dart';
import 'package:tmdb_app/utils/text.dart';

class Description extends StatelessWidget {
  final String name,description,banner_url,poster_url,rating,release_date;
  const Description({super.key, required this.name, required this.description, required this.banner_url, required this.poster_url, required this.rating, required this.release_date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network('http://image.tmdb.org/t/p/w500'+banner_url),
                    )),
                    Positioned(
                      bottom: 10,
                      child: modified_text(text: '⭐ Rating - '+rating, color: Colors.white, size: 14))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: modified_text(text: name!=null?name:'Not Available', color: Colors.white, size: 21),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_text(text: release_date!=null?'Release Date - '+release_date:'Release Date - Not Available', color: Colors.white, size: 14),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 175, width: 100,
                  child: Image.network('http://image.tmdb.org/t/p/w500'+poster_url,fit: BoxFit.cover,),
                ),
                SizedBox(width: 5,),
                Flexible(child: modified_text(text: description, color: Colors.white, size: 14))

              ],
            )
          ],
        ),
      ),
    );
  }
}