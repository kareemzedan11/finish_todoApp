import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/presentation/screens/edit/editscreen.dart';
import 'package:todo/presentation/screens/home/Widgets/NotesContainer.dart';
import '../../../../../core/utiles/colors_Manager.dart';
import '../../Widgets/SlidableAction.dart';
import '../../Widgets/timeLineCalendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Listtap extends StatefulWidget {
  const Listtap({super.key});

  @override
  _ListtapState createState() => _ListtapState();
}

class _ListtapState extends State<Listtap> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,

        title: Text(
          AppLocalizations.of(context)!.appTitle,
          style: TextStyle(

            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          timeLineCalendar(
            onChangeDateTime: (newDate) {
              setState(() {
                selectedDate = newDate;
              });
            },
          ),
          SizedBox(height: 20),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('tasks')
                  .where('dueDate', isGreaterThanOrEqualTo: _getStartOfDay(selectedDate))
                  .where('dueDate', isLessThan: _getEndOfDay(selectedDate))
                  .orderBy('dueDate', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final notes = snapshot.data!.docs;

                if (notes.isEmpty) {
                  return Center(child: Text(AppLocalizations.of(context)!.taskfound, style: TextStyle(fontSize: 18)));
                }

                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    final title = note['title'] ?? 'Untitled';
                    final timestamp = note['dueDate']?.toDate() ?? DateTime.now();
                    final time = DateFormat('yyyy-MM-dd HH').format(timestamp);

                    // Cast data to Map<String, dynamic>
                    final data = note.data() as Map<String, dynamic>?;
                    final isDone = data != null && data.containsKey('done') ? data['done'] as bool : false;

                    return SlidableNote(
                      title: title,
                      time: time,
                      noteId: note.id,
                      isDone: isDone,
                      onDelete: (Context) {
                        note.reference.delete();
                      },
                      onEdit: (Context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditNoteScreen(noteId: note.id),
                          ),
                        );
                      },
                      onComplete: () {
                        note.reference.update({'done': !isDone});
                      },
                    );
                  },
                );

              },
            ),
          ),
        ],
      ),
    );
  }

  DateTime _getStartOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 0, 0, 0);
  }

  DateTime _getEndOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }
}
