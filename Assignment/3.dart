void main() {
  List<List<int>> studentScores = [
    [85, 90, 78],
    [75, 88, 92],
    [95, 100, 98],
  ];

  var averageScores = studentScores
      .map((scores) => scores.reduce((a, b) => a + b) / scores.length)
      .toList();
  var highestScore = studentScores
      .map((scores) => scores.reduce((a, b) => a > b ? a : b))
      .reduce((a, b) => a > b ? a : b);
  var lowestScore = studentScores
      .map((scores) => scores.reduce((a, b) => a < b ? a : b))
      .reduce((a, b) => a < b ? a : b);

  var topStudents = studentScores
      .where((scores) => scores.reduce((a, b) => a + b) / scores.length > 80)
      .toList();

  print('Average scores per student: $averageScores');
  print('Highest score in all subjects: $highestScore');
  print('Lowest score in all subjects: $lowestScore');
  print('Top students (average scores above 80): $topStudents');
}
