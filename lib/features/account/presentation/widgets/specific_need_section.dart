import 'package:flutter/material.dart';
import 'package:paperless_app/common/spacers.dart';

class SpecificNeedsForm extends StatelessWidget {
  const SpecificNeedsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 100, 40, 150),
      color: Colors.grey[50],
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.pink.shade50, borderRadius: BorderRadius.circular(6)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Do you have a specific need?',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              verticalSpacingMedium,
              Text(
                'Do you have a specific feature you would like to add to your listings? We are glad to help you. Please tell us exactly what you want',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey[800],
                      fontSize: 18,
                    ),
              ),
              verticalSpacingMedium,
              Text(
                'Feature Request',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey[800],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              verticalSpacingTiny,
              const TextField(
                maxLines: 3,
                minLines: 3,
                decoration: InputDecoration(
                  hintText: 'Briefly describe what you need',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              verticalSpacingSmall,
              button(),
              const SizedBox(
                height: 200,
              )
            ]),
      ),
    );
  }

  Widget button() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          minimumSize: const Size(160, 50),
          backgroundColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          )),
      child: const Text(
        'Send',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
