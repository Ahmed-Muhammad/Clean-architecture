import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart ' as http;

import '../../../../../core/errors/exceptions.dart';
import '../../models/post_models.dart';

//سبب انه abstract class عشان اقدر اعلمه implements عدد لانهائي من
// المرات في اي class مرتبط بال APIs يعني مثلا في حاله اني بتعامل مع HTTP
//وحصلها اي عطل او وقفت اقدر اعمله implements للـ DIO بكل سهوله
abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPosts(PostModel postModel);
  Future<Unit> deletePosts(int postId);
  Future<Unit> updatePosts(PostModel postModel);
}

const BASE_URL = 'https://jsonplaceholder.typicode.com';

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(
      Uri.parse(BASE_URL + '/posts/'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final List decodedJson = jsonDecode(response.body) as List;
      final List<PostModel> postModels = decodedJson
          .map<PostModel>(
              (jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPosts(PostModel postModel) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePosts(int postId) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePosts(PostModel postModel) {
    // TODO: implement updatePosts
    throw UnimplementedError();
  }
}
