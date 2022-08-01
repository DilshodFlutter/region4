import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:region4/src/model/oson_model.dart';
import 'package:http/http.dart' as http;

class OsonScreen extends StatefulWidget {
  const OsonScreen({Key? key}) : super(key: key);

  @override
  State<OsonScreen> createState() => _OsonScreenState();
}

class _OsonScreenState extends State<OsonScreen> {
  List<OsonModel> data = [];

  @override
  void initState() {
    _getTyson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data[index].name),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data[index].childs.length,
                itemBuilder: (context, position) {
                  return Column(
                    children: [
                      Text(
                        data[index].childs[position].name,
                      ),
                    ],
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }

  void _getTyson() async {
    String url =
        "https://api.osonapteka.uz/api/v1/regions?lan=uz&user=4ec8cc4ef07d43e6";
    print(url);
    http.Response response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(response.body);
    data = osonModelFromJson(response.body);
    setState(() {});
  }
}
