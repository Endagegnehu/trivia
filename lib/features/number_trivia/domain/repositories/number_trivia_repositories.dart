import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/number_trivia.dart';

abstract class NumberTriviaRepositories {
  Future<Either<Failure,NumberTrivia>> getConcretNumberTrivia(int num);
  Future<Either<Failure,NumberTrivia>> getRandomNumberTrivia();
}
