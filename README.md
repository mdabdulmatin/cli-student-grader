# CLI Student Grader v1.0  
This is a comprehensive command-line application built with Dart. It allows teachers to manage student records, track scores across multiple subjects, calculate averages, and generate detailed report cards.  

# 🚀 Features  
- Student Management: Easily add new students to the system.  
- Score Tracking: Record scores for different subjects (Math, English, Science, History) with input validation (0-100).  
- Bonus System: Add optional bonus points (1-10) to a student's record.  
- Comments: Store custom teacher notes for students.  
- Performance Analysis: Automatically calculate final averages and assign letter grades (A, B, C, D, F).  
- Class Summary: View a complete overview of class performance including average, high, and low scores.  

# 🛠️ How It Works  
- This project is built using core Dart programming concepts:  
- Data Structures: Uses List, Map, and Set to store and organize student data.  
- Control Flow: Implements do-while loops for the menu, switch statements for routing, and if-else blocks for grade logic.  
- Null Safety: Utilizes Dart's null-aware operators (??, ??=, ?.) to handle optional fields like bonuses and comments safely.  
- Collection Operators: Uses collection if and collection for to generate clean, dynamic summaries.  


# 🖥️ Application UI  
 Main Menu : 
```

===== Student Grader v1.0 =====  

1. Add Student  
2. Record Score  
3. Add Bonus Points  
4. Add Comment  
5. View All Students 
6. View Report Card  
7. Class Summary  
8. Exit  

Choose an option:

```

# Report Card Output  
Plaintext  
```

╔═════════════════════════════════════════════╗
║              REPORT CARD                    ║
╠═════════════════════════════════════════════╝
║ Name: Matin                                 ║
║ Scores: [78, 87, 77]                        ║
║ Bonus: +6                                   ║
║ Average: 86.7                               ║
║ Grade: B                                    ║
║ Comment: VERY GOOD                          ║
╚═════════════════════════════════════════════╝

```
# 📦 How to Run  
1. Ensure you have the Dart SDK installed.  
2. Clone this repository:  
Bash

```

git clone https://github.com/yourusername/cli-student-grader.git

```
3. Navigate to the project directory:
Bash

```

cd cli-student-grader

```

4. Run the application:  
Bash

```

dart run bin/cli_student_grader.dart

```

# 📝 License  
This project is open-source and available for educational purposes.  

Md Abdul Matin  
Flutter Batch 18  
Ostad.

