import 'package:equatable/equatable.dart';

//  entities
//هي عباره عن model ولكن بشكل اصغر
//لا نسنخدم فيها أي  constructor
//له علاقه بالــ JSON
// مثل to json او from json
//--------------------------------------//
//Equatable
//هي تساعد في عمل  implements لداله hashcode
//اللي بتخليني اقارن objects ببعض

class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  //This override for Equatable package
  @override
  List<Object?> get props => [id, title, body];
}
