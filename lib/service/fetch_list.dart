import 'package:flutter_redux_demo/models/item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';


class PostService {
  static Future<Item> fetchRandomPost() async {
    var rng = new Random();
    var postID = rng.nextInt(100);
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/$postID');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return Item.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}