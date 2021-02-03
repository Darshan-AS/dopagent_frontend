import 'package:dopagent_frontend/domain/auth/agent.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserDomain on User {
  Agent toDomain() {
    return Agent(id: UniqueId.fromUniqueString(uid));
  }
}
