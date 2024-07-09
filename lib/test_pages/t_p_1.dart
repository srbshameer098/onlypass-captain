import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:untitled7/test_pages/t_p_2.dart';



class EventDateTimePage extends StatefulWidget {
  @override
  _EventDateTimePageState createState() => _EventDateTimePageState();
}

class _EventDateTimePageState extends State<EventDateTimePage> {
  DateTime? fromDate;
  TimeOfDay? fromTime;
  DateTime? untilDate;
  TimeOfDay? untilTime;
  bool repeatOn = true;
  DateTime? endDate = DateTime(2024, 8, 17);
  List<bool> selectedDays = [true, true, true, true, false, true, false];

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          untilDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isFromTime) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isFromTime) {
          fromTime = picked;
        } else {
          untilTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF1B1B1B),
      appBar: AppBar(
        title: Text('Set event date & time'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From'),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: fromDate == null
                          ? 'Date'
                          : DateFormat('dd/MM/yyyy').format(fromDate!),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context, true),
                      ),
                    ),
                    onTap: () => _selectDate(context, true),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(

                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: fromTime == null
                          ? 'Time'
                          : fromTime!.format(context),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.access_time),
                        onPressed: () => _selectTime(context, true),
                      ),
                    ),
                    onTap: () => _selectTime(context, true),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Until'),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: untilDate == null
                          ? 'Date'
                          : DateFormat('dd/MM/yyyy').format(untilDate!),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context, false),
                      ),
                    ),
                    onTap: () => _selectDate(context, false),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: untilTime == null
                          ? 'Time'
                          : untilTime!.format(context),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.access_time),
                        onPressed: () => _selectTime(context, false),
                      ),
                    ),
                    onTap: () => _selectTime(context, false),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Advanced settings'),

            // SwitchListTile(
            //   title: Text('Repeat on'),
            //   value: repeatOn,
            //   onChanged: (bool value) {
            //     setState(() {
            //       repeatOn = value;
            //     });
            //   },
            // ),
            Row(
              children: [
                Checkbox(value: repeatOn, onChanged:( value) {
                  setState(() {
                    repeatOn = value!;
                  });
                }),
                Text('Repeat on'),
                Text('Ends on'),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: endDate == null
                          ? 'Select Date'
                          : DateFormat('dd/MM/yyyy').format(endDate!),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context, false),
                      ),
                    ),
                    onTap: () => _selectDate(context, false),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 8,
              children: List.generate(7, (index) {
                return SizedBox(
                  width: 41.sp, // Fixed width
                  height: 24.sp, // Fixed height

                  child: FilterChip(
                    disabledColor: Colors.grey[900],
                    elevation: 0,
                    labelPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    showCheckmark: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    backgroundColor:
                    // selectedDays[index] ? Colors.blue :
                    Colors.grey[800],
                    label: Text(
                      ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index]
                    ),
                    selectedColor: Colors.white,
                    selected: selectedDays[index],
                    labelStyle:
                    selectedDays[index] ? TextStyle(color: Colors.black ,fontSize: 12.sp) :
                    TextStyle(color: Colors.grey[400],fontSize: 12.sp),
                    side: BorderSide(color: Colors.transparent),
                    onSelected: (bool selected) {
                      setState(() {
                        selectedDays[index] = selected;
                      });
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 160),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> Location()));
              },
              child: Icon(
                Icons.arrow_circle_right,size: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
