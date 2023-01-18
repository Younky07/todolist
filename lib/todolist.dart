import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage();

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  bool isComplet = false;
  TextEditingController todoTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Text(
                "All Todo List",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              ),
              Divider(),
              SizedBox(height: 20),
              ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[800],
                ),
                shrinkWrap: true,
                itemCount: 16,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(index.toString()),
                    background: Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                    onDismissed: (direction) {
                      print("removed");
                    },
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          isComplet = !isComplet;
                        });
                      },
                      leading: Container(
                        padding: EdgeInsets.all(2),
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          // shape: BoxShape.circle,
                        ),
                        child: isComplet
                            ? Icon(
                                Icons.check,
                                color: Colors.black,
                              )
                            : Container(),
                      ),
                      title: Text(
                        "TUGAS UAS MOBILE",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.orange[200],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
            builder: (context) => SimpleDialog(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              backgroundColor: Color.fromARGB(255, 66, 66, 66),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Row(
                children: [
                  Text(
                    "Add List",
                    style: TextStyle(fontSize: 20, color: Colors.orange),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.orange,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              children: [
                Divider(),
                TextFormField(
                  controller: todoTitleController,
                  style: TextStyle(
                    fontSize: 15,
                    height: 2,
                    color: Colors.orange[200],
                  ),
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Tambhakan List",
                    hintStyle: TextStyle(color: Colors.orange[200]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Tambah"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.orange,
                    onPressed: () {
                      if (todoTitleController.text.isNotEmpty) {
                        print(todoTitleController.text);
                        Navigator.pop(context);
                      }
                    },
                  ),
                )
              ],
            ),
            context: context,
          );
        },
      ),
    );
  }

  FlatButton(
      {required RoundedRectangleBorder shape,
      required Text child,
      required Color color,
      required MaterialColor textColor,
      required Null Function() onPressed}) {}
}
