import 'package:dartz/dartz.dart';
import 'package:astronomy_app/core/error/failure.dart';
import 'package:astronomy_app/features/Astronomy/data/Models/astronomy_picture_model.dart';
import 'package:astronomy_app/features/Astronomy/domain/repository_interfaces/astronomy_repository.dart';


class GetAstronomyPicture {
  final AstronomyRepository repository;

  GetAstronomyPicture(this.repository);

  Future<Either<Failure, AstronomyPicture>> call() async {
    return await repository.getAstronomyPicture();
  }
}
