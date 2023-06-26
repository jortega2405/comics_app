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
  late DetailComicModel detail;

  @override
  Widget build(BuildContext context) {
    final Comic comic = ModalRoute.of(context)!.settings.arguments as Comic;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(comic: comic),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _Description(),
                _Characters(),
                _TeamCredits(),
                _Locations(),
                _Concepts(),
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
  @override
  Widget build(BuildContext context) {
    final comicProvider = Provider.of<ComicProvider>(context);
    final details = comicProvider.details;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: details.isNotEmpty
          ? Html(
              data: details[0].results!.description!,
            )
          : Container(),
    );
  }
}

class _Characters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final comicProvider = Provider.of<ComicProvider>(context);
    final details = comicProvider.details;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Character Credits:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          if (details != null && details.isNotEmpty && details[0].results != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: details[0].results!.characterCredits!
                  .map(
                    (character) => Text(
                      character.name!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}

class _TeamCredits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final comicProvider = Provider.of<ComicProvider>(context);
    final details = comicProvider.details;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Team Credits:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          if (details != null && details.isNotEmpty && details[0].results != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: details[0].results!.teamCredits!.isNotEmpty
                  ? details[0].results!.teamCredits!
                      .map(
                        (team) => Text(
                          team.name!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                      .toList()
                  : [ const Text('No teams for this comic')],
            ),
          if (details != null && details.isNotEmpty && details[0].results != null)
            const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final comicProvider = Provider.of<ComicProvider>(context);
    final details = comicProvider.details;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Locations:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          if (details != null && details.isNotEmpty && details[0].results != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: details[0].results!.locationCredits!.isNotEmpty
                  ? details[0].results!.locationCredits!
                      .map(
                        (location) => Text(
                          location.name!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                      .toList()
                  : [ const Text('No locations for this comic')],
            ),
          if (details != null && details.isNotEmpty && details[0].results != null)
            const SizedBox(height: 20),
        ],
      ),
    );
  }
}


class _Concepts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final comicProvider = Provider.of<ComicProvider>(context);
    final details = comicProvider.details;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Concepts:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          if (details != null && details.isNotEmpty && details[0].results != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: details[0].results!.conceptCredits!.isNotEmpty
                  ? details[0].results!.conceptCredits!
                      .map(
                        (concept) => Text(
                          concept.name!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                      .toList()
                  : [ const Text('No concept for this comic')],
            ),
          if (details != null && details.isNotEmpty && details[0].results != null)
            const SizedBox(height: 20),
        ],
      ),
    );
  }
}











