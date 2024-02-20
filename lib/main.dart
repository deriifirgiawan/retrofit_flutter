import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_flutter/configs/app_config.dart';
import 'package:retrofit_flutter/models/article_model.dart';
import 'package:retrofit_flutter/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late ApiService apiService;
  List<ArticleModel>? listData = [];

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    apiService = ApiService(dio);
  }

  Future<void> fetchData() async {
    try {
      final response = await apiService.getTopHeadlinesService(apiKey, "us");
      if (response.status == "ok") {
        setState(() {
          listData = response.articles;
        });
      }
    } catch (error) {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
              child: Column(
        children: [
          ElevatedButton(
            onPressed: fetchData,
            child: const Text("Fetch Data"),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: listData!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(listData?[index].title ?? ""),
                subtitle: Text(listData?[index].description ?? ""),
              );
            },
          ))
        ],
      ))),
    );
  }
}
