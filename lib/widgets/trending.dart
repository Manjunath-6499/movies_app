import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';
import 'package:movies_app/widgets/description_page.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trending});

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Trending Movies',
            color: Colors.white,
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: trending[index]['title'],
                          description: trending[index]['overview'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              trending[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              trending[index]['poster_path'],
                          vote: double.parse(
                              trending[index]['vote_average'].toString()),
                          launch_on: trending[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: trending[index]['title'] != null
                      ? Container(
                          width: 145,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path'],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: ModifiedText(
                                  text: trending[index]['title'] != null
                                      ? trending[index]['title']
                                      : 'Loading',
                                  color: Colors.white,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
