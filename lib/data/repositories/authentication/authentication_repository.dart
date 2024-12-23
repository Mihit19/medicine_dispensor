import 'package:apptofiretorasbpi/data/repositories/data/user_repository.dart';
import 'package:apptofiretorasbpi/features/authentication/screens/login/login.dart';
import 'package:apptofiretorasbpi/features/authentication/screens/signup/verify_email.dart';
import 'package:apptofiretorasbpi/features/personalization/screens/profile/sample_screens/homeScreen.dart';
import 'package:apptofiretorasbpi/utils/local_storage/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///get authenticated user data
  User? get authUser => _auth.currentUser;

  /// called from main.dart on app launch
  @override
  void onReady() {
    screenRedirect();
  }

  ///Function to show relevant Screen
  void screenRedirect() async {
    final user =_auth.currentUser;
    if(user !=null){
      if(user.emailVerified){
        await EELocalStorage.init(user.uid);
        Get.offAll(() => const HomeScreen());
      }else{
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }else{
      //Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const LoginScreen());
    }

  }
/* ---------------------------------Email & Password sign-in-------------------*/

  ///[Email authentication] - sign in
  Future<UserCredential> loginWithEmailAndPassword(String mail, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: mail, password: password);
    } on FirebaseAuthException catch(e){
      throw FirebaseAuthException(code: e.code, message: 'User registration failed: ${e.message}');
    } on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
  ///[Email authentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(String mail, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: mail, password: password);
    } on FirebaseAuthException catch(e){
      throw FirebaseAuthException(code: e.code, message: 'User registration failed: ${e.message}');
    } on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///[Email authentication] - mail verification
  Future<void> sendEmailVerification() async{
    try{
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch(e){
      throw FirebaseAuthException(code: e.code, message: 'User registration failed: ${e.message}');
    } on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///[Email authentication] - forget password
  Future<void> sendPasswordResetEmail(String email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e){
      throw FirebaseAuthException(code: e.code, message: 'User registration failed: ${e.message}');
    } on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
  
  ///[ReAuthentication] -re authenticate user
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async{
    try{
      //create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email,password: password);
      
      //re-authenticate user
      await _auth.currentUser?.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch(e){
      throw FirebaseAuthException(code: e.code, message: 'User registration failed: ${e.message}');
    } on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }



  /*------------------------------Federated identity & social sign-in------------------------------------*/
  ///[googleAuthentication] - GOOGLE
  Future<UserCredential> signInWithGoogle() async{
    try{
      //Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );

      // once signed in, return the userCredential
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch(e){
      throw FirebaseAuthException(code: e.code, message: 'User registration failed: ${e.message}');
    } on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
  /*------------------------------END Federated identity & social sign-in------------------------------------*/

  ///[logout user] - valid for any authentication
  Future<void> logout() async{
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch(e){
      throw FirebaseAuthException(code: e.code, message: 'User registration failed: ${e.message}');
    } on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///DELETE USER -remove user auth and firestore account
  Future<void> deleteAccount() async{
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch(e){
      throw FirebaseAuthException(code: e.code, message: 'User registration failed: ${e.message}');
    } on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}
