import 'package:dartz/dartz.dart';

import '../../models/post_models.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();

  Future<Unit> CachePosts(List<PostModel> PostModels);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  @override
  Future<Unit> CachePosts(List<PostModel> PostModels) {
    // TODO: implement CachePosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    // TODO: implement getCachedPosts
    throw UnimplementedError();
  }
}
