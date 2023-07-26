import 'package:comics_app/providers/comic_provider.dart';
import 'package:comics_app/search/search_delegate.dart';
import 'package:comics_app/widgets/card_swiper.dart';
import 'package:comics_app/widgets/comic_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ComicProvider>(context, listen: false).fetchComics();
    Provider.of<ComicProvider>(context, listen: false).getPopularComics();
  }

  @override
  Widget build(BuildContext context) {
    final comicProvider= Provider.of<ComicProvider>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Comic App'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: ComicSearchDelegate());
              },
              icon: const Icon(Icons.search_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiperWidget(
                  comics: comicProvider.comics,
            ),
            ComicSliderWidget(
                comics: comicProvider.popularComics,
                title: 'Popular Movies',
                onNextPage: () => comicProvider.getPopularComics()),
          ],
        ),
      )
    );
  }
}
