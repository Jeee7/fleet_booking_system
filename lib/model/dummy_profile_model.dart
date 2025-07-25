class Profile {
  final int id;
  final String email;
  final String phone;
  final String name;
  final String profilePic;

  Profile({
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
    required this.profilePic,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      name: json['name'] ?? '',
      profilePic: json['profile_pic'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'profile_pic': profilePic,
    };
  }
}
