import 'package:alemeno/core/providers.dart';

import 'package:alemeno/models/test_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final homeRepoProvider = Provider(
    (ref) => HomeRepo(cfirestore: ref.watch(firestoreProvider), cref: ref));

class HomeRepo {
  final FirebaseFirestore firestore;
  final Ref ref;
  HomeRepo({required FirebaseFirestore cfirestore, required Ref cref})
      : firestore = cfirestore,
        ref = cref;

  CollectionReference get _popular => firestore.collection("popular");

  Stream<List<TestModel>> getPopular() {
   
    return _popular.snapshots().map((event) {
      List<TestModel> populars = [];
       ref.watch(totalProvider.notifier).state = 0;
      for (var doc in event.docs) {
        populars.add(TestModel.fromMap(doc.data() as Map<String, dynamic>));
        var current = TestModel.fromMap(doc.data() as Map<String, dynamic>);
        if (current.isAdd == true) {
          ref.watch(totalProvider.notifier).state += int.parse(current.DPrice);
        }
      }
      return populars;
    });
  }

  void updateCart(String Name) async {
    await _popular.doc(Name).update({"isAdd": true});
  }

  void removeCart(String Name) async {
    await _popular.doc(Name).update({"isAdd": false});
  }
}
