import 'package:dartz/dartz.dart';
import 'package:astronomy_app/core/error/failure.dart';
import 'package:astronomy_app/features/Astronomy/data/Models/astronomy_picture_model.dart';
import 'package:astronomy_app/features/Astronomy/data/datasources/ApiService.dart';
import 'package:astronomy_app/features/Astronomy/domain/repository_interfaces/astronomy_repository.dart';

class AstronomyRepositoryImpl implements AstronomyRepository {
  final ApiService apiService;

  AstronomyRepositoryImpl(this.apiService);

  @override
  Future<Either<Failure, AstronomyPicture>> getAstronomyPicture() async {
    try {
      final response = await apiService.fetchAstronomyPicture();
      final astronomyPicture = AstronomyPicture(
        url: response['url'],
        explanation: response['explanation'],
      );
      return Right(astronomyPicture);
    } catch (e) {
      return Left(Failure('Failed to fetch astronomy picture'));
    }
  }
}
