class User {
  final String? email;
  final String? username;
  final String? name;
  final String? phoneNumber;
  final String? bio;
  final String? imageUrl;

  User({
    this.email,
    this.username,
    this.name,
    this.phoneNumber,
    this.bio,
    this.imageUrl
  });

  Map<String, String?> toFirestore() {
    return {
      'name': name!,
      'phoneNumber': phoneNumber ?? '',
      'bio': bio ?? '',
      'imageUrl':imageUrl,
    };
  }
}
