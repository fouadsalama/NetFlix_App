import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveData({required String name, required String email}) async {
  final userName = name;
  final userEmail = email;
  await FirebaseFirestore.instance.collection('users').doc(email).set({
    'name': userName,
    'email': userEmail,
  });
}

Future<String> fetchNameFromFirestore(
  String email,
) async {
  try {
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    if (userData.exists) {
      String name = userData.data()?['name'];
      return name;
    } else {
      return 'Name Not Found ';
    }
  } catch (e) {
    return '$e';
  }
}

Future<void> updateNameInFirestore(String newName, String email) async {
  try {
    final userRef = FirebaseFirestore.instance.collection('users').doc(email);

    // Update the 'name' field with the new name.
    await userRef.update({
      'name': newName,
    });

    // After updating, refresh the profile data.
    fetchNameFromFirestore(email);
  } catch (e) {
    throw Exception('Error occurred: $e');
  }
}
