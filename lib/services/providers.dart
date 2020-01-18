import 'package:cloud_firestore/cloud_firestore.dart';

final providers = Firestore.instance.collection('providers').snapshots();
