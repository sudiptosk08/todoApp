import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();

  addItem() async {
    final enteredTitle = titleController.text;
    final enterDate = DateTime.now();
    if (enteredTitle.isEmpty) {
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO"),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              _showDeleteConfirmationDialog();
            },
            tooltip: "Remove All Items",
            child: Icon(Icons.delete),
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              _showAddNewItemModel(context);
            },
            tooltip: "Add Item",
            child: Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: EdgeInsets.all(8),
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  key: ObjectKey(Key),
                  onDismissed: (direction) {},
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(children: [
                        Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.check_box_outline_blank,
                                color: Colors.red),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'task ${index + 1}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                      fontSize: 15.0),
                                ),
                                Text(
                                  DateFormat('EEE, M/d/y')
                                      .format(DateTime.now()),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  _showAddNewItemModel(BuildContext context) {
    titleController.text = '';
    showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25, left: 10, right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Task",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                                              ),

                    ),
                    controller: titleController,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.all(15),
                  child: RaisedButton(onPressed: onPressed),
                )
              ],
            ),
          );
        });
  }
}
