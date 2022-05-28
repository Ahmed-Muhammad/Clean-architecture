import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../entities/posts.dart';
import '../repositories/post_repositories.dart';

class GetAllPostsUseCase {
  final PostRepository repository;

  GetAllPostsUseCase(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}
