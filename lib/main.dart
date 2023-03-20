import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: To_Do_List(),
    ),
  );
}

class To_Do_List extends StatefulWidget {
  const To_Do_List({Key? key}) : super(key: key);

  @override
  State<To_Do_List> createState() => _To_Do_ListState();
}

class _To_Do_ListState extends State<To_Do_List> {
  DateTime to = DateTime.now();
  String text = "NULL";
  int t = 8;
  List add = [];
  List<Text> time = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: const Text(
          "To-Do App",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: const [
          Icon(
            Icons.apps_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: time.map(
              (e) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: e,
                      ),
                      Container(
                        height: 60,
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: "Enter Your To-Do here...",
                          ),
                          onChanged: (Value) {
                            setState(() {
                              text = Value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          setState(() {
            t++;
            (t == 24) ? t == 9 : t == 9;
            time.add(
              (t >= 12)
                  ? Text(
                      "${t}:00\n AM",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "${t}:00\n PM",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            );
          });
        },
        child: Container(
          alignment: Alignment.center,
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
