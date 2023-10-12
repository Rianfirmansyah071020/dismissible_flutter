import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Dismissible(
              // confirmDismiss: (direction) async {
              //   return direction == DismissDirection.endToStart;
              // },
              confirmDismiss: (direction) {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Are you sure?"),
                      content: Text("Anda yakin ?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Tidak"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Yes"),
                        ),
                      ],
                    );
                  },
                );
              },
              key: Key(index.toString()),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Color.fromARGB(255, 42, 156, 194),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 25,
                ),
                alignment: Alignment.centerRight,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  ),
                ),
                title: Text("Title"),
                subtitle: Text("subtitle"),
              ),
            );
          },
        ),
      ),
    );
  }
}
