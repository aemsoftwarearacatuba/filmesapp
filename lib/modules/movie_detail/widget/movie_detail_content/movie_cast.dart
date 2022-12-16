import 'package:filmes_soumei/application/ui/filmes_extensions.dart';
import 'package:filmes_soumei/models/cast_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieCast extends StatelessWidget {
  final CastModel? cast;
  const MovieCast({Key? key, this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: cast?.image != null && cast?.image != ''
                  ? 'https://image.tmdb.org/t/p/w200${cast?.image}'
                  : 'https://ciclesradar.com.br/images/sem_foto.png',
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            cast?.name ?? '',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Text(
            cast?.character ?? '',
            style: TextStyle(fontSize: 12, color: context.themeGrey),
          ),
        ],
      ),
    );
  }
}
