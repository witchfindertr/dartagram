class Dimensions {
  late int height;
  late int width;

  Dimensions(this.height, this.width);

  static Dimensions fromData(Map<String, dynamic> data) {
    final height = data['height'];
    final width = data['width'];

    return Dimensions(height, width);
  }
}
