import 'package:dartz/dartz.dart';

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

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> addPosts(PostModel postModel) {
    // TODO: implement addPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePosts(int postId) {
    // TODO: implement deletePosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePosts(PostModel postModel) {
    // TODO: implement updatePosts
    throw UnimplementedError();
  }
}
