import 'package:clean_arc/core/error/exception.dart';
import 'package:clean_arc/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/chech_internet_conection.dart';
import '../../domin/entities/post.dart';
import '../../domin/repository/posts_repository.dart';
import '../data_source/post_local_data_source.dart';
import '../data_source/post_remote_data_source.dart';
import '../models/post_model.dart';

 typedef DeleteOrUpdateOrAddPost = Future<Unit> Function();

class PostsRepositoryImp implements PostsRepository{
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource postLocalDataSource;
  final NetworkInfo networkInfo;

  PostsRepositoryImp(this.remoteDataSource, this.postLocalDataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if(await networkInfo.isConnected){
      try{
        final remotePost = await remoteDataSource.getAllPost();
        postLocalDataSource.cachedPost(remotePost);
        return Right(remotePost);

      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      try{
        final localPost = await postLocalDataSource.getCachedPost();
        return Right(localPost);
      }on EmptyCashException{
        return Left(EmptyCashFailure());
      }
    }
  }



  @override
  Future<Either<Failure, Unit>> addPost(Post post) async{
    final PostModel postModel=PostModel(id: post.id, title: post.title, body: post.body);
   return await _getMessage((){
    return  remoteDataSource.addPost(postModel);
   });
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async{
    return await _getMessage((){
      return  remoteDataSource.deletePost(postId);
    });
  }


  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async{
    final PostModel postModel=PostModel(id: post.id, title: post.title, body: post.body);
    return await _getMessage((){
      return  remoteDataSource.updatePost(postModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(DeleteOrUpdateOrAddPost addOrUpdateOrDelete)async{
    if(await networkInfo.isConnected){
      try{
        await addOrUpdateOrDelete();
        return const Right(unit);
      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

}