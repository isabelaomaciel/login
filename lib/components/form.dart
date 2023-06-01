import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 39,
              bottom: 11,
            ),
            child: Text(
              'E-mail',
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
            ),
          ),
          TextFormField(
            validator: (String? value) {
              if (valueValidator(value)) {
                return "Insira um e-mail";
              }
              return null;
            },
            controller: emailController,
            textAlign: TextAlign.start,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'E-mail',
              fillColor: Colors.white60,
              filled: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 11,
              bottom: 11,
            ),
            child: Text(
              'Senha',
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
            ),
          ),
          TextFormField(
            validator: (String? value) {
              if (valueValidator(value)) {
                return "Insira uma senha";
              }
              return null;
            },
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Senha',
              fillColor: Colors.white60,
              filled: true,
            ),
          ),
          
          Padding(padding: const EdgeInsets.only(top: 28),
          child: Row(
            children: [
              Checkbox(value: true,
              onChanged: (checked){},),
              Text('Lembre de mim')
            ],
          )
          ),

          Padding(
            padding: const EdgeInsets.only(top: 26, bottom: 15),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: Text(
                'Entrar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(347, 50)),
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
