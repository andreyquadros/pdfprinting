import 'package:flutter/material.dart';
import 'package:pdf_printing/generate_printing.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController cpfTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Formulário para Impressão'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameTextEditingController,
              decoration: InputDecoration(
                labelText: 'Nome Completo',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 16,),
            TextFormField(
              controller: cpfTextEditingController,
              decoration: InputDecoration(
                  labelText: 'CPF',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 32,),
            ElevatedButton(onPressed: (){
              GeneratePrinting().PrintingPdf(nameTextEditingController.text, cpfTextEditingController.text);
            } , child: Text('Gerar PDF'))
          ],
        ),
      ),
    );
  }
}
