import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:trivia/features/number_trivia/domain/repositories/number_trivia_repositories.dart';
import 'package:trivia/features/number_trivia/domain/usecases/get_concret_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepositories {}

void main() {
  GetConcretNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcretNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test('Should get number trivia from repository', () async {
    // arrange
    when(mockNumberTriviaRepository.getConcretNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));
    // act 
    final result = await usecase(Params(number: tNumber));

    // assert
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcretNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
