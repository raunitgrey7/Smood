class Question {
  final String questionText;
  final List<String> options;
  final String key;

  Question({
    required this.questionText,
    required this.options,
    required this.key,
  });
}

final List<Map<String, dynamic>> moodQuestions = [
  {
    'question': 'What is your gender?',
    'type': 'dropdown',
    'key': 'gender',
    'options': ['Male', 'Female', 'Other'],
  },
  {
    'question': 'What is your religion?',
    'type': 'dropdown',
    'key': 'religion',
    'options': ['Hinduism', 'Christianity', 'Islam', 'Other'],
  },
  {
    'question': 'Describe your recent feeling',
    'type': 'text',
    'key': 'recent_feeling',
  },
  {
    'question': 'How are you feeling right now?',
    'type': 'dropdown',
    'key': 'current_mood',
    'options': ['Happy', 'Sad', 'Anxious', 'Frustrated', 'Depressed'],
  },
  {
    'question': "A superpower you'd enjoy today:",
    'type': 'dropdown',
    'key': 'superpower',
    'options': [
      "Control other's mind",
      "Time travel",
      "Mind reading",
      "Invisibility"
    ],
  },
  {
    'question': "Do you feel like you're improving as a person?",
    'type': 'dropdown',
    'key': 'self_growth',
    'options': ['Yes', 'No', 'Maybe'],
  },
  {
    'question': 'Your screen time today (in hours):',
    'type': 'dropdown',
    'key': 'screen_time',
    'options': ['<2', '2-4', '4-6', '6-8', '8+'],
  },
  {
    'question': 'App you used the most today:',
    'type': 'dropdown',
    'key': 'most_used_app',
    'options': ['Social Media', 'Games', 'Reading or Music', 'Other'],
  },
];

