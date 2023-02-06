import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ViewAttendance extends StatefulWidget {
  const ViewAttendance({Key? key}) : super(key: key);

  @override
  State<ViewAttendance> createState() => _ViewAttendanceState();
}

class _ViewAttendanceState extends State<ViewAttendance> {
  bool isChecked = false;

  Map<String, bool> numbers = {
    'Student 1': false,
    'Student 2': false,
    'Student 3': false,
    'Student 4': false,
    'Student 5': false,
    'Student 6': false,
    'Student 7': false,
    'Student 8': false,
    'Student 9': false,
    'Student 10': false,
    'Student 11': false,
    'Student 12': false,
    'Student 13': false,
    'Student 14': false,
    'Student 15': false,
    'Student 16': false,
  };

  var holder_1 = [];

  getItems() {
    numbers.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(holder_1);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder_1.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Attendance"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .70,
            width: double.infinity,
            child: ListView(
              children: numbers.keys.map((String key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: numbers[key],
                  activeColor: Colors.pink,
                  checkColor: Colors.white,
                  onChanged: (bool? value) {
                    setState(() {
                      numbers[key] = value!;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ElevatedButton(onPressed: () {}, child: Text("Save")),
                ElevatedButton(onPressed: () {}, child: Text("Download")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
