import 'package:flutter/material.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    Key? key,
    required this.name,
    required this.id,
    required this.picture,
    required this.isConnected,
  }) : super(key: key);
  final String? name;
  final String? id;
  final String? picture;
  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (id != null) {
          Navigator.pushNamed(
            context,
            '/patientData',
            arguments: {'userId': id},
          );
        }
      },
      child: Card(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: CircleAvatar(
                radius: 35, // Image radius
                backgroundImage: NetworkImage(
                  picture!,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: Text(
                name!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.centerRight,
              child: Text(
                isConnected ? 'Connected' : 'Disconnected',
                style: TextStyle(
                  color: isConnected ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 5.0,
                top: 10.0,
                right: 10.0,
                bottom: 10.0,
              ),
              alignment: Alignment.centerRight,
              child: const Icon(Icons.arrow_forward_ios_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
