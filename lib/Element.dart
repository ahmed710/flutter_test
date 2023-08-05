import 'package:flutter/material.dart';

class Element extends StatelessWidget {
  const Element({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(height: 4),
        itemBuilder: (context, index) {
          return _buildElementCard(index);
        },
      ),
    );
  }

  Widget _buildElementCard(int index) {
    String title = 'Title $index';
    String text = 'Nom Client $index';
    String dateText = '12/03/23';
    String MotoText = 'Moto';

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1),
        side: BorderSide(
          color: Color(0xFFEAEAEA),
          width: 2.0,
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        text,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.directions_bike,
                        color: Color(0xFFFF4200),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Moto',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Color(0xFF707070), fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          dateText,
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Color(0xFF707070), fontSize: 14),
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Element(),
  ));
}
