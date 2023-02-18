import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
          const SliverToBoxAdapter(
            child: CupertinoSearchTextField(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              (data == null)
                  ? [
                      const Center(
                        child: Text("Loading"),
                      ),
                    ]
                  : data!
                      .map((e) => CupertinoListTile(
                            onTap: () {
                              if (kDebugMode) {
                                print(e["name"]);
                              }
                            },
                            title: Text(e["name"]),
                            trailing: Text(e["dial_code"]),
                          ))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class DataConstructor extends StatelessWidget {
  const DataConstructor({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
