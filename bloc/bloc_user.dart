import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  // Flujo de datos - STREAMS
  // Stream - Firebase
  // StreamController
  Stream<FirebaseUser> _streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;

  Stream<FirebaseUser> get authStatus => _streamFirebase;

  // Casos uso
  // 1- Sign in a la aplicacion Google
  Future<FirebaseUser> signIn() {
    return _authRepository.signInFirebase();
  }

  // 2- Sign out
  signOut() {
    _authRepository.signOut();
  }

  @override
  void dispose() {}
}
