import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/app/modules/details/details_controller.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder:(_) => const Scaffold());
  }
}