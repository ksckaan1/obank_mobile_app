import 'package:flutter/material.dart';
import 'package:mybank/config/defaults.dart';

class ProfileField extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  ProfileField(
      {Key? key, required this.icon, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: textBlack,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   title,
                  //   style: const TextStyle(color: Colors.grey),
                  // ),
                  Text(
                    value,
                    style: const TextStyle(color: textBlack),
                  )
                ],
              ),
            ],
          ),
          const Icon(
            Icons.edit,
            color: Colors.grey,
            size: 20,
          )
        ],
      ),
    );
  }
}
