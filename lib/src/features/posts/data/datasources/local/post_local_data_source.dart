import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../models/post_models.dart';

abstract class PostLocalDataSource {
  Future<Unit> cachePosts(List<PostModel> PostModels);

  Future<List<PostModel>> getCachedPosts();
}

const CACHED_POSTS = 'CACHED_POSTS';

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachePosts(List<PostModel> PostModels) {
    List postModelsToJson = PostModels.map<Map<String, dynamic>>(
        (postModel) => postModel.toJson()).toList();
    sharedPreferences.setString(
        CACHED_POSTS, jsonEncode(postModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if (jsonString != null) {
      List decodeJsonData = jsonDecode(jsonString);
      List<PostModel> jsonToPostModel = decodeJsonData
          .map<PostModel>(
              (jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
