import 'package:card_swiper/card_swiper.dart';
import 'package:comics_app/models/comic_model.dart';
import 'package:comics_app/providers/comic_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardSwiperWidget extends StatelessWidget {
  final List<Comic> comics;

  const CardSwiperWidget({super.key, required this.comics});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (comics.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: comics.length,
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 0.4,
        itemWidth: size.width * 0.5,
        itemBuilder: (context, index) {
          final comic = comics[index];
          comic.heroId = 'swiper-${comic.id}';
          return GestureDetector(
            onTap: () {
              final comicProvider = Provider.of<ComicProvider>(context, listen: false);
              comicProvider.getComicDetails(comic.apiDetailUrl!);
              Navigator.pushNamed(context, 'details', arguments: comic);
            },
            child: Hero(
              tag: comic.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/no-image.jpg'),
                  image: NetworkImage(comic.fullPosterImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
