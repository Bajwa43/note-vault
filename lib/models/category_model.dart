// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CategoryModel {
  IconData iconCategory;
  String nameOfCategory;
  Color colorCategory;
  CategoryModel(
      {required this.iconCategory,
      required this.nameOfCategory,
      required this.colorCategory});

  static List<CategoryModel> listOfCateoryModel = [
    CategoryModel(
        iconCategory: Icons.local_grocery_store,
        nameOfCategory: 'Grocery',
        colorCategory: Colors.green),
    CategoryModel(
        iconCategory: Icons.work,
        nameOfCategory: 'Work',
        colorCategory: Colors.red),
    CategoryModel(
        iconCategory: Icons.sports_rugby_outlined,
        nameOfCategory: 'Sport',
        colorCategory: Colors.orange),
    CategoryModel(
        iconCategory: Icons.sports_rugby_outlined,
        nameOfCategory: 'Design',
        colorCategory: Colors.yellow),
    CategoryModel(
        iconCategory: Icons.sports_rugby_outlined,
        nameOfCategory: 'University',
        colorCategory: Colors.grey.shade400),
    CategoryModel(
        iconCategory: Icons.multitrack_audio_outlined,
        nameOfCategory: 'Social',
        colorCategory: Colors.cyan),
    CategoryModel(
        iconCategory: Icons.music_video_rounded,
        nameOfCategory: 'Music',
        colorCategory: Colors.purpleAccent),
    CategoryModel(
        iconCategory: Icons.health_and_safety,
        nameOfCategory: 'Health',
        colorCategory: Colors.green),
    CategoryModel(
        iconCategory: Icons.local_movies_outlined,
        nameOfCategory: 'Movies',
        colorCategory: Colors.tealAccent),
    CategoryModel(
        iconCategory: Icons.home,
        nameOfCategory: 'Home',
        colorCategory: Colors.orange.shade300),
    CategoryModel(
        iconCategory: Icons.add,
        nameOfCategory: 'Create New',
        colorCategory: Color(0xFF80FFD1)),
  ];
}
