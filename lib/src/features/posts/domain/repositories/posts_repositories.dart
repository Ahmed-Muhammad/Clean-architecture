import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/posts.dart';

//repositories will be abstract class because
//it is shared between domain layer and  data layer
//it will be implemented to data layer
//-----------------------------------------------
// in domain layer we write the needed functions
//and in data layer we execute these functions
//-----------------------------------------------
//we used dartz (functional programming) for Failures
//which helps with choosing the outcome of functions
//by using Either
//------
//Unit is for returning nothing like(void)
abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();

  Future<Either<Failure, Unit>> deletePost(int id);

  Future<Either<Failure, Unit>> updatePost(Post post);

  Future<Either<Failure, Unit>> addPost(Post post);
}
