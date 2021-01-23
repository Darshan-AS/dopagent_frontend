import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/auth/auth_failure.dart';
import 'package:dopagent_frontend/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> signUpWithEmail({
    required Email email,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmail({
    required Email email,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
