import 'package:flutter/foundation.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmailAddress {
  final String value;
  final Either<Left, Rigth> failure;

  factory EmailAddress(String input){
    assert(input != null )
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  EmailAddress._(this.value, this.failure);
  @override
  String toString() => 'EmailAddress(value: $value)';

  @override
  bool operator ==(covariant EmailAddress other) {
    if (identical(this, other)) return true;
  
    return 
      other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
  

}

  String validateEmailAddress(String input){
    const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

    if (RegExp(emailRegex).hasMatch(input)){
      return input;
    } else {
      throw InvalidEmailException(failedValue: input)
    }
  }
  @freezed
  abstract class ValueFailure<T> with _$ValueFailure<T>{
    const factory VAlueFailure.invalidEmail({
      @required String failedValue, 
    }) = InvalidEmail<T>;
  }

  abstract class Failure{

    

  }
  

  class InvalidEmailFailure implements Failure{
    final String failedValue;
    InvalidEmailFailure({@required this.failedValue})
  }
  class InvalidPassword implements Failure{
    final String failedValue;
    InvalidPassword({@required this.failedValue})
  }

  