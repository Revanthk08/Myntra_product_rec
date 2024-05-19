import 'package:bis_sol_project/services/databse.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController name = new TextEditingController();
  TextEditingController experience = new TextEditingController();
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'Add Employee',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Name", style: TextStyle(fontSize: 25)),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: name,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 20,),
            const Text("Experience in this Company", style: TextStyle(fontSize: 25)),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: experience,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Is Active?", style: TextStyle(fontSize: 25)),
                Switch(
                  value: isActive,
                  onChanged: (value) {
                    setState(() {
                      isActive = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
            Center(child: ElevatedButton(onPressed: () async {
              String id = randomAlphaNumeric(10);
              Map<String, dynamic> employeeInfoMap = {
                "Name": name.text,
                "Experience": experience.text,
                "IsActive" : isActive
              };
              await DatabaseMethods().addEmployee(employeeInfoMap, id).then((
                  value) => {
              Fluttertoast.showToast(
              msg: "Record entered into the database",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
              )
              });
            }, child: const Text("Add"),)),


          ],
        ),
      ),
    );
  }
}
