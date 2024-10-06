

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/components/person_item/person_item.dart';
import '../show_person_details/show_person_details.dart';

class ShowPersonsScreen extends StatelessWidget {
  const ShowPersonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/background.png"),fit: BoxFit.cover)
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme:const IconThemeData(color: Colors.black),
          leading: Container(),
          title: Padding(
            padding: const EdgeInsetsDirectional.only(top: 15),
            child: Text(
              'All',
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
              softWrap: false,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: (MediaQuery.of(context).orientation ==
                        Orientation.landscape)
                        ? 4
                        : 2,
                    physics: const NeverScrollableScrollPhysics(),
                    // crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 1.0,
                    childAspectRatio: 1 / 1.2,
                    children: List.generate(
                      12,
                            (index) => InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPersonDetailsScreen()));

                              },
                              child: PersonItem(
                                onClick: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPersonDetailsScreen()));
                                },
                                personName: "Ahmed Mohamed",
                                personType: "Analyst",
                              ),
                            ))),

            ],
          ),
        ),
      ),
    );
  }
}
