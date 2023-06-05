import 'package:task_manager/data/models/story_model.dart';

class Project {
  String id;
  String name;
  List<Story> stories;
  double spentTime;

  Project({
    required this.id,
    required this.name,
    this.stories = const [],
    this.spentTime = 0,
  });

  void addStory(Story story) {
    stories.add(story);
  }

  void removeStory(Story story) {
    stories.remove(story);
  }

  void updateStory(Story story) {
    stories = stories.map((element) {
      if (element.id == story.id) {
        return story;
      } else {
        return element;
      }
    }).toList();
  }

  @override
  String toString() {
    String storyList = stories.map((story) => '- ${story.name}').join('\n');
    return 'Project ID: $id\nName: $name\nStories:\n$storyList\nSpent Time: $spentTime hours';
  }

  Project copyWith({
    String? id,
    String? name,
    List<Story>? stories,
    double? spentTime,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      stories: stories ?? this.stories,
      spentTime: spentTime ?? this.spentTime,
    );
  }
}
