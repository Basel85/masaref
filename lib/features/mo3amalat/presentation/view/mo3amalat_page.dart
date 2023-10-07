import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/features/mo3amalat/presentation/view/widgets/mo3amala_componant.dart';
import 'package:masaref/features/mo3amalat/presentation/view/widgets/search_field.dart';

class Mo3amalatPage extends StatelessWidget {
  const Mo3amalatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star_outline,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            const SearchField(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) => const Mo3amalaComponant(),
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
