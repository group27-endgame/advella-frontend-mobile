import 'package:flutter/material.dart';

class BrowseMap extends StatelessWidget {
  const BrowseMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.grey[400],
            onPressed: () {
              Navigator.pop(context);
            }
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(child: Image.asset("assets/images/map.png", fit: BoxFit.cover,)),
        ],
      ),
    );
  }
}
