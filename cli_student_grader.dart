import 'dart:io';

const String appTitle = "Student Grader v1.0";
final Set<String> availableSubjects = {"Math", "English", "Science"};

void main() {
  var students = <Map<String, dynamic>>[];
  var running = true;

  do {
    print("\n===== $appTitle =====");
    print(
      "1. Add Student\n2. Record Score\n3. Add Bonus Points\n4. Add Comment\n5. View All Students\n6. View Report Card\n7. Class Summary\n8. Exit",
    );
    stdout.write("Choose an option: ");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1': // Add Student
        stdout.write("Enter student name: ");
        var name = stdin.readLineSync() ?? "Unknown";
        students.add({
          "name": name,
          "scores": <int>[],
          "subjects": {...availableSubjects}, // Spread operator
          "bonus": null,
          "comment": null,
        });
        print("Student $name added.");
        break;

      case '2': // Record Score
        if (students.isEmpty) {
          print("No students found.");
          break;
        }

        // 1. Select Student
        for (int i = 0; i < students.length; i++)
          print("${i}. ${students[i]['name']}");
        stdout.write("Select student index: ");
        int studentIdx = int.tryParse(stdin.readLineSync() ?? "") ?? -1;

        if (studentIdx < 0 || studentIdx >= students.length) {
          print("Invalid student index.");
          break;
        }

        // 2. Select Subject
        var subjectsList = students[studentIdx]['subjects'].toList();
        print("Available subjects: ");
        for (int i = 0; i < subjectsList.length; i++) {
          print("${i}. ${subjectsList[i]}");
        }
        stdout.write("Select subject index: ");
        int subIdx = int.tryParse(stdin.readLineSync() ?? "") ?? -1;

        if (subIdx < 0 || subIdx >= subjectsList.length) {
          print("Invalid subject index.");
          break;
        }

        // 3. Get Score
        int? score;
        while (score == null || score < 0 || score > 100) {
          stdout.write("Enter score for ${subjectsList[subIdx]} (0-100): ");
          score = int.tryParse(stdin.readLineSync() ?? "");
        }

        // Add to scores list
        (students[studentIdx]['scores'] as List<int>).add(score);
        print("Score recorded for ${subjectsList[subIdx]}.");
        break;

      case '3': // Add Bonus
        stdout.write("Enter student index: ");
        int idx = int.tryParse(stdin.readLineSync() ?? "")!;
        //  stdout.write("Enter bonus (1-10): ");
        //  int bonusValue = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
        int? bonusValue;
        while (bonusValue == null || bonusValue < 1 || bonusValue > 10) {
          stdout.write("Enter bonus (1-10): ");
          bonusValue = int.tryParse(stdin.readLineSync() ?? "");
        }

        var student = students[idx];
        if (student["bonus"] == null) {
          student["bonus"] ??= bonusValue; // ??= assignment
        } else {
          print("Bonus already set: ${student["bonus"]}");
        }
        break;

      case '4': // Add Comment
        stdout.write("Enter student index: ");
        int idx = int.tryParse(stdin.readLineSync() ?? "")!;
        stdout.write("Enter comment: ");
        students[idx]["comment"] = stdin.readLineSync();
        break;

      case '5': // View All
        for (var s in students) {
          var tags = [
            s["name"],
            "${(s["scores"] as List).length} scores",
            if (s["bonus"] != null) "⭐ Bonus", // Collection if
          ];
          print(tags.join(" | "));
        }
        break;

      case '6': // View Report Card
        stdout.write("Enter index: ");
        int idx = int.tryParse(stdin.readLineSync() ?? "")!;
        var s = students[idx];
        var scores = s["scores"] as List<int>;

        // Calculate average
        double avg = scores.isEmpty
            ? 0
            : scores.reduce((a, b) => a + b) / scores.length;

        // Add bonus safely (?? 0 treats null as 0), then clamp between 0 and 100
        double finalAvg = (avg + (s["bonus"] ?? 0)).clamp(0, 100);

        // Calculate grade
        String grade = finalAvg >= 90
            ? "A"
            : finalAvg >= 80
            ? "B"
            : finalAvg >= 70
            ? "C"
            : finalAvg >= 60
            ? "D"
            : "F";

        // Safely access comment
        String comment =
            (s["comment"] as String?)?.toUpperCase() ?? "No comment provided";

        print("""
╔═════════════════════════════════════════════╗
║              REPORT CARD                    ║
╠═════════════════════════════════════════════╝
║ Name: ${s["name"]}                                 ║
║ Scores: $scores                        ║
║ Bonus: +${s["bonus"] ?? 0}                                   ║
║ Average: ${finalAvg.toStringAsFixed(1)}                               ║
║ Grade: $grade                                    ║
║ Comment: $comment                          ║
╚═════════════════════════════════════════════╝""");
        break;

      case '7': // Class Summary
        var summaryLines = [
          for (var s in students)
            "${s["name"]}: ${(s["scores"] as List).length} scores", // Collection for
        ];
        print(summaryLines);
        break;

      case '8':
        running = false;
        break;
    }
  } while (running);
}
