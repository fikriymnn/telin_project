import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';

class FormLoading extends StatefulWidget {
  final Function next;
  const FormLoading({super.key, required this.next});

  @override
  State<FormLoading> createState() => _FormLoadingState();
}

class _FormLoadingState extends State<FormLoading> {
  Response? response;

  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    getDataPerusahaan();
    getDataUser();
    super.initState();
  }

  List perusahaan = [];
  List user = [];

  final TextEditingController projectName = TextEditingController();
  final TextEditingController visselName = TextEditingController();
  final TextEditingController from = TextEditingController();
  final TextEditingController to = TextEditingController();
  final TextEditingController diterima = TextEditingController();
  final TextEditingController remark = TextEditingController();

  String? selectedValueDiserahkan;
  String? selectedValueDiketahui;
  String? selectedValuePerusahaan;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 15, bottom: 30),
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Project Name",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "(Example : Repair SKKL JASUKA LINK BATAM - PONTIANAK)",
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 500,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 5, color: Color(0xffF0F0F0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 5,
                          offset: Offset(0, 4))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, bottom: 8),
                  child: Center(
                    child: TextField(
                      controller: projectName,
                      style: GoogleFonts.montserrat(
                        fontSize: 13.3,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 13.3,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          hintText: "Type Here"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Vissel Name",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: Offset(0, 4))
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 18, bottom: 8),
                              child: Center(
                                child: TextField(
                                  controller: visselName,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      hintText: "Type Here"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "From",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: Offset(0, 4))
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 18, bottom: 8),
                              child: Center(
                                child: TextField(
                                  controller: from,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      hintText: "Type Here"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Diserahkan",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: Offset(0, 4))
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 18, right: 18),
                              child: Center(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    onChanged: (newVal) {
                                      setState(() {
                                        selectedValueDiserahkan = newVal!;
                                      });
                                    },
                                    value: selectedValueDiserahkan,
                                    items: user.map((user) {
                                      return DropdownMenuItem(
                                        child: Text(user['name']),
                                        value: user['_id'].toString(),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Diketahui",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: Offset(0, 4))
                                ]),
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 18, right: 18),
                                child: Center(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      onChanged: (newVal) {
                                        setState(() {
                                          selectedValueDiketahui = newVal!;
                                        });
                                      },
                                      value: selectedValueDiketahui,
                                      items: user.map((user) {
                                        return DropdownMenuItem(
                                          child: Text(user['name']),
                                          value: user['_id'].toString(),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Remark",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: Offset(0, 4))
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 18, bottom: 8),
                              child: Center(
                                child: TextField(
                                  controller: remark,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      hintText: "Type Here"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "To",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: Offset(0, 4))
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 18, bottom: 8),
                              child: Center(
                                child: TextField(
                                  controller: to,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      hintText: "Type Here"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Diterima",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: Offset(0, 4))
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 18, bottom: 8),
                              child: Center(
                                child: TextField(
                                  controller: diterima,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.montserrat(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      hintText: "Type Here"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Perusahaan",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: Offset(0, 4))
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 18, right: 18),
                              child: Center(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    onChanged: (newVal) {
                                      setState(() {
                                        selectedValuePerusahaan = newVal!;
                                      });
                                    },
                                    value: selectedValuePerusahaan,
                                    items: perusahaan.map((perusahaan) {
                                      return DropdownMenuItem(
                                        child: Text(perusahaan['company_name']),
                                        value: perusahaan['_id'].toString(),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  inputDataProject(
                      projectName.text,
                      visselName.text,
                      remark.text,
                      from.text,
                      to.text,
                      selectedValueDiserahkan,
                      diterima.text,
                      selectedValueDiketahui,
                      selectedValuePerusahaan);

                  widget.next;
                },
                child: Container(
                  width: 90,
                  height: 37.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xffEC1D26)),
                  child: Center(
                    child: Text("NEXT",
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
        ),
      ),
    );
  }

// Clear the form
  void _clearForm() {}

  void inputDataProject(projectName, vesselName, remark, from, to, diserahkan,
      diterima, diketahui, perusahaan) async {
    bool status;
    var msg;
    try {
      // var formData = FormData.fromMap({
      //   'Unit': namaUnit,
      // });

      response = await dio.post(newloading, data: {
        "project_name": projectName,
        "vessel_name": vesselName,
        "remark": remark,
        "from": from,
        "to": to,
        "diserahkan": diserahkan,
        "diterima": diterima,
        "diketahui": diketahui,
        "perusahaan": perusahaan
      });

      FocusScope.of(context).unfocus();
      _clearForm();
      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Add New Loading succesfully',
          width: 400,
          confirmBtnColor: Colors.green);
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

  void getDataPerusahaan() async {
    bool status;
    var msg;
    try {
      response = await dio.get(getAllPerusahaan);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          perusahaan = response!.data['data'];
        });
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: '$msg',
            title: 'Peringatan',
            width: 400,
            confirmBtnColor: Colors.red);
      }
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

  void getDataUser() async {
    try {
      response = await dio.get(getUser);

      setState(() {
        user = response!.data;
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
}
