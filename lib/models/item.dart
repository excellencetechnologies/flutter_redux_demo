class Item {
  final String text;
  bool read; //we cannot make this final, because it's value will change

  Item(this.text, {this.read = false});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(json['title']);
  }

  @override
  String toString() {
    //this is mainly for debugging purposes
    return "Text: $text isRead $read ";
  }
}
