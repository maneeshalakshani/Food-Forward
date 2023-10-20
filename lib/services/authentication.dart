import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_forward/services/auth_state.dart';

class Authentications{
  
  Future<void> registerVolunteerWithEmailAndPassword({
    required String userType,
    required String email, 
    required String password, 
    required String name, 
    required String address, 
    required String phone,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      await user?.updateProfile(displayName: name).then((value) async {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'address': address,
          'userType': userType,
        }).then((value) {

          Fluttertoast.showToast(
            msg: "Volunteer User Added Successfully!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
          );

          //redirect to login
          context.router.pop();

        });
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> registerDonorWithEmailAndPassword({
    required String userType,
    required String email, 
    required String password, 
    required String name, 
    required String hotelName,
    required String hotelLocation,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      await user?.updateProfile(displayName: name).then((value) async {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'password': password,
          'hotelLocation': hotelLocation,
          'hotelName': hotelName,
          'userType': userType,
        }).then((value) {

          Fluttertoast.showToast(
            msg: "Donor User Added Successfully!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
          );

          //redirect to login
          context.router.pop();

        });
      });
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(
            msg: "Registration Failed: ${e}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
          );
    }
  }

  Future<void> registerRecipientWithEmailAndPassword({
    required String userType,
    required String email, 
    required String password, 
    required String name, 
    required String address, 
    required String phone,
    required String city,
    required String preference,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      await user?.updateProfile(displayName: name).then((value) async {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'address': address,
          'city': city,
          'preference': preference,
          'userType': userType,
        }).then((value) {
          Fluttertoast.showToast(
            msg: "Recipient User Added Successfully!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
          );

          //redirect to login
          context.router.pop();

        });
      });
    } catch (e) {
      print("Error: $e");
    }
  }


  Future<void> loginWithEmailAndPassword({
    required String email, 
    required String password, 
    required String userType,
    required BuildContext context,
    required route,
    required AuthStore store,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After successful login, check the userType from the database
      final User? user = userCredential.user;
      final uid = user?.uid;

      final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userDoc.exists) {
        final userType = userDoc['userType'];

        if (userType == userType) {
          // User is logged in and has userType required
          Fluttertoast.showToast(
            msg: "Login Success",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
          );
          store.setUserId(userId: user!.uid);
          userDoc['userType'] == 'recipient'
            ? store.setFoodPreference(foodPreference: userDoc['preference'])
            : null;
          context.router.push(route);
        } else {
          // User is not a userType
          print("You are not a $userType");
          Fluttertoast.showToast(
            msg: "You are not a $userType",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
          );
          logout();
        }
      } else {
        print("You have to register");
        Fluttertoast.showToast(
            msg: "You are not yet registered",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
          );
      }
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.message}");
      Fluttertoast.showToast(
            msg: "Login Failed: ${e.message!.split("[")[1]}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
          );
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      // The user is successfully logged out.
      Fluttertoast.showToast(
            msg: "Logout Success",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
          );
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  Future<Map<String, dynamic>?> getCurrentUser() async {
    // Check if a user is currently authenticated
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      print("User ID: ${user.uid}");

      DocumentSnapshot userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

      if (userData.exists) {
        Map<String, dynamic> userDataMap = userData.data() as Map<String, dynamic>;
        // String name = userDataMap['name'];
        // String email = userDataMap['email'];
        
        return userDataMap;
      }
    }
    return null; // Return null if there is no authenticated user or user data is not found
  }

  getCurrentUserId(){
    User? user = FirebaseAuth.instance.currentUser;
    return user!.uid;
  }


}