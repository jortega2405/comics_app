
import 'package:comics_app/models/comic_model.dart';
import 'package:flutter/material.dart';


class ComicSliderWidget extends StatefulWidget {

  final List<Comic> comics;
  final String? title;
  final Function onNextPage;

  const ComicSliderWidget({
    super.key,
    required this.comics,
    this.title,
    required this.onNextPage,
  });

  @override
  State<ComicSliderWidget> createState() => _ComicSliderWidgetState();
}

class _ComicSliderWidgetState extends State<ComicSliderWidget> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
        //  print('get next page'); 
      }
      // print(scrollController.position.pixels);
      // print(scrollController.position.maxScrollExtent);
     });
  }


  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.title != null)
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Text(
              widget.title!,
               style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
           ),
           const SizedBox(height: 5),
           Expanded(
             child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.comics.length,
              itemBuilder: (context, index) => 
                _ComicPoster(
                  comic: widget.comics[index],
                  heroId: '${widget.title}-$index-${widget.comics[index].id}',
              ),
            ),
           )
        ],
      ),
    );
  }
}

class _ComicPoster extends StatelessWidget {
  final Comic comic;
  final String heroId;

  const _ComicPoster({ required this.comic, required this.heroId});
  @override
  Widget build(BuildContext context) {

    comic.heroId = heroId; 
     
    return Container(
        width: 130,
        height: 190 ,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                'details',
                arguments: comic
              ),
              child: Hero(
                tag: comic.heroId!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/images/no-image.jpg'),
                    image: NetworkImage(comic.fullPosterImg),
                    width: 130,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
              Text(
              comic.name!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
  }
}