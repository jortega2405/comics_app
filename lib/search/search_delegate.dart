

import 'package:comics_app/models/comic_model.dart';
import 'package:comics_app/providers/comic_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ComicSearchDelegate extends SearchDelegate{

  @override
  String get searchFieldLabel => 'Search Comic';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear)
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: (){
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios_new_outlined)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('buildResults');
  }

  Widget _emptyContainer(){
    return const SizedBox(
        child: Center(
          child: Icon(
            Icons.movie_creation_outlined,
            color: Colors.black38,
            size: 300,
          ),
        ),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final  comicsProvider = Provider.of<ComicProvider>(context, listen: false);
    comicsProvider.getSuggestionsByQuery(query);
    return StreamBuilder(
      stream: comicsProvider.suggestionStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return _emptyContainer();

        final comic = snapshot.data!;
        return ListView.builder(
          itemBuilder: (context, index) {
            return  _ComicItem(comic: comic[index]);
          },
          itemCount: comic.length,
        ); 
      },
    );
  }
}

class _ComicItem extends StatelessWidget {
  final Comic comic;
  const _ComicItem({
    required this.comic
  });

  @override
  Widget build(BuildContext context) {
    comic.heroId = 'search-${comic.id}';
    return ListTile(
      leading: Hero(
        tag: comic.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/images/no-image.jpg'),
          image: NetworkImage(comic.fullPosterImg),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title:Text(comic.name!), 
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: comic);
      },
    );
  }
}