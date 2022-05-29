import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../repositories/posts_repositories.dart';

class DeletePostUseCase {
  final PostsRepository repository;

  DeletePostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(int PostId) async {
    return await repository.deletePost(PostId);
  }
}
