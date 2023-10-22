import 'package:flutter/material.dart';
import 'package:health_app/presentation/widgets/custom_textfield.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                      color: Colors.grey.shade100)
                ]),
            padding: const EdgeInsets.all(12.0),
            child: const Icon(Icons.tune_rounded),
          ),
          const SizedBox(width: 30),
          const Expanded(
            child: CustomTextField(
              suffixIcon: Icon(Icons.search),
              hintText: 'Search',
            ),
          )
        ],
      ),
    );
  }
}
