import 'package:equatable/equatable.dart';


//Equatable
//هي تساعد في عمل  implements لداله hashcode
//اللي بتخليني اقارن objects ببعض

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
