class UserDetails {
  String? displayName;
  String? email;
  String? photoURL;

  //contructor
  UserDetails({this.displayName, this.email, this.photoURL});

  //we need to create map

  UserDetails.fromJson(Map<String, dynamic> json) {
    displayName = json["displayName"];
    photoURL = json["photoURL"];
    email = json["email"];
  }
  Map<String, dynamic> tojson() {
    //object data
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["displayName"] = this.displayName;
    data["email"] = this.email;
    data["photoURL"] = this.photoURL;
    return data;
  }
}
