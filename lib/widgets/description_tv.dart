import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/utils/text.dart';

class DescriptionTV extends StatelessWidget {
  const DescriptionTV({
    super.key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    // required this.launch_on,
  });

  final String name;
  final String description;
  final String bannerurl;

  final String posterurl;
  final double vote;
  //final String launch_on;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  child: ModifiedText(
                    text: '⭐Average Rating: ${vote.abs()}',
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ModifiedText(
                text: name != null ? name : 'Not Loaded',
                color: Colors.white,
                size: 24),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: ModifiedText(
                text: 'Releasing on -', color: Colors.white, size: 16),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 200,
                width: 120,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                  child: ModifiedText(
                      text: description, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
