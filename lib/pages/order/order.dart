import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/pages/order/off_loading_new_material.dart';

class OrderViewPage extends StatelessWidget {
  const OrderViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const OffLoadingNewMatrial()));
                  },
                  child: Container(
                    width: 170.6,
                    height: 50.6,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffA5C176), width: 3.3),
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xffB1CC85)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.6),
                      child: Center(
                        child: Text("New Material",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.3,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
