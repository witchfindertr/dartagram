class Owner {
  String? id;
  String? username;

  Owner(this.id, this.username);

  static Owner fromData(Map<String, dynamic> data) {
    Owner owner = Owner(
      data['id'],
      data['username'],
    );

    return owner;
  }
}
