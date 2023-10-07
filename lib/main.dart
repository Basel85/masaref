import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/helpers/cache_helper.dart';
import 'package:masaref/core/helpers/observer.dart';
import 'package:masaref/core/widgets/custom_form_field.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Observer();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
           const Text(
              'You have pushed the button this many times:',
            ),
          const  CustomFormField(
              hinttext: 'Hint',
            ),
            Container(
              
            ),
          ],
        ),
      ),
    );
  }
}
