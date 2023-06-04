import 'package:flutter/material.dart';
import 'package:task_manager/theme/custom_colors.dart';

class CreateItemPopUp extends StatelessWidget {
  final String title;
  final Function(String) onCreate;

  const CreateItemPopUp({Key? key, required this.title, required this.onCreate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.createWidgetBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1.0),
      ),
      child: InkWell(
        onTap: () {
          _showAddStoryDialog(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Icon(
              Icons.add,
              size: 40,
              color: Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAddStoryDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Story'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Story Name',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(color: CustomColors.subTextColor),
                ),
                backgroundColor: MaterialStateProperty.all(
                  CustomColors.createWidgetBgColor,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      CustomColors.createWidgetBgColor)),
              onPressed: () {
                onCreate(nameController.text);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
