import 'package:appointment_manager/themes/theme_color.dart';
import 'package:appointment_manager/themes/theme_text.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:appointment_manager/db/db.dart';
import 'package:appointment_manager/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:appointment_manager/components/button_component.dart';

import '../../components/appbar.dart';
import '../../components/rounded_ container.dart';
import '../../components/text_field_component.dart';
import '../../model/appointment.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final TextEditingController dateController = TextEditingController();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController timeController = TextEditingController();

  final TextEditingController datetimeController = TextEditingController();

  List<Appointment> appointmentList = [];

  List<Appointment> convertAppointmentsToList(List appointments) {
    List<Appointment> appointmentList = [];

    for (var appointment in appointments) {
      String title = appointment['title'];
      String location = appointment['location'];
      DateTime dateTime = appointment['date'];

      String formattedDateTime =
          DateFormat('MMM d, yyyy - hh:mm a').format(dateTime);

      Appointment appointmentData = Appointment(
        title: title,
        location: location,
        dateTime: formattedDateTime,
      );

      appointmentList.add(appointmentData);
    }

    return appointmentList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'My Appointments',
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Your Calendar :',
                  style:
                      ThemeText.subtitle.copyWith(color: ThemeColor.tertiary),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SfDateRangePicker(
                    headerStyle: DateRangePickerHeaderStyle(
                        textStyle: ThemeText.subtitle
                            .copyWith(color: ThemeColor.tertiary)),
                    monthCellStyle: const DateRangePickerMonthCellStyle(
                      selectionColor:
                          Colors.red, // Replace with your desired color
                    ),
                    onSelectionChanged: (date) async {
                      dateController.text =
                          DateFormat('yyyy-MM-dd').format(date.value);
                      //Db.addAppointment(date: date.value, email: 'email', location: 'location', title: 'title');
                      //Db.addAppointment(date: date.value, email: 'email', location: 'location', title: 'title');
                      List appointments = await Db.getAppointmentsByDate(
                        date: date.value,
                        email: Db.userEmail, // Replace with the actual email
                      );
                      appointmentList = convertAppointmentsToList(appointments);

                      // Force rebuild the UI
                      setState(() {});
                      // Do something with the retrieved appointments
                      // For example, update the UI with the appointments
                      print(appointments);
                    },
                    todayHighlightColor: ThemeColor.tertiary,
                    selectionMode: DateRangePickerSelectionMode.single,
                    viewSpacing: 10,
                    view: DateRangePickerView.month,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                flex: 5,
                child: appointmentList.isEmpty
                    ? Center(
                        child: Text('No Appointments on this date',
                            style: ThemeText.subtitle),
                      )
                    : ListView.builder(
                        itemCount: appointmentList.length,
                        itemBuilder: (context, index) {
                          Appointment appointment = appointmentList[index];

                          return RoundedContainer(
                            title: appointment.title,
                            location: appointment.location,
                            dateTime: appointment.dateTime,
                          );
                        },
                      ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ButtonComponent(
                      text: 'Add Appointment',
                      onTap: () {
                        Get.bottomSheet(
                          SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: Utils.borderRadiusDirectional),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextFieldComponent(
                                    controller: titleController,
                                    placeHolder: 'Title',
                                  ),
                                  TextFieldComponent(
                                    controller: locationController,
                                    placeHolder: 'Location',
                                  ),
                                  TextFieldComponent(
                                    readOnly: true,
                                    controller: datetimeController,
                                    placeHolder: 'Time',
                                    onTap: () {
                                      Navigator.of(context).push(
                                        showPicker(
                                          context: context,
                                          is24HrFormat: true,
                                          value: Time(hour: 23, minute: 30),
                                          onChange: (time) {
                                            timeController.text =
                                                '${time.hour}:${time.minute}:00';

                                            datetimeController.text =
                                                '${dateController.text} ${timeController.text}';
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ButtonComponent(
                                    text: 'Add Appointment',
                                    onTap: () async => await Db.addAppointment(
                                        date: DateTime.parse(
                                            datetimeController.text),
                                        email: Db.userEmail,
                                        location: locationController.text,
                                        title: titleController.text),
                                  )
                                ],
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: Utils.borderRadiusDirectional),
                          enableDrag: true,
                          isScrollControlled: false,
                          isDismissible: true,
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
