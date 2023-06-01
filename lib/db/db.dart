import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../screens/calendar/calendar.dart';

class Db {
  static String userEmail = '';
  static String userName = '';

  static registerUser(
      {required String email,
      required String name,
      required String password,
      required String phone}) async {
    var users = await Hive.openBox('users');

    if (users.containsKey(email)) {
      Get.defaultDialog(
          title: 'Alert', content: const Text('This email already exists'));
    } else {
      users.put(email, {'password': password, 'phone': phone, 'name': name});
      userName = name;
      Get.defaultDialog(
          title: 'Success',
          content: const Text(
              'Account created successfully, please login using your newly created account.'));
    }
  }

  static login({required String email, required String password}) async {
    var users = await Hive.openBox('users');

    if (users.containsKey(email)) {
      var user = users.get(email);

      if (user['password'] == password) {
        userEmail = email;
        Get.to(() => CalendarPage());
      } else {
        Get.defaultDialog(
            title: 'Alert',
            content:
                const Text('You entered wrong credentials, please try again'));
      }
    } else {
      Get.defaultDialog(
          title: 'Alert', content: const Text('Account does not exist.'));
    }
  }

  static addAppointment(
      {required DateTime date,
      required String email,
      required String location,
      required String title}) async {
    var appointments = await Hive.openBox('appointments');
    if (appointments.containsKey(email)) {
      List data = appointments.get(email);

      List newData = data
        ..add({'date': date, 'location': location, 'title': title});

      appointments.put(email, newData);

      Get.defaultDialog(
          title: 'Success', content: const Text('Added Successfully'));
    } else {
      appointments.put(email, [
        {'date': date, 'location': location, 'title': title}
      ]);

      Get.defaultDialog(
          title: 'Success', content: const Text('Added Successfully'));
    }
  }

  static getAppointments({required String email}) async {
    var appointments = await Hive.openBox('appointments');
    return appointments.get(email);
  }

  static getAppointmentsByDate(
      {required DateTime date, required String email}) async {
    var appointments = await Hive.openBox('appointments');
    List appointmentData = appointments.get(email) ?? [];

    List filteredAppointments = appointmentData.where((appointment) {
      DateTime appointmentDate = appointment['date'];
      return appointmentDate.year == date.year &&
          appointmentDate.month == date.month &&
          appointmentDate.day == date.day;
    }).toList();

    return filteredAppointments;
  }
}
