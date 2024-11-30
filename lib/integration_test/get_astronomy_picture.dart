import 'package:astronomy_app/core/error/failure.dart';
import 'package:astronomy_app/features/Astronomy/data/Models/astronomy_picture_model.dart';
import 'package:astronomy_app/features/Astronomy/domain/repository_interfaces/astronomy_repository.dart';
import 'package:astronomy_app/features/Astronomy/domain/usecases/get_astronomy_picture.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

// Mock the AstronomyRepository
class MockAstronomyRepository extends Mock implements AstronomyRepository {}

void main() {
  late GetAstronomyPicture useCase;
  late MockAstronomyRepository mockAstronomyRepository;

  setUp(() {
    mockAstronomyRepository = MockAstronomyRepository();
    useCase = GetAstronomyPicture(mockAstronomyRepository);
  });

  group('GetAstronomyPicture', () {
    final astronomyPicture = AstronomyPicture(
      url: 'https://example.com/image.jpg',
      explanation: 'A beautiful picture of the universe',
    );

    test('should return AstronomyPicture when the repository returns success', () async {
      // Arrange
      when(mockAstronomyRepository.getAstronomyPicture())
          .thenAnswer((_) async => Right(astronomyPicture));

      // Act
      final result = await useCase();

      // Assert
      expect(result, Right(astronomyPicture));
      verify(mockAstronomyRepository.getAstronomyPicture());
      verifyNoMoreInteractions(mockAstronomyRepository);
    });

    test('should return Failure when the repository returns an error', () async {
      // Arrange
      final failure = Failure( 'Something went wrong');
      when(mockAstronomyRepository.getAstronomyPicture())
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, Left(failure));
      verify(mockAstronomyRepository.getAstronomyPicture());
      verifyNoMoreInteractions(mockAstronomyRepository);
    });
  });
}
