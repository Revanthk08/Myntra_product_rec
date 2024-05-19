import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addEmployee(Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getEmployeeDetails () async{
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }
}
