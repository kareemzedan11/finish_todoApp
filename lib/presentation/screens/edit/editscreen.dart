import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditNoteScreen extends StatefulWidget {
  final String noteId; // Pass the note ID to fetch the note to edit

  EditNoteScreen({required this.noteId});

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  DateTime? _selectedDateTime; // To store the selected date and time

  @override
  void initState() {
    super.initState();
    _loadNote();
  }

  // Load the note data into the controllers
  Future<void> _loadNote() async {
    DocumentSnapshot noteSnapshot = await FirebaseFirestore.instance
        .collection('tasks')
        .doc(widget.noteId)
        .get();

    if (noteSnapshot.exists) {
      _titleController.text = noteSnapshot['title'];
      _contentController.text = noteSnapshot['content'];
      _selectedDateTime = noteSnapshot['dueDate']?.toDate();
      setState(() {}); // Ensure the UI is updated with the loaded data
    }
  }

  // Update the note in Firestore
  Future<void> _updateNote() async {
    if (_titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
      await FirebaseFirestore.instance.collection('tasks').doc(widget.noteId).update({
        'title': _titleController.text,
        'content': _contentController.text,
        'dueDate': _selectedDateTime ?? DateTime.now(), // Update the due date if changed
      });

      Navigator.pop(context); // Go back to the previous screen after saving
    }
  }

  // Open DateTime Picker to allow user to select a date and time
  Future<void> _pickDateTime() async {
    DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDateTime != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(pickedDateTime),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDateTime.year,
            pickedDateTime.month,
            pickedDateTime.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.editNote),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle( color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
              ),
              controller: _titleController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.title,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle( color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
              ),
              controller: _contentController,
              decoration: InputDecoration(
                labelText:AppLocalizations.of(context)!.content,
                border: OutlineInputBorder(),
              ),
              maxLines: null, // Allow multiline content
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickDateTime, // Allow user to pick date and time
              child: AbsorbPointer(
                child: TextField(
                  style: TextStyle( color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                  ),
                  controller: TextEditingController(
                    text: _selectedDateTime != null
                        ? DateFormat('yyyy-MM-dd HH:mm').format(_selectedDateTime!)
                        : 'No due date set',
                  ),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.dueData,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateNote,
              child: Text(AppLocalizations.of(context)!.saveButton),
            ),
          ],
        ),
      ),
    );
  }
}
