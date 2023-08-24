// ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable, prefer_typing_uninitialized_variables, unnecessary_new, avoid_print, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:medicare/api/covid.dart';
import 'package:medicare/api/hospital.dart';
import 'package:medicare/api/medical.dart';
import 'package:medicare/styles/colors.dart';

List<Map> doctors = [
  {
    'img': 'assets/doctor02.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/doctor03.jpeg',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  },
  {
    'img': 'assets/doctor02.png',
    'doctorName': 'Dr. Sam',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/doctor03.jpeg',
    'doctorName': 'Dr.Mandar',
    'doctorTitle': 'Skin Specialist'
  }
];

class HomeTab extends StatelessWidget {
  final void Function() onPressedScheduleCard;

  const HomeTab({
    Key? key,
    required this.onPressedScheduleCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            UserIntro(),
            SizedBox(
              height: 10,
            ),
            SearchInput(),
            SizedBox(
              height: 20,
            ),
            CategoryIcons(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Appointment Today',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            AppointmentCard(
              onTap: onPressedScheduleCard,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Top Doctor',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            for (var doctor in doctors)
              TopDoctorCard(
                img: doctor['img'],
                doctorName: doctor['doctorName'],
                doctorTitle: doctor['doctorTitle'],
              )
          ],
        ),
      ),
    );
  }
}

class TopDoctorCard extends StatelessWidget {
  String img;
  String doctorName;
  String doctorTitle;

  TopDoctorCard({
    required this.img,
    required this.doctorName,
    required this.doctorTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Container(
          color: Color.fromARGB(255, 187, 245, 194),
          child: Row(
            children: [
              Container(
                color: Colors.white,
                child: Image(
                  width: 100,
                  image: AssetImage(img),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    doctorTitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.black,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '4.0 - 50 Reviews',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final void Function() onTap;

  const AppointmentCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 99, 179, 110),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/doctor01.jpeg'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Dr.Sushil',
                                  style: TextStyle(color: Colors.black)),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Dental Specialist',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ScheduleCard(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 156, 212, 118),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 187, 245, 194),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryIcons extends StatelessWidget {
  const CategoryIcons({
    Key? key,
  }) : super(key: key);

  Future<void> showCovidDataDialog(
      BuildContext context, String categoryText) async {
    covid cov = new covid();
    await cov.getData();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('COVID-19 Data for $categoryText'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('State: ${cov.state}'),
              Text('Confirmed: ${cov.confirmed.toString()}'),
              Text('Recovered: ${cov.recovered.toString()}'),
              Text('Deaths: ${cov.deaths.toString()}'),
              Text('Active: ${cov.active.toString()}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showHospitalsDataDialog(
    BuildContext context,
  ) async {
    hospital hos = new hospital();
    await hos.getData();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Numbers of Hospitals'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('State: ${hos.state}'),
              Text('Hospitals: ${hos.hospitals.toString()}'),
              Text('Beds: ${hos.bed.toString()}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showDrugsDataDialog(
    BuildContext context,
  ) async {
    medical med = new medical();
    await med.getData();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pharmacy Companies '),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Company Name: ${med.name}'),
              Text('Number of Products: ${med.products.toString()}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<void> makeCall(
    BuildContext context,
  ) async {
    var url = Uri.parse("tel:+8108863547");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      print(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryIcon(
          icon: Icons.coronavirus,
          text: 'Covid 19',
          onTap: () {
            showCovidDataDialog(context, 'Covid 19');
          },
        ),
        CategoryIcon(
          icon: Icons.local_hospital,
          text: 'Hospital',
          onTap: () {
            showHospitalsDataDialog(
              context,
            );
          },
        ),
        CategoryIcon(
          icon: Icons.car_rental,
          text: 'Ambulance',
          onTap: () {
            makeCall(context);
          },
        ),
        CategoryIcon(
          icon: Icons.local_pharmacy,
          text: 'Pill',
          onTap: () {
            showDrugsDataDialog(context);
          },
        ),
      ],
    );
  }
}

class CategoryIcon extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback onTap;

  CategoryIcon({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color.fromARGB(255, 187, 245, 194),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(MyColors.bg),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                icon,
                color: Color.fromARGB(255, 99, 179, 110),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: Color.fromARGB(255, 99, 179, 110),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 187, 245, 194),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.calendar_today,
            color: Colors.black,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Mon, July 29',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.black,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '11:00 ~ 12:10',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 187, 245, 194),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search a doctor or health issue',
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserIntro extends StatelessWidget {
  const UserIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if userEmail is not null before using it
    final String? userEmail =
        ModalRoute.of(context)!.settings.arguments as String?;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              userEmail!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/person.jpeg'),
        )
      ],
    );
  }
}
