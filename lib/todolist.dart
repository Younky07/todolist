import 'package:flutter/material.dart';

class TodoList extends MaterialApp {
  @override
  Widget Build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(26),
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    leading: Container(
                      height: 35,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle),
                    ),
                    title: Text(
                      "Todo Title",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange[200],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
