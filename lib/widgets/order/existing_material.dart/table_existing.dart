import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/home/detail_table_home.dart';
import 'package:telin_project/widgets/master_data/edit_data/edit_perusahaan.dart';
import 'package:telin_project/widgets/order/existing_material.dart/bast_existing.dart';
import 'package:telin_project/widgets/order/existing_material.dart/lakukan_off_loading.dart';

import 'package:telin_project/widgets/order/loading/form/edit_form_loading.dart';
import 'package:telin_project/widgets/setting/detail_akun.dart';

class TableExistingMaterial extends StatefulWidget {
  const TableExistingMaterial({super.key});

  @override
  State<TableExistingMaterial> createState() => _TableExistingMaterialState();
}

class _TableExistingMaterialState extends State<TableExistingMaterial> {
  late List<ExistingMaterial> existingMaterial;
  List<ExistingMaterial> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    existingMaterial = ExistingMaterial.getExistingMaterial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 6,
        horizontalMargin: 6,
        dataRowHeight: 30,
        minWidth: 3000,
        border: const TableBorder(
            top: BorderSide(),
            bottom: BorderSide(),
            left: BorderSide(),
            right: BorderSide()),
        columns: [
          DataColumn2(
              label: Text(
                'No',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 28),
          DataColumn2(
              label: Text('Depo Loaction',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
              fixedWidth: 150),
          DataColumn2(
              label: Text('Project Name',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
              fixedWidth: 270),
          DataColumn2(
              label: Text('Loading',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
              fixedWidth: 150),
          DataColumn2(
              label: Text('Off-Loading',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
              fixedWidth: 200),
          const DataColumn2(label: Text(''), fixedWidth: 70),
          const DataColumn2(label: Text(''), fixedWidth: 200),
        ],
        rows: _createRowsManufacture());
  }

  List<DataRow> _createRowsManufacture() {
    return existingMaterial
        .map((existingMaterial) => DataRow(cells: [
              DataCell(Text(existingMaterial.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(existingMaterial.depoLocation,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(existingMaterial.projectName,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(existingMaterial.loading,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(existingMaterial.offLoading,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BastOffLoading()));
                  },
                  child: Text('Detail...',
                      style: GoogleFonts.montserrat(
                        fontSize: 13.3,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.5),
                      )),
                ),
              ),
              DataCell(
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LakukanOffLoading()));
                  },
                  child: Container(
                    width: 150,
                    height: 19.46,
                    decoration: BoxDecoration(
                        color: dark, borderRadius: BorderRadius.circular(6)),
                    child: Center(
                        child: Text("Lakukan Off-Loading",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ))),
                  ),
                ),
              )
            ]))
        .toList();
  }
}

class ExistingMaterial {
  final String no, projectName, depoLocation, loading, offLoading;

  const ExistingMaterial({
    required this.no,
    required this.projectName,
    required this.depoLocation,
    required this.offLoading,
    required this.loading,
  });

  static List<ExistingMaterial> getExistingMaterial() {
    return <ExistingMaterial>[
      const ExistingMaterial(
        no: "1",
        projectName: "REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
        depoLocation: "Makasar",
        offLoading: "-",
        loading: "01/01/23",
      ),
      const ExistingMaterial(
        no: "2",
        projectName: "REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
        depoLocation: "Makasar",
        offLoading: "-",
        loading: "01/01/23",
      ),
      const ExistingMaterial(
        no: "3",
        projectName: "REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
        depoLocation: "Makasar",
        offLoading: "-",
        loading: "01/01/23",
      ),
      const ExistingMaterial(
        no: "4",
        projectName: "REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
        depoLocation: "Makasar",
        offLoading: "-",
        loading: "01/01/23",
      ),
      const ExistingMaterial(
        no: "5",
        projectName: "REPAIR SKKL LTCS LINK ATAMBUA-LARANTUKA",
        depoLocation: "Makasar",
        offLoading: "-",
        loading: "01/01/23",
      )
    ];
  }
}
