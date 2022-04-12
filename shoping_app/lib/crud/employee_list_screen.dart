import 'package:flutter/material.dart';
import 'package:shoping_app/crud/employee.dart';
import 'package:hive/hive.dart';
import 'add_or_edit_employee_screen.dart';

class EmployeesListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmployeesListState();
  }
}

class EmployeesListState extends State<EmployeesListScreen> {
  List<Employee> listEmployees = [];

  void getEmployees() async {
    final box = await Hive.openBox<Employee>('employee');
    setState(() {
      listEmployees = box.values.toList();
    });
  }

  @override
  void initState() {
    getEmployees();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Add Products',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
              ),
            ),
            Expanded(
              child: Scaffold(
                body: Container(
                  padding: EdgeInsets.all(15),
                  child: ListView.builder(
                      itemCount: listEmployees.length,
                      itemBuilder: (context, position) {
                        Employee getEmployee = listEmployees[position];
                        var salary = getEmployee.empSalary;
                        var age = getEmployee.empAge;
                        return Card(
                          elevation: 8,
                          child: Container(
                            height: 80,
                            padding: EdgeInsets.all(15),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(getEmployee.empName!,
                                        style: TextStyle(fontSize: 18))),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      AddOrEditEmployeeScreen(
                                                          true,
                                                          position,
                                                          getEmployee)));
                                        }),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        final box =
                                            Hive.box<Employee>('employee');
                                        box.deleteAt(position);
                                        setState(() =>
                                            {listEmployees.removeAt(position)});
                                      }),
                                ),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                        "Amount: $salary | Quantity: $age",
                                        style: TextStyle(fontSize: 15))),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AddOrEditEmployeeScreen(false)));
                  },
                  child: const Icon(Icons.add),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
