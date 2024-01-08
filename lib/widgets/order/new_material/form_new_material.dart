import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/custom_dropdown.dart';
import 'package:telin_project/widgets/order/new_material/add_new_material.dart';
import 'package:telin_project/widgets/custom_text_field.dart';
import 'package:telin_project/widgets/order/new_material/detail_new_material.dart';

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
  List superAdmin = [];

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
    return Scaffold(
      backgroundColor: bgGray,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("OFF LOADING > NEW MATERIAL",
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              color: Colors.black)),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 148,
                            height: 33,
                            decoration: BoxDecoration(
                              border: Border.all(color: active, width: 1),
                              color: light,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "< Back",
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: active,
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                width: 665,
                height: 576,
                decoration: BoxDecoration(
                    color: light, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Title",
                              style: GoogleFonts.rubik(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            CustomTextField(
                                controller: projectName, label: "Enter Title")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Remark",
                              style: GoogleFonts.rubik(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            CustomTextField(
                                controller: remark, label: "Enter remark")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 86,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 20,
                                  crossAxisCount: 2),
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CustomTextField(
                                      controller: from,
                                      label: "Enter Starting Point")
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CustomTextField(
                                      controller: to,
                                      label: "Enter destination")
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Submitted",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CustomDropdown(
                                    label: "Submitted",
                                    item: user.map((user) {
                                      return DropdownMenuItem(
                                        value: user['_id'].toString(),
                                        child: Text(user['name']),
                                      );
                                    }).toList(),
                                    onChange: (newVal) {
                                      setState(() {
                                        selectedValueDiserahkan = newVal!;
                                      });
                                    },
                                    value: selectedValueDiserahkan,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Received",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CustomTextField(
                                      controller: diterima,
                                      label: "Enter Receiver")
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Is Known",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CustomDropdown(
                                    label: "Is Known",
                                    item: superAdmin.map((user) {
                                      return DropdownMenuItem(
                                        value: user['_id'].toString(),
                                        child: Text(user['name']),
                                      );
                                    }).toList(),
                                    onChange: (newVal) {
                                      setState(() {
                                        selectedValueDiketahui = newVal!;
                                      });
                                    },
                                    value: selectedValueDiketahui,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Company",
                                    style: GoogleFonts.rubik(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CustomDropdown(
                                    label: "Company",
                                    item: perusahaan.map((perusahaan) {
                                      return DropdownMenuItem(
                                        value: perusahaan['_id'].toString(),
                                        child: Text(perusahaan['company_name']),
                                      );
                                    }).toList(),
                                    onChange: (newVal) {
                                      setState(() {
                                        selectedValuePerusahaan = newVal!;
                                      });
                                    },
                                    value: selectedValuePerusahaan,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                                width: 123,
                                height: 33,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: const Color(0xffEC1D26)),
                                child: Center(
                                  child: Text("NEXT >",
                                      style: GoogleFonts.rubik(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: light,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
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
                builder: (context) => DetailNewMaterial(
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
        superAdmin =
            user.where((e) => e["role"].contains("super-admin")).toList();
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
