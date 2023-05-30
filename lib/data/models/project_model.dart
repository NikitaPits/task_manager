import 'package:task_manager/data/models/story_model.dart';

class Project {
  String id;
  String name;
  List<Story> stories;
  double spentTime = 0;

  Project(
      {required this.id,
      required this.name,
      this.stories = const [],
      this.spentTime = 0});

  void addStory(Story story) {
    stories.add(story);
  }

  void removeStory(Story story) {
    stories.remove(story);
  }

  @override
  String toString() {
    String storyList = stories.map((story) => '- ${story.name}').join('\n');
    return 'Project ID: $id\nName: $name\nStories:\n$storyList\nSpent Time: $spentTime hours';
  }
}
