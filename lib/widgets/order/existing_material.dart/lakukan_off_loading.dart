import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';

import 'package:telin_project/widgets/order/existing_material.dart/cart_existing.dart';
import 'package:telin_project/widgets/order/existing_material.dart/print_bast/bast_existing.dart';
import 'package:telin_project/widgets/order/existing_material.dart/table/table_cable_off_loading.dart';
import 'package:telin_project/widgets/order/existing_material.dart/table/table_non_cable_off_loading.dart';

class LakukanOffLoading extends StatefulWidget {
  const LakukanOffLoading({super.key, required this.idOffLoading});
  final String idOffLoading;

  @override
  State<LakukanOffLoading> createState() => _LakukanOffLoadingState();
}

class _LakukanOffLoadingState extends State<LakukanOffLoading> {
  List LoadingById = [];
  String id = "";
  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    id = widget.idOffLoading;
    getDataOffLoading();
    super.initState();
  }

  void getDataOffLoading() async {
    var msg;
    try {
      response = await dio.get('$getOffLoadingById/$id');
      msg = response!.data['message'];
      setState(() {
        LoadingById = response!.data['loading'];
      });
    } catch (e) {
      // QuickAlert.show(
      //     context: context,
      //     type: QuickAlertType.error,
      //     text: 'Terjadi Kesalahan Pada Server Kami',
      //     title: 'Peringatan',
      //     width: 400,
      //     confirmBtnColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Silahkan Pergi ke halaman lain untuk me-refresh halaman ini"),
      ));
    }
  }

  void submitDataOffLoading(id) async {
    var msg;
    try {
      response = await dio.post('$submiOffLoadingExisting/$id');

      msg = response!.data['message'];

      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: '$msg',
          title: 'Peringatan',
          width: 400,
          barrierDismissible: true,
          confirmBtnColor: Colors.red);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BastOffLoading(
                    idLoading: id,
                  )));
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Terjadi Kesalahan Pada Server Kami',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 59.3, top: 32),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 107.3,
                          height: 37.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color(0xffB8B8B8), width: 1)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.subdirectory_arrow_left,
                                color: Color(0xffED1D25),
                                size: 28.6,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Back",
                                style: GoogleFonts.roboto(
                                  fontSize: 17.3,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffED1D25),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("OFF-LOADING",
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.6,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CartExisting(
                                        idLoading: widget.idOffLoading,
                                      );
                                    });
                              },
                              icon: Icon(
                                Icons.shopping_cart,
                                color: active,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 221.3,
                            height: 22.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1, color: const Color(0xffC1C1C1)),
                                color: const Color(0xffF3F3F3)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 7),
                              child: TextField(
                                style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF9D9D9D),
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: GoogleFonts.roboto(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF9D9D9D),
                                    ),
                                    hintText: "Search"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              submitDataOffLoading(widget.idOffLoading);
                            },
                            child: Container(
                              width: 90,
                              height: 37.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: active),
                              child: Center(
                                child: Text("Done",
                                    style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: LoadingById.length,
              itemBuilder: (context, index) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${LoadingById[index]['project_name'] ?? "-"}",
                        style: GoogleFonts.montserrat(
                          fontSize: 13.3,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: LoadingById.length,
              itemBuilder: (contect, index) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${LoadingById[index]['perusahaan']['company_name']}",
                        style: GoogleFonts.montserrat(
                          fontSize: 13.3,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      width: 284,
                    ),
                    Text(
                        "${LoadingById[index]['from']} - ${LoadingById[index]['to']}",
                        style: GoogleFonts.montserrat(
                          fontSize: 13.3,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 400,
                child: Column(
                  children: [
                    Flexible(
                        child: TableCableOffLoading(
                      idOffLoading: widget.idOffLoading,
                    )),
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 250,
              child: Column(
                children: [
                  Expanded(
                      child: TableNonCableOffLoading(
                    idOffLoading: widget.idOffLoading,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
