import 'package:deck/backend/task/task_service.dart';
import 'package:deck/pages/misc/deck_icons.dart';
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

  @override
  void initState() {
    super.initState();
    _getTasks();
  }

  void _getTasks() async{
    List<Task> tasks = await TaskService().getTasksOnSpecificDate();
    print(tasks.length);
    setState(() {
      this.tasks = tasks;
    });
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      selectedDay = day; //para sa display ng text
    });
  }

  //check if there are task
  bool isThereTask() {
    return tasks.isNotEmpty ? true : false;
  }

  List<Task> _eventLoader(DateTime day) {
    return tasks.where((task) => isSameDay(task.deadline, day)).toList();
  }

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
                eventLoader: _eventLoader,
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
                  leftChevronPadding: const EdgeInsets.only(right: 15),
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
                    if (isThereTask())
                      ListView.builder(
                        shrinkWrap:
                            true, // Allow the ListView to wrap its content
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          if (!tasks[index].isDone &&
                              isSameDay(tasks[index].deadline, selectedDay)) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: DeckTaskTile(
                                title: tasks[index].title,
                                deadline: tasks[index].deadline
                                    .toString()
                                    .split(" ")[0],
                                isChecked: tasks[index].getIsDone,
                                onChanged: (newValue) {
                                  setState(() {
                                    tasks[index].setIsDone = newValue ?? false;
                                  });
                                },
                                onDelete: () {
                                  final String deletedTitle = tasks[index].title;
                                  showConfirmationDialog(
                                    context,
                                    "Delete Item",
                                    "Are you sure you want to delete '$deletedTitle'?",
                                    () {
                                      setState(() {
                                        tasks.removeAt(index);
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
                                        builder: (context) => ViewTaskPage(task: tasks[index])),
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
                    if (!isThereTask())
                      IfDeckEmpty(
                        ifDeckEmptyText: 'No Task for Today.',
                        ifDeckEmptyheight:
                            MediaQuery.of(context).size.height * 0.2,
                      ),

                    if (!isThereTask())
                      IfDeckEmpty(
                        ifDeckEmptyText: 'No Task for Today.',
                        ifDeckEmptyheight:
                            MediaQuery.of(context).size.height * 0.2,
                      ),

                    if (isThereTask())
                      ListView.builder(
                        shrinkWrap:
                            true, // Allow the ListView to wrap its content
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          if (tasks[index].isDone &&
                              isSameDay(tasks[index].deadline, selectedDay)) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: DeckTaskTile(
                                title: tasks[index].title,
                                deadline: tasks[index].deadline
                                    .toString()
                                    .split(" ")[0],
                                isChecked: tasks[index].getIsDone,
                                onChanged: (newValue) {
                                  setState(() {
                                    tasks[index].setIsDone = newValue ?? false;
                                  });
                                },
                                onDelete: () {
                                  setState(() {
                                    tasks.removeAt(index);
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
