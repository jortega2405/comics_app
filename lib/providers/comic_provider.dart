import 'dart:async';
import 'dart:convert';
import 'package:comics_app/models/details_model.dart';
import 'package:comics_app/utils/debouncer.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:comics_app/models/comic_model.dart';

class ComicProvider with ChangeNotifier {
  final String baseUrl = 'https://comicvine.gamespot.com/api';
  final String apiKey = 'b3ce2f87d3600c9af82c82924d00ea9bd8bbbec2';

  List<Comic> comics = [];
  List<Comic> popularComics = [];
  Map<String, DetailComicModel> details = {};

   final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500)
  );

  final StreamController<List<Comic>> _suggestionsStreamController = StreamController.broadcast();

  Stream<List<Comic>> get suggestionStream => _suggestionsStreamController.stream;



  Future<void> fetchComics() async {
    final String url = '$baseUrl/issues/?api_key=$apiKey&format=json';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> results = data['results'];
        comics = results.map((json) => Comic.fromJson(json)).toList();
        print('Comics cargados: $comics');
        notifyListeners();
      } else {
        print(
            'Error al obtener los cómics. Código de respuesta: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener los cómics: $e');
    }
  }

  Future<void> getPopularComics() async {
    final String url =
        '$baseUrl/issues/?api_key=$apiKey&format=json&sort_by=-popularity';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> results = data['results'];
        popularComics = results.map((json) => Comic.fromJson(json)).toList();
        print('Popular comics cargados: $popularComics');
        notifyListeners();
      } else {
        print(
            'Error al obtener los cómics populares. Código de respuesta: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener los cómics populares: $e');
    }
  }

   Future<DetailComicModel> getComicDetails(String apiDetailUrl) async {
    final url = Uri.parse('$apiDetailUrl?api_key=$apiKey&format=json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final detailComicModel = DetailComicModel.fromMap(data);
      details[apiDetailUrl] = detailComicModel; // Almacena los detalles usando el apiDetailUrl como clave
      notifyListeners();
      return detailComicModel;
    } else {
      throw Exception('Failed to fetch comic details');
    }
  }

  Future<List<Comic>> searchComics(String query) async {
  final encodedQuery = Uri.encodeComponent(query);
  final url = '$baseUrl/search/?api_key=$apiKey&format=json&query=$encodedQuery&resources=issue';
  
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      final List<Comic> searchResults = results.map((json) => Comic.fromJson(json)).toList();
      return searchResults;
    } else {
      throw Exception('Error al buscar los cómics. Código de respuesta: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error al buscar los cómics: $e');
  }
}

 void getSuggestionsByQuery(String searchTerm){
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchComics(value);
      _suggestionsStreamController.add(results);
    };

    final timer = Timer.periodic(
      const Duration(milliseconds: 300),
      (_) { 
        debouncer.value = searchTerm; 
      }
    );
    Future.delayed(const Duration(milliseconds: 301)).then((_) => timer.cancel());
  }


  
}
