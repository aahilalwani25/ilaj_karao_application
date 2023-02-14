class NewUser {
  String name, dob, password, email;
  bool active;
  int age;

  NewUser(
      {required this.name,
      required this.dob,
      required this.active,
      required this.email,
      required this.password,
      required this.age}
    );
}
