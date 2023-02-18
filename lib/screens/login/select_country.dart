import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  List<dynamic>? dataRetrieved;
  List<dynamic>? data;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    final String response =
        await rootBundle.loadString("assets/CountryCodes.json");
    dataRetrieved = await json.decode(response) as List<dynamic>;
    setState(() {
      data = dataRetrieved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text("Select Country"),
            previousPageTitle: "Edit Number",
          ),
          SliverList(
            delegate: SliverChildListDelegate(data != null)
                ? data!
                    .map((e) => CupertinoListTile(
                          title: Text(e["name"]),
                          trailing: Text(e["dial_code"]),
                        ))
                    .toList()
                : [
                    Center(
                      child: Text("Loading"),
                    )
                  ],
          ),
        ],
      ),
    );
  }
}
