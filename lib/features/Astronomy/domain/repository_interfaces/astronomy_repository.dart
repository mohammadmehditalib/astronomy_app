import 'package:dartz/dartz.dart';
import 'package:astronomy_app/core/error/failure.dart';
import 'package:astronomy_app/features/Astronomy/data/Models/astronomy_picture_model.dart';


abstract class AstronomyRepository {
  Future<Either<Failure, AstronomyPicture>> getAstronomyPicture();
}
