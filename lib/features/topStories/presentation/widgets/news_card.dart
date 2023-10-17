import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/config/app_configs.dart';
import 'package:flutter_assessment/features/topStories/domain/entities/multimedia.dart';
import 'package:flutter_assessment/features/topStories/domain/entities/results.dart';

class NewsCard extends StatelessWidget {
   final ResultsEntity resultsEntity;
  const NewsCard({ Key? key, required this.resultsEntity, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      height: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:  resultsEntity.multimedia[0].url ?? AppConfigs.imageNotFound,
                errorWidget: (context, string, _) {
                  return const Icon(Icons.error);
                },
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              )
          ),
          const SizedBox(
            width: 10,
            height: 10,
          ),

          Expanded(
            flex: 1,
            child:Column(
            children: [
              Text(
              resultsEntity.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              )),
              const SizedBox(
                height: 10,
              ),
            Text(
          resultsEntity.byline,
          style: const TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold
          )
      )
    ],
    )
          )
        ],
      ),
    );
  }
}