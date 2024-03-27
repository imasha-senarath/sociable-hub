import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  User? user = FirebaseAuth.instance.currentUser;

  final CollectionReference postsReference =
      FirebaseFirestore.instance.collection('Posts');

  Future<void> addPost(String message) {
    return postsReference.add({
      'userEmail': user?.email,
      'message': message,
      'time': Timestamp.now()
    });
  }

  Stream<QuerySnapshot> getPostStream() {
    final postsStream = FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('time', descending: true)
        .snapshots();
    return postsStream;
  }
}
