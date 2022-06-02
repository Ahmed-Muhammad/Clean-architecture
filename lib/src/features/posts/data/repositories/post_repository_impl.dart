import 'package:clean_architecture/src/features/posts/data/models/post_models.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/posts.dart';
import '../../domain/repositories/posts_repositories.dart';
import '../datasources/local/post_local_data_source.dart';
import '../datasources/remote/post_remote_data_source.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostsRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isDeviceConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    final PostModel postModel =
        PostModel(body: post.body, title: post.title, id: post.id);

    return await _getMassage(() {
      return remoteDataSource.addPosts(postModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    return await _getMassage(() {
      return remoteDataSource.deletePosts(postId);
    });
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final PostModel postModel =
        PostModel(body: post.body, title: post.title, id: post.id);
    return await _getMassage(() {
      return remoteDataSource.updatePosts(postModel);
    });
  }

  Future<Either<Failure, Unit>> _getMassage(
      Future<Unit> Function() DeleteOrUpdateOrAdd) async {
    if (await networkInfo.isDeviceConnected) {
      try {
        await DeleteOrUpdateOrAdd();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
