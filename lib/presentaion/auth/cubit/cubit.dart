import 'package:camerastore/presentaion/auth/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(initialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool emailVerified = false;
  String? a;
  String? b;
  String? c;
  bool obscureText = true;
  Map profileMap = {};
  String emilv = "";
  String emailExption = "";
  String passExption = "";
  String emaile = "";
  String passe = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  SignInWithEamilandPass(email, pass) async {
    print(email);
    print(pass);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );}on FirebaseAuthException catch (e){
      if (e.code == 'email-already-in-use') {
        emailExption=e.code;
        // print('The account already exists for that email.');
      }
    }
    emit(SuccessState());
  }
  SignupWithEmailandpass(emailAddress, password, name,) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      sendData(FirebaseAuth.instance.currentUser!.uid, emailAddress, name);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      }  if (e.code == 'email-already-in-use') {
        emailExption="email already in use";
      }
      emit(SignUpExptionState());
    } catch (e) {
      print(e);
    }
    emit(SignUpState());
  }
  sendData(uid, email, name) async {
    await FirebaseFirestore.instance.collection("Profile").doc(uid).set({
      "email": email,
      "name": name,
    });
    emit(SetDataState());
  }

  profile() async {
    await FirebaseFirestore.instance.collection("Profile").doc(
        FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      profileMap = value.data()!;
    });
    print(profileMap);
    emit(ProfileState());
  }

  Future<User?> googleAuth() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


}