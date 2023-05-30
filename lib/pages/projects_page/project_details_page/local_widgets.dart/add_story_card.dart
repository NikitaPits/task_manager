import 'package:flutter/material.dart';
import 'package:task_manager/data/models/story_model.dart';
import 'package:uuid/uuid.dart';

class AddStoryCard extends StatelessWidget {
  final Function(Story) onStoryAdded;

  const AddStoryCard({Key? key, required this.onStoryAdded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
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
    TextEditingController timeController = TextEditingController();

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
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                double timeSpent = double.tryParse(timeController.text) ?? 0;

                String storyId = Uuid().v4();
                Story newStory =
                    Story(id: storyId, name: name, timeSpent: timeSpent);
                onStoryAdded(newStory);

                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
