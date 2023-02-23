
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/post.dart';
import '../repository/posts_repository.dart';

class GetAllPostsUsaCase{
final  PostsRepository repository;

GetAllPostsUsaCase(this.repository);
Future<Either<Failure,List<Post>>> call()async{
  return await repository.getAllPosts();
}
}

