import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String dropdownvalue = 'Tanjungsiang, Subang';
  var items = [
    'Tanjungsiang, Subang',
    'İSTANBUL',
    'ANKARA',
    'İZMİR',
  ];
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Row(
            children: [
              DropdownButton(
                value: widget.dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: widget.items.map((itemss) {
                  return DropdownMenuItem(
                    value: itemss,
                    child: Text(
                      itemss,
                    ),
                  );
                }).toList(),
                onChanged: (String? newValuee) {
                  setState(() {
                    widget.dropdownvalue = newValuee!;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
