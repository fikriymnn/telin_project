import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/form/input_length_cable.dart';



class TableCableLoading extends StatefulWidget {
  const TableCableLoading({super.key});

  @override
  State<TableCableLoading> createState() => _TableCableLoadingState();
}

class _TableCableLoadingState extends State<TableCableLoading> {
  late List<CableLoading> cableLoading;
  List<CableLoading> selectedRow = [];
  @override
  void initState() {
    // TODO: implement initState
    cableLoading = CableLoading.getCableLoading();
    super.initState();
  }

   List<DropdownMenuItem<String>> get dropdownItemsSystem {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "SYSTEM", child: Text("SYSTEM")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsArmoring {
    List<DropdownMenuItem<String>> menuItemsArmoring = [
      const DropdownMenuItem(value: "ARMORING TYPE", child: Text("ARMORING TYPE")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItemsArmoring;
  }
   String selectedValueSystem = "SYSTEM";
  String selectedValueArmoring = "ARMORING TYPE";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DataTable2(
          columnSpacing: 6,
          horizontalMargin: 6,
          dataRowHeight: 30,
         
          showBottomBorder: false,
          minWidth: 3000,
          columns: [
            DataColumn2(
              label: Text(
                'NO',
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 50
            ),
            DataColumn2(
              label: Text(
                'LABLE',
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 100
            ),
            DataColumn2(
              label: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                
                                style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValueSystem = newValue!;
                                    });
                                  },
                                  value: selectedValueSystem,
                                  items: dropdownItemsSystem),
                            ),
              fixedWidth: 100
            ),
            DataColumn2(
              label: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                
                                style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValueArmoring = newValue!;
                                    });
                                  },
                                  value: selectedValueArmoring,
                                  items: dropdownItemsArmoring),
                            ),
              fixedWidth: 120
            ),
            DataColumn2(
              label: Text(
                """LENGTH
(METER)
              """,
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 100
            ),
            DataColumn2(
              label: Text(
                "CORE TYPE",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 100
            ),
            DataColumn2(
              label: Text(
                "\u03A3 CORE",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 100
            ),
            DataColumn2(
              label: Text(
                "INNER",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 50
            ),
            DataColumn2(
              label: Text(
                "OUTER",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 50
            ),
            DataColumn2(
              label: Text(
                "TANK LEVEL",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 100
            ),
            DataColumn2(
              label: Text(
                "REMARK",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 150
            ),
            DataColumn2(
              label: Text(
                "ACTION",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              fixedWidth: 50
            ),
           
          ],
          rows: _createRowsArmoring()),
    );
  }

  List<DataRow> _createRowsArmoring() {
    return cableLoading
        .map((cableLoading) => DataRow(cells: [
              DataCell(Text(cableLoading.no,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cableLoading.lable,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cableLoading.system,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cableLoading.armoringType,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cableLoading.length,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              DataCell(Text(cableLoading.coreType,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(cableLoading.core,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(cableLoading.inner,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(cableLoading.outer,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(cableLoading.tankLevel,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
                  DataCell(Text(cableLoading.remark,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))),
              
              DataCell(
                TextButton(onPressed: (){
                  showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const InputLengthCable();
                                        });
                }, child: Text("Take",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: active,
                            )) )
               
              )
            ]))
        .toList();
  }
}

class CableLoading {
  final String no,
      system,
      
      armoringType,
      length,
      lable,
      inner,
      outer,
     tankLevel,
      remark,
      coreType,
      core;
      

  const CableLoading(
      {required this.no,
      required this.system,
    
      required this.armoringType,
      required this.length,
      required this.lable,
      required this.inner,
      required this.outer,
     required this.tankLevel,
      required this.remark,
      required this.coreType,
      required this.core,
     });

  static List<CableLoading> getCableLoading() {
    return <CableLoading>[
      const CableLoading(
          no: "1",
          system: "System",
          
          armoringType: "armoring Type",
          length: "1000",
          lable: "Lable",
          inner: "inner",
          outer: "-",
          
          remark: "remark",
          coreType: "core type",
          core: "core",
          
          tankLevel: "22"
          ),
      const CableLoading(
          no: "2",
          system: "System",
         
          armoringType: "armoring Type",
          length: "1000",
          lable: "Lable",
          inner: "inner",
          outer: "-",
          
          remark: "remark",
          coreType: "core type",
          core: "core",
          
          tankLevel: "22"
          ),
      const CableLoading(
          no: "3",
          system: "System",
         
          armoringType: "armoring Type",
          length: "1000",
          lable: "Lable",
          inner: "inner",
          outer: "-",
          
          remark: "remark",
          coreType: "core type",
          core: "core",
          
          tankLevel: "22"
          ),
      const CableLoading(
          no: "4",
          system: "System",
         
          armoringType: "armoring Type",
          length: "1000",
          lable: "Lable",
          inner: "inner",
          outer: "-",
          
          remark: "remark",
          coreType: "core type",
          core: "core",
          
          tankLevel: "22"
          ),
      const CableLoading(
          no: "5",
          system: "System",
         
          armoringType: "armoring Type",
          length: "1000",
          lable: "Lable",
          inner: "inner",
          outer: "-",
          
          remark: "remark",
          coreType: "core type",
          core: "core",
          
          tankLevel: "22"
          ),
      const CableLoading(
          no: "6",
          system: "System",
         
          armoringType: "armoring Type",
          length: "1000",
          lable: "Lable",
          inner: "inner",
          outer: "-",
          
          remark: "remark",
          coreType: "core type",
          core: "core",
          
          tankLevel: "22"
          ),
    ];
  }
}
