import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../repositories/post_repositories.dart';

class DeletePostUseCase {
  final PostRepository repository;

  DeletePostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(int PostId) async {
    return await repository.deletePost(PostId);
  }
}
