import 'package:flutter/material.dart';

class AddDataDemo extends StatefulWidget {
  const AddDataDemo({Key? key}) : super(key: key);

  @override
  State<AddDataDemo> createState() => _AddDataDemoState();
}

class _AddDataDemoState extends State<AddDataDemo> {
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController addr = TextEditingController();

  List<Map> userAdd = [];

  addData() {
    userAdd.insert(0, {
      'FName': fName.text,
      'LName': lName.text,
      'Address': addr.text,
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: userAdd.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: ListTile(
                leading: Text(userAdd[index]['FName']),
                title: Text(userAdd[index]['LName']),
                trailing: Text(userAdd[index]['Address']),
                onTap: () {
                  userAdd.removeAt(index);
                  setState(() {});
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: SimpleDialog(
                    children: [
                      TextFormField(
                        controller: fName,
                      ),
                      TextFormField(
                        controller: lName,
                      ),
                      TextFormField(
                        controller: addr,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            addData();
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: const Text("Submit"))
                    ],
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
