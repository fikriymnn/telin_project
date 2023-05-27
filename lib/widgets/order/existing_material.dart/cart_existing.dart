import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/existing_material.dart/table/table_cable_cart_existing.dart';

class CartExisting extends StatefulWidget {
  const CartExisting({super.key, required this.idLoading});

  final String idLoading;

  @override
  State<CartExisting> createState() => _CartExistingState();
}

class _CartExistingState extends State<CartExisting> {
  List LoadingById = [];
  String id = "";
  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    id = widget.idLoading;
    getDataLoading();
    super.initState();
  }

  void getDataLoading() async {
    var msg;
    try {
      response = await dio.get('$getLoadingById/$id');
      msg = response!.data['message'];
      setState(() {
        LoadingById = response!.data['loading'];
      });
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
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.6),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19.3, vertical: 12.6),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Text(
                            "WORK ORDER",
                            style: GoogleFonts.montserrat(
                              fontSize: 10.6,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 99.3,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: active),
                              child: Center(
                                child: Text("SUBMIT",
                                    style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: const Color(0xFFED1D25),
                              child: Center(
                                child: Text("X",
                                    style: GoogleFonts.roboto(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
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
                          Text(
                              "${LoadingById[index]['perusahaan']['company_name']}",
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
                  SizedBox(
                      height: 400,
                      child: Column(
                        children: [
                          Flexible(
                              child: TableCableCartExisting(
                            idLoading: widget.idLoading,
                          )),
                        ],
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  // SizedBox(
                  //   height: 250,
                  //   child: Column(
                  //     children: [
                  //       Expanded(
                  //           child: TableNonCableCart(
                  //         idLoading: widget.idLoading,
                  //       )),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // SizedBox(
                  //   height: 250,
                  //   child: Column(
                  //     children: [
                  //       Expanded(
                  //           child: TableCableTurnOverCart(
                  //         idLoading: widget.idLoading,
                  //       )),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 22,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
