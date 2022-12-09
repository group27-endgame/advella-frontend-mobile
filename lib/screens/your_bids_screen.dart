import 'package:advella/cards/your_bids_service_card.dart';
import 'package:advella/models/product.dart';
import 'package:advella/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cards/product_card.dart';
import '../cards/service_card.dart';
import '../models/product_category.dart';
import '../models/service_category.dart';
import '../viewmodels/category_viewmodel.dart';
import '../viewmodels/product_viewmodel.dart';
import '../viewmodels/service_viewmodel.dart';
import 'add_product_screen.dart';
import 'add_service_screen.dart';
import 'browse_services.dart';

class YourBidsScreen extends StatefulWidget {
  const YourBidsScreen({Key? key}) : super(key: key);

  @override
  _YourBidsScreenState createState() => _YourBidsScreenState();
}

class _YourBidsScreenState extends State<YourBidsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatScreen(),
    );
  }

  }