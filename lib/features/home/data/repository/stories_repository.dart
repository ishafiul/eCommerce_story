import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sample_project/features/home/data/models/stories_model.dart';

class StoriesRepository {
  Future<Stories> getAllStories() async {
    final String response = await rootBundle.loadString('assets/stories_data.json');
    final data = await json.decode(response);
    final Stories stories = Stories.fromJson(data);
    return stories;
  }
}
