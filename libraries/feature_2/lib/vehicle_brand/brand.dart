class Brand {
  final String name;
  Brand({required this.name});

  static Brand empty() {
    return Brand(name: "");
  }
}
