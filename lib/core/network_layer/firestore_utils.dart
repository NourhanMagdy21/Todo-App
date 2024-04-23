import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/task_model.dart';

class FirebaseUtiles {
  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection("TasksCollection")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) =>
              TaskModel.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toFireStore(),
        );
  }

  static Future<void> addToFirebase(TaskModel model) {
    var collectionRef = getCollection();
    print("enterrrrrrrr1");
    var docRef = collectionRef.doc();
    model.id = docRef.id;
    print("enterrrrrrrr1");
    return docRef.set(model);
  }

  static Future<void> deleteFromFirebase(TaskModel model) {
    var collectionRef = getCollection();
    return collectionRef.doc(model.id).delete();
  }

  static Future<List<TaskModel>> getDataFromFirebase() async {
    var snapshot = await getCollection().get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  static Stream<QuerySnapshot<TaskModel>> getRealTimeDataFromFirebase(
      DateTime dateTime) {
    var snapshot = getCollection()
        .where("dateTime", isEqualTo: dateTime.millisecondsSinceEpoch)
        .snapshots();
    return snapshot;
  }
}
