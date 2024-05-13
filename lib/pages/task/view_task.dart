
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/task/edit_task.dart';

class ViewTaskPage extends StatefulWidget {
  const ViewTaskPage({Key? key});

  @override
  State<ViewTaskPage> createState() => _ViewTaskPageState();
}

class _ViewTaskPageState extends State<ViewTaskPage> {

  //initial values
  final String taskTitle = 'Buy groceries for samggggg Buy groceries for samggggg';
  final String taskDescription = '"Buy groceries" involves purchasing essential food items and '
      'household supplies. This task ensures that necessary provisions are '
      'available for daily use. It contributes to maintaining a well-stocked and '
      'functional home environment.';
  final DateTime taskDeadline = DateTime(2024, 5, 30);
  late final TextEditingController _dateController;

  @override
  void initState() {
    super.initState();

    _dateController = TextEditingController(text: taskDeadline.toString().split(" ")[0]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeckBar(
        title: "Task",
        color: DeckColors.white,
        fontSize: 24,
        icon: Icons.edit,
        // icon: DeckIcons.pencil,
        iconColor: Colors.white,
        onPressed: () {
          // Navigate to the second page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditTaskPage()),
          );
        },
      ),
      body: SafeArea(
        top: true,
        bottom: false,
        left: true,
        right: true,
        minimum: const EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  taskTitle,
                  style: const TextStyle(
                    fontFamily: 'Fraiche',
                    fontSize: 20,
                    color: DeckColors.white,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              const Divider(
                color: DeckColors.white,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Task Deadline",
                      style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 16,
                        color: DeckColors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      taskDeadline.toString().split(" ")[0],
                      style: const TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 16,
                        color: DeckColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: DeckColors.white,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  taskDescription,
                  style: const TextStyle(
                    fontFamily: 'nunito',
                    fontSize: 16,
                    color: DeckColors.white,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
