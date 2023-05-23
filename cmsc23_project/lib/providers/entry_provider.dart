import 'package:flutter/material.dart';
import '../api/firebase_entry_api.dart';
// import '../api/firebase_todo_api.dart';
import '../models/entry_model.dart';
// import '../models/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EntryListProvider with ChangeNotifier {
  late FirebaseEntryAPI firebaseService;
  late Stream<QuerySnapshot> _entriesStream;
  Entry? _selectedEntry;

  EntryListProvider() {
    firebaseService = FirebaseEntryAPI();
    fetchEntries();
  }

  // getter
  Stream<QuerySnapshot> get entries => _entriesStream;
  Entry get selected => _selectedEntry!;

  changeSelectedEntry(Entry entry) {
    _selectedEntry = entry;
  }

  void fetchEntries() {
    _entriesStream = firebaseService.getAllEntries();
    notifyListeners();
  }

  void addEntry(Entry entry) async {
    String message = await firebaseService.addEntry(entry.toJson(entry));
    print(message);
    notifyListeners();
  }

  // void editTodo(int index, String newTitle) {
  //   // _todoList[index].title = newTitle;
  //   print("Edit");
  //   notifyListeners();
  // }

  void deleteEntry() async {
    String message = await firebaseService.deleteEntry(_selectedEntry!.UID);
    print(message);
    notifyListeners();
  }

  void toggleStatus(int index, bool status) {
    // _todoList[index].completed = status;
    print("Toggle Status");
    notifyListeners();
  }
}