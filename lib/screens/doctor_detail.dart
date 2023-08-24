// ignore_for_file: prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, deprecated_member_use, unused_element, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class SliverDoctorDetail extends StatelessWidget {
  const SliverDoctorDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text('Detail Doctor'),
            backgroundColor: Color.fromARGB(255, 99, 179, 110),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/hospital.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: DetailBody(),
          )
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  DateTime selectedDate = DateTime.now();
  TextEditingController numberController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color.fromARGB(255, 187, 245, 194), // <-- SEE HERE
              onPrimary: Color.fromARGB(255, 99, 179, 110), // <-- SEE HERE
              onSurface: Color.fromARGB(255, 99, 179, 110), // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Color.fromARGB(255, 99, 179, 110), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    await _showSMSDialog(context);
  }

  Future<void> sendSMS(String message, String number) async {
    String uri = 'sms:$number?body=${Uri.encodeComponent(message)}';

    if (await canLaunch(uri)) {
      await launch(uri);
      print(uri);
    } else {
      print('Could not launch SMS');
    }
  }

  Future<void> _showSMSDialog(BuildContext context) async {
    String message = "Appointment is Booked!";
    String number = "8108863547";

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Send SMS'),
          content: Text('Do you want to send the reminder SMS?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Send'),
              onPressed: () async {
                // String number = numberController.text;
                // TextField(
                //   controller: numberController,
                //   decoration: InputDecoration(labelText: "Phone Number"),
                // );
                if (number.isNotEmpty) {
                  await sendSMS(message, number);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DetailDoctorCard(),
          SizedBox(
            height: 15,
          ),
          DoctorInfo(),
          SizedBox(
            height: 30,
          ),
          Text(
            'About Doctor',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Dr. Sushil is a specialist in internal medicine who specialzed blah blah.',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 99, 179, 110),
              ),
            ),
            child: Text('Book Appointment'),
            onPressed: () => _selectDate(context),
          ),
          // SizedBox(height: 20),
          // Text("Selected Date: ${selectedDate.toLocal()}".split(' ')[0]),
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        NumberCard(
          label: 'Patients',
          value: '100+',
        ),
        SizedBox(width: 15),
        NumberCard(
          label: 'Experiences',
          value: '10 years',
        ),
        SizedBox(width: 15),
        NumberCard(
          label: 'Rating',
          value: '4.0',
        ),
      ],
    );
  }
}

class AboutDoctor extends StatelessWidget {
  final String title;
  final String desc;
  const AboutDoctor({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NumberCard extends StatelessWidget {
  final String label;
  final String value;

  const NumberCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 187, 245, 194),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailDoctorCard extends StatelessWidget {
  const DetailDoctorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Sushil',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Heart Specialist',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Image(
                image: AssetImage('assets/doctor01.jpeg'),
                width: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
