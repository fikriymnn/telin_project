import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/widgets/order/new_material/add_new_material.dart';

class FormNewMaterialExisting extends StatefulWidget {
  const FormNewMaterialExisting({
    super.key,
  });

  @override
  State<FormNewMaterialExisting> createState() =>
      _FormNewMaterialExistingState();
}

class _FormNewMaterialExistingState extends State<FormNewMaterialExisting> {
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
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
                    border:
                        Border.all(width: 5, color: const Color(0xffF0F0F0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 5,
                          offset: const Offset(0, 4))
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
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
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 230,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border:
                        Border.all(width: 5, color: const Color(0xffF0F0F0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 5,
                          offset: const Offset(0, 4))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, bottom: 8),
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
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
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
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: const Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: const Offset(0, 4))
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
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "submitted",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: const Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: const Offset(0, 4))
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
                                        value: user['_id'].toString(),
                                        child: Text(user['name']),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Is known",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: const Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: const Offset(0, 4))
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
                                          value: user['_id'].toString(),
                                          child: Text(user['name']),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
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
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: const Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: const Offset(0, 4))
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
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "received",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: const Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: const Offset(0, 4))
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
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Company",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 5, color: const Color(0xffF0F0F0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 5,
                                      offset: const Offset(0, 4))
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
                                        value: perusahaan['_id'].toString(),
                                        child: Text(perusahaan['company_name']),
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
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  if (projectName == null ||
                      remark == null ||
                      from == null ||
                      to == null ||
                      selectedValueDiserahkan == null ||
                      selectedValuePerusahaan == null ||
                      selectedValueDiketahui == null ||
                      diterima == null) {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        title: 'Peringatan',
                        text: 'All must be filled in',
                        width: 400,
                        confirmBtnColor: Colors.red);
                  } else {
                    inputDataProject(
                        projectName.text,
                        remark.text,
                        from.text,
                        to.text,
                        selectedValueDiserahkan,
                        diterima.text,
                        selectedValueDiketahui,
                        selectedValuePerusahaan);
                  }
                },
                child: Container(
                  width: 90,
                  height: 37.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xffEC1D26)),
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

  void inputDataProject(projectName, remark, from, to, diserahkan, diterima,
      diketahui, perusahaan) async {
    bool status;
    String id;

    try {
      // var formData = FormData.fromMap({
      //   'Unit': namaUnit,
      // });

      response = await dio.post(newMaterial, data: {
        "project_name": projectName,
        "remark": remark,
        "from": from,
        "to": to,
        "diserahkan": diserahkan,
        "diterima": diterima,
        "diketahui": diketahui,
        "perusahaan": perusahaan
      });

      status = response!.data['success'];
      id = response!.data['id'];

      if (status) {
        FocusScope.of(context).unfocus();
        _clearForm();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddnewMaterialScreens(
                      idNewMaterial: id,
                    )));
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'failed',
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

  void getDataPerusahaan() async {
    bool status;
    var msg;
    String id;
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
