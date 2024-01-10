import 'package:flutter/material.dart';

class DetailLoading extends StatefulWidget {
  const DetailLoading({super.key, required this.idLoading});
  final String idLoading;

  @override
  State<DetailLoading> createState() => _DetailLoadingState();
}

class _DetailLoadingState extends State<DetailLoading> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
