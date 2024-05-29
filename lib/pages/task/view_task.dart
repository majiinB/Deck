import 'package:deck/backend/models/task.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/task/edit_task.dart';

class ViewTaskPage extends StatefulWidget {
  final Task task;
  const ViewTaskPage({super.key, required this.task});

  @override
  State<ViewTaskPage> createState() => _ViewTaskPageState();
}

class _ViewTaskPageState extends State<ViewTaskPage> {
  //initial values
  late final TextEditingController _dateController;

  @override
  void initState() {
    super.initState();

    _dateController = TextEditingController(text: widget.task.deadline.toString().split(" ")[0]);
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
        minimum: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  widget.task.title,
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
                      widget.task.deadline.toString().split(" ")[0],
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
                  widget.task.description,
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
