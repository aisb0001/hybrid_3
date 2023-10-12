import 'dart:convert';
import 'package:my_app/my_app.dart'; 

void main() {
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  List<dynamic> jsonData = jsonDecode(json);

  if (jsonData is List && jsonData.every((element) => element is Map<String, dynamic>)) {
    List<Map<String, String>> data = jsonData.map((e) {
      Map<String, String> castedMap = {};
      e.forEach((key, value) {
        castedMap[key] = value.toString();
      });
      return castedMap;
    }).toList();

    Students students = Students(data);
    print("---------------------------------------------------------");
    students.sort("email");
    print("---> Sorted by email:");
    students.output();

    students.plus({"first": "Houcine", "last": "Aisbih", "email": "aisb0001@algonquinelive.com"});
    print("\n---> After adding a new student:");
    students.output();

  students.remove("aisb0001@algonquinelive.com");
  print("\n---> After removing a student by email:");
  students.output();
  } else {
    print("Invalid JSON data format!!!");
  }
}
