import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';
import 'package:movies_app/widgets/description_tv.dart';

class TvShows extends StatelessWidget {
  const TvShows({super.key, required this.tvshows});

  final List tvshows;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: ' Popular TV Shows',
            color: Colors.white,
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvshows.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DescriptionTV(
                        name: tvshows[index]['original_name'],
                        description: tvshows[index]['overview'],
                        bannerurl: 'https://image.tmdb.org/t/p/w500' +
                            tvshows[index]['backdrop_path'],
                        posterurl: 'https://image.tmdb.org/t/p/w500' +
                            tvshows[index]['poster_path'],
                        vote: double.parse(
                            tvshows[index]['vote_average'].toString()),
                        //launch_on: tvshows[index]['release_date'],
                      ),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      tvshows[index]['backdrop_path'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: ModifiedText(
                            text: tvshows[index]['original_name'] != null
                                ? tvshows[index]['original_name']
                                : 'Loading',
                            color: Colors.white,
                            size: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
