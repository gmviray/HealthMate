import 'dart:convert';

class Entry {
  final String date;
  final String UID;
  List<bool> symptoms;
  bool hasContact;

  Entry({
    required this.date,
    required this.UID,
    required this.symptoms,
    required this.hasContact,
  });

  // Factory constructor to instantiate object from json format
  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      hasContact: json['hasContact'],
      date: json['date'],
      UID: json['UID'],
      symptoms: json['symptoms'],
    );
  }

  static List<Entry> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Entry>((dynamic d) => Entry.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Entry entry) {
    return {
      'UID': entry.UID,
      'date': entry.date,
      'symptoms': entry.symptoms,
      'hasContact': entry.hasContact,
    };
  }
}
