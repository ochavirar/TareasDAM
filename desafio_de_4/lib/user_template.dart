class User{
  String name;
  String email;
  int id;
  String phone;
  String website;

  User({
    required this.name, 
    required this.email, 
    required this.id, 
    required this.phone, 
    required this.website
  });
  
  factory User.fromJson(Map<String, dynamic> json){
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
      id: json['id'] as int,
      phone: json['phone'] as String,
      website: json['website'] as String,
    );
  }
}