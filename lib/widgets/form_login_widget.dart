import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_captcha/local_captcha.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telin_project/api/configAPI.dart';
import 'package:telin_project/pages/depo.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController userInput = TextEditingController();
  TextEditingController passInput = TextEditingController();
  TextEditingController captchaInput = TextEditingController();
  final _captchaFormKey = GlobalKey<FormState>();
  final _configFormKey = GlobalKey<FormState>();
  final _localCaptchaController = LocalCaptchaController();
  final _configFormData = ConfigFormData();

  var _inputCode = '';
  String text = "";
  late String _password;
  bool _obscureText = true;
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _localCaptchaController.dispose();
    super.dispose();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<Response?> loginUser() async {
    var dio = Dio();
    String role;
    try {
      var response = await dio.post(userLogin,
          data: {"username": userInput.text, "password": passInput.text},
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));

      role = response!.data['role'];

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Depo(
                    role: role,
                  )));
      return response;
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Username atau Password salah',
          title: 'Peringatan',
          width: 400,
          confirmBtnColor: Colors.red);
    }
    return null;
    // if (userInput.text.isNotEmpty && passInput.text.isNotEmpty) {
    //   var reqBody = {"username": userInput.text, "password": passInput.text};

    //   var response = await http.post(Uri.parse(userLogin),
    //       headers: {
    //         'Content-Type': 'application/json',
    //         'Accept': 'application/json',
    //       },
    //       body: jsonEncode(reqBody));

    //   var jsonResponse = jsonDecode(response.body);
    //   if (jsonResponse['status']) {
    //     var myToken = jsonResponse['token'];
    //     prefs.setString('token', myToken);
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => Depo(
    //                   token: myToken,
    //                 )));
    //   } else {
    //     QuickAlert.show(
    //         context: context,
    //         type: QuickAlertType.error,
    //         text: 'Username atau Password salah',
    //         title: 'Peringatan',
    //         width: 400,
    //         confirmBtnColor: Colors.red);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 122),
      child: Form(
        key: _captchaFormKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(right: 420),
              child: Text('Login',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 386,
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              child: TextFormField(
                controller: userInput,
                style: GoogleFonts.roboto(),
                decoration: InputDecoration(
                  prefixIcon: Container(
                    margin: const EdgeInsets.only(left: 16, right: 15),
                    height: 24,
                    width: 29,
                    child:
                        Image.asset('assets/images/clarity_id-badge-line.png'),
                  ),
                  fillColor: const Color(0xffF1F0F5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  labelText: 'Username',
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 386,
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              child: TextFormField(
                obscureText: _obscureText,
                controller: passInput,
                style: GoogleFonts.roboto(),
                decoration: InputDecoration(
                  prefixIcon: Container(
                    margin: const EdgeInsets.only(left: 16, right: 15),
                    height: 24,
                    width: 29,
                    child:
                        Image.asset('assets/images/mdi_password-outline.png'),
                  ),
                  suffixIcon: IconButton(
                    padding: const EdgeInsets.only(right: 13),
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  fillColor: const Color(0xffF1F0F5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(right: 420),
              child: Text('Captcha',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  )),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              margin: const EdgeInsets.only(right: 100),
              height: 150,
              width: 386,
              child: LocalCaptcha(
                key: ValueKey(_configFormData.toString()),
                controller: _localCaptchaController,
                height: 150,
                width: 386,
                backgroundColor: Colors.grey[100]!,
                chars: _configFormData.chars,
                length: _configFormData.length,
                fontSize: _configFormData.fontSize > 0
                    ? _configFormData.fontSize
                    : null,
                caseSensitive: _configFormData.caseSensitive,
                codeExpireAfter: _configFormData.codeExpireAfter,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 386,
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              child: TextFormField(
                style: GoogleFonts.roboto(),
                decoration: InputDecoration(
                    fillColor: const Color(0xffF1F0F5),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.black.withOpacity(0.5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.black.withOpacity(0.5)),
                    ),
                    hintText: "Enter Captcha"),
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    if (value.length != _configFormData.length) {
                      return '* Code must be length of ${_configFormData.length}.';
                    }

                    final validation = _localCaptchaController.validate(value);

                    switch (validation) {
                      case LocalCaptchaValidation.invalidCode:
                        return '* Invalid code.';
                      case LocalCaptchaValidation.codeExpired:
                        return '* Code expired.';
                      case LocalCaptchaValidation.valid:
                      default:
                        return null;
                    }
                  }

                  return '* Required field.';
                },
                onSaved: (value) => _inputCode = value ?? '',
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: 386,
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              child: ElevatedButton(
                onPressed: () {
                  _localCaptchaController.refresh();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 12,
                  backgroundColor: const Color(0xffEC1D26),
                  fixedSize: const Size(215, 50),
                ),
                child: Text('Refresh Captcha',
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: 386,
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              child: ElevatedButton(
                onPressed: () {
                  if (userInput.text == '') {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.info,
                        title: 'Peringatan',
                        text: 'Username Tidak Boleh Kosong',
                        width: 400,
                        confirmBtnColor: Colors.red);
                  } else if (passInput.text == '') {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.info,
                        title: 'Peringatan',
                        text: 'Password Tidak Boleh Kosong',
                        width: 400,
                        confirmBtnColor: Colors.red);
                  } else {
                    if (_captchaFormKey.currentState?.validate() ?? false) {
                      _captchaFormKey.currentState!.save();

                      loginUser();
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 12,
                  backgroundColor: const Color(0xffEC1D26),
                  fixedSize: const Size(215, 50),
                ),
                child: Text('Login',
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _configForm(BuildContext context) {
    return Form(
      key: _configFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Basic Configs',
              style: Theme.of(context).textTheme.titleLarge!,
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            initialValue: _configFormData.chars,
            decoration: const InputDecoration(
              labelText: 'Captcha chars',
              hintText: 'Captcha chars',
              isDense: true,
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value != null && value.trim().isNotEmpty) {
                return null;
              }

              return '* Required field.';
            },
            onSaved: (value) => _configFormData.chars = value?.trim() ?? '',
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            initialValue: '${_configFormData.length}',
            decoration: const InputDecoration(
              labelText: 'Captcha code length',
              hintText: 'Captcha code length',
              isDense: true,
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                final length = int.tryParse(value) ?? 0;

                if (length < 1) {
                  return '* Value must be greater than 0.';
                }

                return null;
              }

              return '* Required field.';
            },
            onSaved: (value) =>
                _configFormData.length = int.tryParse(value ?? '1') ?? 1,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            initialValue:
                '${_configFormData.fontSize > 0 ? _configFormData.fontSize : ''}',
            decoration: const InputDecoration(
              labelText: 'Font size (optional)',
              hintText: 'Font size (optional)',
              isDense: true,
              border: OutlineInputBorder(),
            ),
            onSaved: (value) => _configFormData.fontSize =
                double.tryParse(value ?? '0.0') ?? 0.0,
          ),
          const SizedBox(height: 16.0),
          DropdownButtonFormField<bool>(
            value: _configFormData.caseSensitive,
            isDense: true,
            decoration: const InputDecoration(
              labelText: 'Case sensitive',
              hintText: 'Case sensitive',
              isDense: true,
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(
                value: false,
                child: Text('No'),
              ),
              DropdownMenuItem(
                value: true,
                child: Text('Yes'),
              ),
            ],
            onChanged: (value) =>
                _configFormData.caseSensitive = value ?? false,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            initialValue: '${_configFormData.codeExpireAfter.inMinutes}',
            decoration: const InputDecoration(
              labelText: 'Code expire after (minutes)',
              hintText: 'Code expire after (minutes)',
              isDense: true,
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                final length = int.tryParse(value) ?? 0;

                if (length < 1) {
                  return '* Value must be greater than 0.';
                }

                return null;
              }

              return '* Required field.';
            },
            onSaved: (value) => _configFormData.codeExpireAfter =
                Duration(minutes: int.tryParse(value ?? '1') ?? 1),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 40.0,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_configFormKey.currentState?.validate() ?? false) {
                  _configFormKey.currentState!.save();

                  setState(() {});
                }
              },
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfigFormData {
  String chars = 'abdefghnryABDEFGHNQRY3468';
  int length = 5;
  double fontSize = 0;
  bool caseSensitive = false;
  Duration codeExpireAfter = const Duration(minutes: 10);

  @override
  String toString() {
    return '$chars$length$caseSensitive${codeExpireAfter.inMinutes}';
  }
}
