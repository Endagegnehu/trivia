import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:trivia/core/error/failures.dart';
import 'package:trivia/core/usecase/usecase.dart';
import 'package:trivia/features/number_trivia/domain/entities/number_trivia.dart';

import '../repositories/number_trivia_repositories.dart';

class GetConcretNumberTrivia implements Usecase<NumberTrivia, Params> {
  final NumberTriviaRepositories repository;

  GetConcretNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcretNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({@required this.number});
  @override
  List<Object> get props => [number];
}
