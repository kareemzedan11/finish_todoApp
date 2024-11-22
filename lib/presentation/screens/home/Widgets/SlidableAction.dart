import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/presentation/screens/home/Widgets/NotesContainer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SlidableNote extends StatelessWidget {
  final String title;
  final String time;
  final String noteId;
  final bool isDone;
  final Function(BuildContext)? onDelete;
  final Function(BuildContext)? onEdit;
  final VoidCallback? onComplete;

  const SlidableNote({
    required this.title,
    required this.time,
    required this.noteId,
    required this.isDone,
    required this.onDelete,
    required this.onEdit,
    this.onComplete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(noteId),
      startActionPane: ActionPane(
        motion:    DrawerMotion(),

        children: [
          SlidableAction(
            onPressed: onDelete,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.deleteButton,
          ),
          SlidableAction(
            onPressed: onEdit,
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label:  AppLocalizations.of(context)!.editButton,
          ),
        ],
      ),
      child: NotesContainer(
        title: title,
        time: time,
        isDone: isDone,
        onComplete: onComplete,
      ),
    );
  }
}
