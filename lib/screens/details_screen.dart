import 'package:comics_app/models/comic_model.dart';
import 'package:comics_app/models/details_model.dart';
import 'package:comics_app/providers/comic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final comicProvider = Provider.of<ComicProvider>(context, listen: false);
    final Comic comic = ModalRoute.of(context)!.settings.arguments as Comic;
    comicProvider.getComicDetails(comic.apiDetailUrl!);
  }

  @override
  Widget build(BuildContext context) {
    final comicProvider = Provider.of<ComicProvider>(context);
    final Comic comic = ModalRoute.of(context)!.settings.arguments as Comic;
    final detail = comicProvider.details[comic.apiDetailUrl!];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(comic: comic),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                if (detail != null) ...[
                  _Description(detail: detail),
                  _Characters(detail: detail),
                  _Locations(detail: detail),
                  _Concepts(detail: detail),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Comic comic;

  const _CustomAppBar({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = comic.name ?? 'No title available';

    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          width: double.infinity,
          child: Text(
            '$title: ${comic.issueNumber}',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/gifs/loading.gif'),
          image: NetworkImage(comic.imageUrl!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final DetailComicModel detail;

  const _Description({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: detail.results!.description != null
          ? Html(
              data: detail.results!.description!,
            )
          : const Text('No description available'),
    );
  }
}

class _Characters extends StatelessWidget {
  final DetailComicModel detail;

  const _Characters({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Character Credits:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: detail.results!.characterCredits!.isNotEmpty
                ? detail.results!.characterCredits!
                    .map(
                      (character) => Text(
                        character.name ?? 'No data available',
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                    .toList()
                : [const Text('No data available')],
          ),
        ],
      ),
    );
  }
}



class _Locations extends StatelessWidget {
  final DetailComicModel detail;

  const _Locations({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Locations:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: detail.results!.locationCredits!.isNotEmpty
                ? detail.results!.locationCredits!
                    .map(
                      (location) => Text(
                        location.name ?? 'No data available',
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                    .toList()
                : [const Text('No data available')],
          ),
        ],
      ),
    );
  }
}

class _Concepts extends StatelessWidget {
  final DetailComicModel detail;

  const _Concepts({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Concepts:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: detail.results!.conceptCredits!.isNotEmpty
                ? detail.results!.conceptCredits!
                    .map(
                      (concept) => Text(
                        concept.name ?? 'No data available',
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                    .toList()
                : [const Text('No data available')],
          ),
        ],
      ),
    );
  }
}
