import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../entities/posts.dart';
import '../repositories/posts_repositories.dart';

//Call functions is for making the class callable
//for instance : if we want to use it -->
//  AddPostUseCase() or AddPostUseCase.call()
class AddPostUseCase {
  final PostsRepository repository;

  AddPostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.addPost(post);
  }
}
