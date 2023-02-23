import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/post.dart';
import '../repository/posts_repository.dart';

class UpdatePostUsaCase{
  final  PostsRepository repository;

  UpdatePostUsaCase(this.repository);
  Future<Either<Failure,Unit>> call(Post post )async{
    return await repository.updatePost(post);
  }
}
