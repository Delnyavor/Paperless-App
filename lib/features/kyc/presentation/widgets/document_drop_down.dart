import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_app/features/kyc/domain/entities/identifier.dart';

import '../bloc/kyc_bloc.dart';

class DocTypeSelector extends StatefulWidget {
  const DocTypeSelector({super.key});

  @override
  State<DocTypeSelector> createState() => _DocTypeSelectorState();
}

class _DocTypeSelectorState extends State<DocTypeSelector> {
  late KycBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<KycBloc>(context);
  }

  List<DocumentType> types = [
    DocumentType.id,
    DocumentType.license,
    DocumentType.passport,
  ];
  List<String> c = [
    "ID Card",
    "Driver's License",
    "Passport",
  ];

  DocumentType? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: DropdownButton2<DocumentType>(
            value: value,
            isExpanded: true,
            underline: const SizedBox.shrink(),
            dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8))),
            customButton: child(),
            onChanged: (type) {
              setState(() {
                value = type!;
                bloc.add(UpdateDocumentTypeEvent(type: value));
              });
            },
            items: types
                .map((e) => DropdownMenuItem<DocumentType>(
                      value: e,
                      child: Text(c[types.indexOf(e)]),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget child() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.pink, width: 1),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value == null ? 'Select Document' : c[types.indexOf(value!)],
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
