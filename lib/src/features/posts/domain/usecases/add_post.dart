import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../entities/posts.dart';
import '../repositories/post_repositories.dart';

class AddPostUseCase {
  final PostRepository repository;

  AddPostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.addPost(post);
  }
}
