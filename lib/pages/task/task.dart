import 'package:deck/backend/task/task_service.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:deck/pages/task/view_task.dart';
import 'package:deck/pages/task/add_task.dart';

import '../../backend/models/task.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Task> tasks = [];

  DateTime today = DateTime.now();
  DateTime selectedDay = DateTime.now();

  void _getTasks() async{
    tasks = await TaskService().getTasksOnSpecificDate();
    setState(() {});
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      selectedDay = day; //para sa display ng text
    });
  }

  //check if there are task
  bool isThereTask(DateTime selectedDay, List<DateTime> taskDeadlines) {
    return taskDeadlines.any((deadline) => isSameDay(deadline, selectedDay));
  }

  //Initial values for testing
  List<String> taskTitles = [
    'taskTitle1',
    'taskTitle2',
    'taskTitle3',
    'taskTitle4',
    'taskTitle5',
    'taskTitle6',
    'taskTitle7',
    'taskTitle8',
    'taskTitle9',
    'taskTitle10',
    'taskTitle11',
    'taskTitle12',
    'taskTitle13',
    'taskTitle14',
    'taskTitle15',
    'taskTitle16',
    'taskTitle17',
    'taskTitle18',
    'taskTitle19',
    'taskTitle20',
    'taskTitle21',
    'taskTitle22',
    'taskTitle23',
    'taskTitle24',
    'taskTitle25',
    'taskTitle26',
    'taskTitle27'
  ];
  List<DateTime> taskDeadlines = [
    DateTime(2024, 1, 15), // January 15, 2024
    DateTime(2024, 2, 10), // February 10, 2024
    DateTime(2024, 3, 5), // March 5, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 12), // May 12, 2024
    DateTime(2024, 6, 30), // June 30, 2024
    DateTime(2024, 5, 15), // May 15, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 5), // May 5, 2024
    DateTime(2024, 4, 20), // April 20, 2024
    DateTime(2024, 5, 12), // May 12, 2024
    DateTime(2024, 5, 7), // May 7, 2024
    DateTime(2024, 5, 1), // May 1, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 19), // May 19, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 3, 5), // March 5, 2024
    DateTime(2024, 5, 11), // May 11, 2024
    DateTime(2024, 5, 12), // May 12, 2024
    DateTime(2024, 5, 13), // May 13, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 7), // May 7, 2024
  ];
  List<bool> isDone = [
    true,
    false,
    true,
    true,
    false,
    false,
    true,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
    false,
    true,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
    false,
    true,
    false,
    true,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: DeckFAB(
          text: "Add Task",
          fontSize: 12,
          icon: Icons.add,
          foregroundColor: DeckColors.primaryColor,
          backgroundColor: DeckColors.gray,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddTaskPage()),
            );
          },
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: false,
        left: true,
        right: true,
        minimum: const EdgeInsets.only(left: 20, right: 20),
        child: CustomScrollView(
          slivers: <Widget>[
            DeckSliverHeader(
              backgroundColor: DeckColors.backgroundColor,
              headerTitle: DateFormat('EEEE,\nMMMM dd').format(selectedDay),
              textStyle: const TextStyle(
                color: DeckColors.primaryColor,
                fontFamily: 'Fraiche',
                fontSize: 56,
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              TableCalendar(
                // eventLoader: _eventLoader(taskDeadlines),
                focusedDay: today,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(DateTime.now().year + 5, 1, 1),
                onDaySelected: _onDaySelected,
                selectedDayPredicate: (day) => isSameDay(day, today),
                rowHeight: 50,
                calendarStyle: const CalendarStyle(
                  defaultTextStyle: TextStyle(
                    color: DeckColors.white,
                    fontFamily: 'nunito',
                    fontSize: 16,
                  ),
                  weekNumberTextStyle: TextStyle(
                    color: DeckColors.white,
                    fontFamily: 'nunito',
                    fontSize: 16,
                  ),
                  weekendTextStyle: TextStyle(
                    color: DeckColors.white,
                    fontFamily: 'nunito',
                    fontSize: 16,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: DeckColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  outsideDaysVisible: true,
                  outsideTextStyle: TextStyle(
                    color: DeckColors.gray,
                    fontFamily: 'nunito',
                    fontSize: 16,
                  ),
                ),
                headerStyle: HeaderStyle(
                  leftChevronIcon:
                      const Icon(DeckIcons.back_arrow, color: DeckColors.white),
                  leftChevronMargin: EdgeInsets.zero,
                  leftChevronPadding: EdgeInsets.only(right: 15),
                  rightChevronIcon: Transform(
                    transform: Matrix4.identity()..scale(-1.0, 1.0),
                    child: const Icon(DeckIcons.back_arrow,
                        color: DeckColors.white),
                  ), //niflip ko lng sha >~<
                  rightChevronMargin: EdgeInsets.zero,
                  rightChevronPadding: const EdgeInsets.only(right: 60),
                  formatButtonVisible: false,
                  titleTextStyle: const TextStyle(
                    color: DeckColors.white,
                    fontSize: 28,
                    fontFamily: 'Fraiche',
                  ),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: DeckColors.white,
                    fontSize: 16,
                    fontFamily: 'nunito',
                  ),
                  weekendStyle: TextStyle(
                    color: DeckColors.white,
                    fontSize: 16,
                    fontFamily: 'nunito',
                  ),
                ),
              )
            ])),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: BuildTabBar(
                  titles: const ['To Do', 'Done'],
                  length: 2,
                  tabContent: [
                    // To Do Tab
                    if (isThereTask(selectedDay, taskDeadlines))
                      ListView.builder(
                        shrinkWrap:
                            true, // Allow the ListView to wrap its content
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: taskTitles.length,
                        itemBuilder: (context, index) {
                          if (!isDone[index] &&
                              isSameDay(taskDeadlines[index], selectedDay)) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: DeckTaskTile(
                                title: taskTitles[index],
                                deadline: taskDeadlines[index]
                                    .toString()
                                    .split(" ")[0],
                                isChecked: isDone[index],
                                onChanged: (newValue) {
                                  setState(() {
                                    isDone[index] = newValue ?? false;
                                  });
                                },
                                onDelete: () {
                                  final String deletedTitle = taskTitles[index];
                                  showConfirmationDialog(
                                    context,
                                    "Delete Item",
                                    "Are you sure you want to delete '$deletedTitle'?",
                                    () {
                                      setState(() {
                                        taskTitles.removeAt(index);
                                        taskDeadlines.removeAt(index);
                                        isDone.removeAt(index);
                                      });
                                    },
                                    () {
                                      // Handle cancel deletion
                                    },
                                  );
                                },
                                enableRetrieve: false,
                                onTap: () {
                                  print("Clicked task tile!");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ViewTaskPage()),
                                  );
                                },
                              ),
                            );
                          } else {
                            return const SizedBox(
                                height: 0); // Placeholder for empty space
                          }
                        },
                      ),
                    // Done Tab
                    if (!isThereTask(selectedDay, taskDeadlines))
                      IfDeckEmpty(
                        ifDeckEmptyText: 'No Task for Today.',
                        ifDeckEmptyheight:
                            MediaQuery.of(context).size.height * 0.2,
                      ),

                    if (!isThereTask(selectedDay, taskDeadlines))
                      IfDeckEmpty(
                        ifDeckEmptyText: 'No Task fo Today.',
                        ifDeckEmptyheight:
                            MediaQuery.of(context).size.height * 0.2,
                      ),

                    if (isThereTask(selectedDay, taskDeadlines))
                      ListView.builder(
                        shrinkWrap:
                            true, // Allow the ListView to wrap its content
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: taskTitles.length,
                        itemBuilder: (context, index) {
                          if (isDone[index] &&
                              isSameDay(taskDeadlines[index], selectedDay)) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: DeckTaskTile(
                                title: taskTitles[index],
                                deadline: taskDeadlines[index]
                                    .toString()
                                    .split(" ")[0],
                                isChecked: isDone[index],
                                onChanged: (newValue) {
                                  setState(() {
                                    isDone[index] = newValue ?? false;
                                  });
                                },
                                onDelete: () {
                                  setState(() {
                                    taskTitles.removeAt(index);
                                    taskDeadlines.removeAt(index);
                                    isDone.removeAt(index);
                                  });
                                },
                              ),
                            );
                          } else {
                            return const SizedBox(); // Placeholder for empty space
                          }
                        },
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
