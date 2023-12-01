import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // backgroundColor: const Color(0xffffffff),
      backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 48,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Expanded(
                    flex: 6,
                    child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                    )),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Ja tem cadastro?",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Faça seu login e make the change_",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 32,
                alignment: Alignment.center,
                child: const TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: -4),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.purple,
                      ),
                      hintText: "E-mail",
                      hintStyle: TextStyle(color: Colors.white)),
                )),
            const SizedBox(
              height: 16,
            ),
            Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 32,
                alignment: Alignment.center,
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: -4),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.purple,
                    ),
                    hintText: "Senha",
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: Colors.white,
                    ),
                  ),
                )),
            const SizedBox(
              height: 32,
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.center,
              child: SizedBox(
                width: double.maxFinite,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.purple),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: const Text(
                    "ENTRAR",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 32,
              alignment: Alignment.center,
              child: const Text(
                "Esqueci minha senha",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 32,
              alignment: Alignment.center,
              child: const Text(
                "Criar conta",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    ));
  }
}
