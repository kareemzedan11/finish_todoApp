import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDM {
  static const String collectionName = 'todo';
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  TodoDM({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.isDone,
  });

  // Convert TodoDM to Firestore-compatible map
  Map<String, dynamic> toFireStore() => {
    'id': id,  // Firestore already auto-generates IDs if you don't pass one
    'title': title,
    'description': description,
    'dateTime': Timestamp.fromDate(dateTime),  // Convert DateTime to Timestamp for Firestore
    'isDone': isDone,
  };

  // Create TodoDM from Firestore data
  TodoDM.fromFireStore(Map<String, dynamic> data)
      : this(
    id: data['id'], // If Firestore document already has the id
    title: data['title'],
    description: data['description'],
    dateTime: data['dateTime'].toDate(),  // Convert Firestore Timestamp to DateTime
    isDone: data['isDone'],
  );
}
