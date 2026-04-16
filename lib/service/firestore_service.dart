// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser ({
    required String firebaseUid,
    required String name,
    required String email,
    required String role,
    required String authProvider
    }) async {
    await _db.collection('users').doc(firebaseUid).set({
      'name': name,
      'email': email,
      'role': role,
      'authProvider': authProvider,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<Map<String, dynamic>?> getUserByUid(String uid) async {
    try {
      final userDoc = await _db.collection('users').doc(uid).get();
      if (userDoc.exists) {
        return userDoc.data();
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
    return null;
  }

}
