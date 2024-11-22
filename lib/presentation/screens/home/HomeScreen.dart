import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/utiles/colors_Manager.dart';
import 'Taps/listTab/listTap.dart';
import 'Taps/settingsTap/settings.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {
  String title = '';
  String content = '';
  DateTime? dueDate;

  late TabController _tabController;
  bool isSelected = false;

  // List of tabs
  List<Widget> tabs = [
    Listtap(),
    SettingsTab(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != dueDate) {
      setState(() {
        dueDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: TabBarView(
        controller: _tabController,
        children: tabs,
      ),
      floatingActionButton: ClipOval(
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                ),
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            AppLocalizations.of(context)!.addTask,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          onChanged: (value) => title = value,
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                          ),
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.title,
                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(height: 10),
                        TextField(
                          style: TextStyle(   color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                          ),
                          onChanged: (value) => content = value,
                          decoration: InputDecoration(

                            labelText:  AppLocalizations.of(context)!.content,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: dueDate == null
                                    ?   AppLocalizations.of(context)!.dueData
                                    : DateFormat('yyyy-MM-dd').format(dueDate!),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (title.isNotEmpty && content.isNotEmpty) {
                                await FirebaseFirestore.instance.collection('tasks').add({
                                  'title': title,
                                  'content': content,
                                  'dueDate': dueDate,
                                  'timestamp': Timestamp.now(),
                                });
                                Navigator.of(context).pop();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: Text(  AppLocalizations.of(context)!.saveButton, ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },

            child: const Icon(Icons.add, size: 40, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 9.0,

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  isSelected = !isSelected;
                  setState(() {});
                  _tabController.index = 0; // Switch to the list tab
                },
                icon: Icon(Icons.list, size: 40),
                color: isSelected ? Colors.grey : Colors.blue,
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  isSelected = !isSelected;
                  setState(() {});
                  _tabController.index = 1; // Switch to the settings tab
                },
                icon: Icon(Icons.settings, size: 40),
                color: isSelected ? Colors.blue : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
