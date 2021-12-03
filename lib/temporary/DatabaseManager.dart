import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DatabaseManager {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection("Events");
  Future<void> createUserData(
    String? hours,
    String? totalAmount,
    String? repOffice,
    String? dropLocation,
    String? name,
    String? email,
    String? phone,
    String? vehicles,
    String? date,
    String? takeTime,
    String? backTime,
    String? vehicleName,
  ) async {
    var id = Uuid();
    String prodId = id.v4();
    return await profileList.doc(prodId).set({
      '1.vehicle name': vehicleName,
      '2.name': name,
      '4.email': email,
      '5.phone': phone,
      '7.date': date,
      '8.takeTime': takeTime,
      '9.0 backTime': backTime,
      '9.1.hours': hours,
      '9.2.Total Amount': totalAmount,
    });
  }

  Future getUserList() async {
    List itemList = [];
    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemList.add(element.data());
        });
      });
      return itemList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
