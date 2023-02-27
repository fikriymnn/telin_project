import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class EditAkun extends StatefulWidget {
  const EditAkun({super.key});

  @override
  State<EditAkun> createState() => _EditAkunState();
}

class _EditAkunState extends State<EditAkun> {
 String? role= "Super Admin";
  var _obscureText = false;
  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  @override
  Widget build(BuildContext context) {
   
   
    return AlertDialog(
      content: Container(
        width: 942,
        height: 592.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.white),
        child: Column(
          children: [
            Text("User",
                style: GoogleFonts.montserrat(
                  fontSize: 33.3,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 298.6,
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
                          
                          style: GoogleFonts.montserrat(
                            fontSize: 10.6,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: 13.3,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              hintText: "Gudang"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 298.6,
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
                          
                          style: GoogleFonts.montserrat(
                            fontSize: 10.6,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: 13.3,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              hintText: "Gudang1"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 298.6,
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
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                
                                obscureText: _obscureText,
                                style: GoogleFonts.montserrat(
                                  fontSize: 10.6,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                decoration: InputDecoration(
                                 
                                    border: InputBorder.none,
                                    hintStyle: GoogleFonts.montserrat(
                                      fontSize: 13.3,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                    hintText: "gudangtelkom1"),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                   SizedBox(
              height: 10,
            ),
                Container(
                  child: Column(
                    children: [
                      Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Select Role",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                     Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 190,
                                height: 46.6,
                                decoration: BoxDecoration(
                                  border: Border.all(color:_isSelected1? Color(0xffEC1D26):Color(0xffF0F0F0),width: 4),
                                  borderRadius: BorderRadius.circular(6),
                                 
                                ),
                                child: RadioListTile(
                                  title: Text("Super Admin",style: GoogleFonts.montserrat(
                                fontSize: 13.3,
                                fontWeight: FontWeight.w400,
                                color: _isSelected1? Color(0xffEC1D26): Colors.black.withOpacity(0.6),
                                                            ),),
    
                                  value: "Super Admin",
                                  activeColor: Color(0xffEC1D26),
                                  groupValue: role,
                                  onChanged: (value) {
                                    setState(() {
                                      role = value.toString();
                                      _isSelected1 = true;
                                      _isSelected2 = false;
                                      _isSelected3 = false;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 15.3,),
                              Container(
                                width: 154.6,
                                height: 46.6,
                                decoration: BoxDecoration(
                                   border: Border.all(color:_isSelected2? Color(0xffEC1D26):Color(0xffF0F0F0),width: 4),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: RadioListTile(
                                    title: Text("Admin",style: GoogleFonts.montserrat(
                                  fontSize: 13.3,
                                  fontWeight: FontWeight.w400,
                                  color:  _isSelected2? Color(0xffEC1D26): Colors.black.withOpacity(0.6),
                                ),),
                                    value: "Admin",
                                    activeColor: Color(0xffEC1D26),
                                    groupValue: role,
                                    onChanged: (value) {
                                      setState(() {
                                        role = value.toString();
                                        _isSelected1 = false;
                                          _isSelected2 = true;
                                          _isSelected3 = false;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: 15.3,),
                              Container(
                                width: 154.6,
                                height: 46.6,
                                decoration: BoxDecoration(
                                  border: Border.all(color:_isSelected3? Color(0xffEC1D26):Color(0xffF0F0F0),width: 4),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: RadioListTile(
                                    title: Text("User",style: GoogleFonts.montserrat(
                                  fontSize: 13.3,
                                  fontWeight: FontWeight.w400,
                                  color:  _isSelected3? Color(0xffEC1D26): Colors.black.withOpacity(0.6),
                                ),),
                                    value: "User",
                                    activeColor: Color(0xffEC1D26),
                                    groupValue: role,
                                    onChanged: (value) {
                                      setState(() {
                                        role = value.toString();
                                        _isSelected1 = false;
                                          _isSelected2 = false;
                                          _isSelected3 = true;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 101.3,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 90,
                          height: 37.3,
                          
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: Color(0xffEC1D26)),
                          child: Center(
                            child: Text("Done",style: GoogleFonts.roboto(
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
          ],
        ),
      ),
    );
    ;
  }
}
