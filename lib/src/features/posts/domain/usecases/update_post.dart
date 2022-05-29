import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../entities/posts.dart';
import '../repositories/posts_repositories.dart';

class UpdatePostUseCase {
  final PostsRepository repository;

  UpdatePostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatePost(post);
  }
}
