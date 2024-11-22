class UserDM {
  static const String collectionName = 'users';
  static UserDM? currentUser;
  String id;
  String fullName;
  String userName;
  String email;

  UserDM({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.email,
  });

  // Convert UserDM to Firestore-compatible map
  Map<String, dynamic> toFireStore() => {
    'id': id,
    'fullName': fullName,
    'userName': userName,
    'email': email,
  };

  // Create UserDM from Firestore data
  UserDM.fromFireStore(Map<String, dynamic> data)
      : this(
    id: data['id'],
    fullName: data['fullName'],
    userName: data['userName'],
    email: data['email'],
  );
}
