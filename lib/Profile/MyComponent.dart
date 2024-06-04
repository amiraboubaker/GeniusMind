import 'package:flutter/material.dart';

class MyComponent extends StatelessWidget {
  final String title;
  final IconData icon;

  MyComponent({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 254, 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Color.fromARGB(255, 120, 27, 233),
              size: 60.0,
            ),
            SizedBox(width: 16.0),
            Text(
              title,
              style: TextStyle(
                color: Color.fromARGB(255, 101, 47, 166),
                fontSize: 26.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Color(0xffa58f6e)),
          ],
        ),
      ),
    );
  }
}
