import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.toprated});

  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'TopRated Movies',
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
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
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
                                    toprated[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ModifiedText(
                            text: toprated[index]['title'] != null
                                ? toprated[index]['title']
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
