// Dev by Matthew Lawrence Marcelo / matthewmarcelo.com
// 100% human-made. No AI or LLM was used in this project.

import 'dart:io'; // input output library

// UNIVERSAL CLEAR
void clear() {
  if (Platform.isWindows) {
    print(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

// ERROR REPORT
void error(e) {
  clear();
  print("===============================================");
  print("            Error found in program.            ");
  print("===============================================");
  print("Error:\n$e");
  print("Please report to Matthew with error details.");
  print("\nThis message will close in 3 seconds.");
  sleep(Duration(seconds: 3));
}

// VARIABLES AND CLASSES
class Student {
  // student object
  int IDno;
  String name;
  int yrlvl;
  double grade = -1;
  List<Map> subjects = [];
  Student(this.IDno, this.yrlvl, this.grade, this.name); // student constructor
}

Set<Student> studentDB = {
  // student store
  Student(26001, 2, -1, 'Test Person'), // presets
  Student(26002, 4, -1, 'Matthew Marcelo'),
};

// TEXT PRESETS
void TitleBar(text) {
  print("===============================================");
  print(" CLISMS > $text");
  print("===============================================");
}

void StudentTableHeader() {
  print("ID No.\t|Year\t|Grade\t|Name\t");
  print("-----------------------------------------------");
}

void SubjectTableHeader() {
  print("Code\t|Section|Grade\t|Name\t");
  print("-----------------------------------------------");
}

// MODULES
void Splash() {
  clear();
  print("===============================================");
  print("                 C L I S M S");
  print("Command Line Interface School Management System");
  print("");
  print("                     v0.4                      ");
  print("       Matthew Lawrence Marcelo / CS222        ");
  print("       No LLM/AI was used in this work.        ");
  print("===============================================");
  sleep(Duration(seconds: 2));
}

void MainMenu() {
  final now = DateTime.now();
  clear();
  print("===============================================");
  print(
    ' CLISMS                             ${now.year}-${now.month}-${now.day}',
  );
  print("===============================================");
  print("> [1] Register Student");
  print("> [2] View All Students");
  print("> [3] Search Student");
  print("> [4] Enroll Subject");
  print("> [5] Add / Update Grade");
  print("> [6] View Student Report");
  print("> [7] Remove Student");
  print("> [0] Exit");
  print("");
}

void PlaceHolder() {
  clear();
  print("===============================================");
  print("         This module is not ready yet!         ");
  print("===============================================");
  sleep(Duration(seconds: 1));
}

void Goodbye() {
  clear();
  print("===============================================");
  print("              See you next time.               ");
  print("===============================================");
  sleep(Duration(seconds: 1));
  clear();
}

void RegisterStudent() {
  //needs unique ID check
  while (true) {
    clear();
    TitleBar("Register Student");
    print("NEW STUDENT\n");
    stdout.write("ID Number: ");
    int newStudentIDno = int.parse(stdin.readLineSync()!);
    stdout.write("Year Level: ");
    int newStudentYrLvl = int.parse(stdin.readLineSync()!);
    stdout.write("Name: ");
    String newStudentName = stdin.readLineSync()!;
    try {
      studentDB.add(
        Student(newStudentIDno, newStudentYrLvl, -1, newStudentName),
      );
      clear();
      print("===============================================");
      print(" CLISMS > Register Student");
      print("===============================================");
      print("Successfully added student.\n");
      print("ID Number: $newStudentIDno");
      print("Year Level: $newStudentYrLvl");
      print("Name: $newStudentName");
      print("\n[ENTER] New Student");
      print("[0] Exit");
      String menuInput = stdin.readLineSync()!;
      if (menuInput.isEmpty) {
        menuInput = "1";
      }
      int? menuSelection = int.parse(menuInput); // Request input
      if (menuSelection == 0) {
        break; // Code to exit program
      }
    } catch (e) {
      error(e);
    }
  }
}

void ViewAllStudents() {
  clear();
  TitleBar("View All Students");
  StudentTableHeader();
  for (int i = 0; i < studentDB.length; i++) {
    var selectedStudent = studentDB.elementAt(i);
    print(
      '${selectedStudent.IDno}\t|${selectedStudent.yrlvl}\t|${selectedStudent.grade == -1 ? "N/A" : selectedStudent.grade}\t|${selectedStudent.name}\t',
    );
  }
  ;
  print("\n[ENTER] Exit");
  stdin.readLineSync(); // Request input
}

void SearchStudent() {
  while (true) {
    clear();
    TitleBar("Search Student");
    print("Use any data, like the ID no. or last name of a student.");
    print('To search by year level, use "Year #" as your search term.');
    print("Search is NOT case-sensitive.\n");
    stdout.write("Search: ");
    String searchTerm = stdin.readLineSync()!;
    print("");
    bool somethingFound = false;
    for (int i = 0; i < studentDB.length; i++) {
      var selectedStudent = studentDB.elementAt(i);
      String selectedStudentData =
          "${selectedStudent.IDno} Year ${selectedStudent.yrlvl} ${selectedStudent.name}";
      selectedStudentData = selectedStudentData.toLowerCase();
      if (selectedStudentData.contains(searchTerm.toLowerCase())) {
        if (!somethingFound) {
          StudentTableHeader();
          somethingFound = true;
        }
        print(
          '${selectedStudent.IDno}\t|${selectedStudent.yrlvl}\t|${selectedStudent.grade == -1 ? "N/A" : selectedStudent.grade}\t|${selectedStudent.name}\t',
        );
      }
    }
    if (!somethingFound) {
      print("No student found with the search term.");
    }
    print("\n[ENTER] New Search");
    print("[0] Exit");
    String menuInput = stdin.readLineSync()!;
    if (menuInput.isEmpty) {
      menuInput = "1";
    }
    int? menuSelection = int.parse(menuInput);
    if (menuSelection == 0) {
      break; // Code to exit program
    }
  }
}

void EnrollSubject() {
  while (true) {
    clear();
    TitleBar("Enroll Subject");
    try {
      stdout.write("Student ID: "); // code to search ID
      int? searchTerm = int.parse(stdin.readLineSync()!); // get search term
      print("");
      bool somethingFound = false;
      for (int i = 0; i < studentDB.length; i++) {
        // iterate through all students
        var selectedStudent = studentDB.elementAt(i);
        if (selectedStudent.IDno == searchTerm) {
          if (!somethingFound) {
            StudentTableHeader();
            somethingFound = true;
          }
          print(
            '${selectedStudent.IDno}\t|${selectedStudent.yrlvl}\t|${selectedStudent.grade == -1 ? "N/A" : selectedStudent.grade}\t|${selectedStudent.name}\t',
          );
          // code for subject input
          stdout.write("Subject Code: ");
          String subjectCode = stdin.readLineSync()!;
          stdout.write("Subject Section: ");
          int? subjectSection = int.parse(stdin.readLineSync()!);
          stdout.write("Subject Name: ");
          String subjectName = stdin.readLineSync()!;
          // code for adding subject to ID
          Map<String, dynamic> subjectDetails = {
            'code': subjectCode,
            'section': subjectSection,
            'grade': -1.0,
            'name': subjectName,
          };
          studentDB.elementAt(i).subjects.add(subjectDetails);
          clear();
          TitleBar("Enroll Subject > Successful");
          print("Subject successfully added to ${studentDB.elementAt(i).IDno}");
          print("Subjects:");
          SubjectTableHeader();
          for (int k = 0; k < studentDB.elementAt(i).subjects.length; k++) {
            var selectedSubject = studentDB.elementAt(i).subjects[k];
            print(
              '${selectedSubject['code']}\t|${selectedSubject['section']}\t|${selectedSubject['grade'] == -1 ? "N/A" : selectedSubject['grade']}\t|${selectedSubject['name']}',
            );
          }
          break;
        }
      }
      if (!somethingFound) {
        print("No student found with the search term.");
      }
      print("\n[ENTER] Add New Subject");
      print("[0] Exit");
      String menuInput = stdin.readLineSync()!;
      if (menuInput.isEmpty) {
        menuInput = "1";
      }
      int? menuSelection = int.parse(menuInput); // Request input
      if (menuSelection == 0) {
        break; // Code to exit program
      }
    } catch (e) {
      error(e);
    }
  }
}

void ModifyGrade() {
  while (true) {
    clear();
    TitleBar("Add / Update Grade > Select");
    try {
      stdout.write("Student ID: "); // code to search ID
      int? searchTerm = int.parse(stdin.readLineSync()!); // get search term
      print("");
      bool studentFound = false;
      for (int i = 0; i < studentDB.length; i++) {
        // iterate through all students
        var selectedStudent = studentDB.elementAt(i);
        if (selectedStudent.IDno == searchTerm) {
          if (!studentFound) {
            StudentTableHeader();
            studentFound = true;
          }
          print(
            // list matched student's info
            '${selectedStudent.IDno}\t|${selectedStudent.yrlvl}\t|${selectedStudent.grade == -1 ? "N/A" : selectedStudent.grade}\t|${selectedStudent.name}\t\n',
          );
          SubjectTableHeader(); //list all subjects
          for (int k = 0; k < selectedStudent.subjects.length; k++) {
            var selectedSubject = selectedStudent.subjects[k];
            print(
              '${selectedSubject['code']}\t|${selectedSubject['section']}\t|${selectedSubject['grade'] == -1 ? "N/A" : selectedSubject['grade']}\t|${selectedSubject['name']}',
            );
          }
          // code for subject input
          stdout.write("Subject Code: ");
          String subjectCode = stdin.readLineSync()!;
          bool subjectFound = false;
          for (int k = 0; k < selectedStudent.subjects.length; k++) {
            // iterate through all subjects
            var selectedSubject = selectedStudent.subjects[k];
            if (selectedSubject['code'].toLowerCase() ==
                subjectCode.toLowerCase()) {
              if (!subjectFound) {
                subjectFound = true;
              }
              clear();
              TitleBar("Add / Update Grade > Modify Grade");
              print("SELECTED SUBJECT");
              SubjectTableHeader(); // display selected subject
              print(
                '${selectedSubject['code']}\t|${selectedSubject['section']}\t|${selectedSubject['grade'] == -1 ? "N/A" : selectedSubject['grade']}\t|${selectedSubject['name']}',
              );
              stdout.write("Subject Grade: "); // input grade
              double? subjectGrade = double.parse(stdin.readLineSync()!);
              studentDB.elementAt(i).subjects[k]['grade'] =
                  subjectGrade; // add new grade to subject
              clear();
              TitleBar("Add / Update Grade > Successful");
              print(
                "Grade successfully added to ${studentDB.elementAt(i).IDno}",
              );
              print("Subjects:");
              SubjectTableHeader();
              double gradeTotal = 0.0;
              int validSubjects = 0;
              for (int k = 0; k < studentDB.elementAt(i).subjects.length; k++) {
                var selectedSubject = studentDB.elementAt(i).subjects[k];
                if (selectedSubject['grade'] >= 0) {
                  gradeTotal += selectedSubject['grade'];
                  validSubjects++;
                }
                print(
                  '${selectedSubject['code']}\t|${selectedSubject['section']}\t|${selectedSubject['grade'] == -1 ? "N/A" : selectedSubject['grade']}\t|${selectedSubject['name']}',
                );
              }
              studentDB.elementAt(i).grade = (gradeTotal / validSubjects);
              print("\nTotal student grade calculated.");
              StudentTableHeader();
              print(
                // list matched student's info
                '${selectedStudent.IDno}\t|${selectedStudent.yrlvl}\t|${selectedStudent.grade == -1 ? "N/A" : selectedStudent.grade}\t|${selectedStudent.name}\t\n',
              );
              break;
            }
          }
          if (!subjectFound) {
            print("No subject found with the search term.");
          }
          break;
        }
      }
      if (!studentFound) {
        print("No student found with the search term.");
      }
      print("\n[ENTER] Add New Subject");
      print("[0] Exit");
      String menuInput = stdin.readLineSync()!;
      if (menuInput.isEmpty) {
        menuInput = "1";
      }
      int? menuSelection = int.parse(menuInput); // Request input
      if (menuSelection == 0) {
        break; // Code to exit program
      }
    } catch (e) {
      error(e);
    }
  }
}

void StudentReport() {
  clear();
  TitleBar("View Student Report");
  try {
    stdout.write("Student ID: "); // code to search ID
    int? searchTerm = int.parse(stdin.readLineSync()!); // get search term
    print("");
    bool studentFound = false;
    for (int i = 0; i < studentDB.length; i++) {
      // iterate through all students
      var selectedStudent = studentDB.elementAt(i);
      if (selectedStudent.IDno == searchTerm) {
        if (!studentFound) {
          StudentTableHeader();
          studentFound = true;
        }
        print(
          // list matched student's info
          '${selectedStudent.IDno}\t|${selectedStudent.yrlvl}\t|${selectedStudent.grade == -1 ? "N/A" : selectedStudent.grade}\t|${selectedStudent.name}\t\n',
        );
        SubjectTableHeader(); //list all subjects
        for (int k = 0; k < selectedStudent.subjects.length; k++) {
          var selectedSubject = selectedStudent.subjects[k];
          print(
            '${selectedSubject['code']}\t|${selectedSubject['section']}\t|${selectedSubject['grade'] == -1 ? "N/A" : selectedSubject['grade']}\t|${selectedSubject['name']}',
          );
        }
        break;
      }
      if (!studentFound) {
        print("No student found with the search term.");
      }
      print("\n[ENTER] New Report");
      print("[0] Exit");
      String menuInput = stdin.readLineSync()!;
      if (menuInput.isEmpty) {
        menuInput = "1";
      }
      int? menuSelection = int.parse(menuInput); // Request input
      if (menuSelection == 0) {
        break; // Code to exit program
      }
    }
  } catch (e) {
    error(e);
  }
}

void RemoveStudent() {
  clear();
  TitleBar("Remove Student");
}

// MAIN FUNCTION
void main() {
  Splash();
  while (true) {
    MainMenu();
    stdout.write("Select (0-7): ");
    try {
      String mainMenuInput = stdin.readLineSync()!;
      if (mainMenuInput.isEmpty) {
        mainMenuInput = "0";
      }
      int? mainMenuSelection = int.parse(mainMenuInput); // Request input
      if (mainMenuSelection == 0) {
        Goodbye();
        break; // Code to exit program
      }
      switch (mainMenuSelection) {
        case 1:
          RegisterStudent();
          break;
        case 2:
          ViewAllStudents();
          break;
        case 3:
          SearchStudent();
          break;
        case 4:
          EnrollSubject();
          break;
        case 5:
          ModifyGrade();
          break;
        case 6:
          StudentReport();
          break;
        case 7:
          PlaceHolder();
          break;
        default:
          break;
      }
    } catch (e) {
      error(e);
    }
  }
}
