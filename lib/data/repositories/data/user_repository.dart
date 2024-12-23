import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:apptofiretorasbpi/data/repositories/authentication/authentication_repository.dart';
import 'package:apptofiretorasbpi/features/authentication/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///function to store user data to firestore
  Future<void> saveUserRecord(UserModel user) async{
    try{
       await _db.collection("Users").doc(user.id).set(user.toJson());
    }  on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
  ///function to fetch user details based on id
  Future<UserModel> fetchUserDetails() async{
    try{
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    }  on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
  ///function to update user data in firestore
  Future<void> updateUserDetails(UserModel updatedUser) async{
    try{
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
    }  on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
  ///update any field in specific users collection
  Future<void> updateSingleField(Map<String, dynamic> json) async{
    try{
      await _db.collection("Users").doc().update(json);
    }  on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
  ///function to remove user data from firestore
  Future<void> removeUserRecord(String userId) async{
    try{
      await _db.collection("Users").doc(userId).delete();
    }  on FirebaseException catch(e){
      throw FirebaseException(plugin: e.code, message: 'No app Exists');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch(e){
      throw PlatformException(code: e.code);
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
  ///upload any image
  Future<String> uploadImage(String path,XFile image)async{
    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    }  on FirebaseException catch(e){
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