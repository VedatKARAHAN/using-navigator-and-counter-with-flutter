import 'package:flutter/material.dart';
import 'durum_ekrani.dart';

Color appBarBaseColor = const Color(0xFF5DADE2);
Color appBarTitleColor = const Color(0xFFFFFFFF);
Color mainBackGroundColor = const Color(0xFFF8F8F8);
Color importantTextColor = const Color(0xFF69F0AE);

void main(){
  runApp(const SigaraBirakmaApp());
}

class SigaraBirakmaApp extends StatelessWidget{
  const SigaraBirakmaApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget{
  const AnaSayfa({super.key});

  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: mainBackGroundColor,
      appBar: buildAppBar(),
      body: Center(
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sigarayı bırakmak için'),
            Text('Bugün harika bir gün',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurpleAccent
            ),
            ),
            const Text('Başarabilirsin!'),
            const SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: importantTextColor,
                foregroundColor: appBarTitleColor,
              ),
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => DurumEkrani(kararZamani:  DateTime.now())),
                );
              },
              child: const Text('Kararımı Verdim!'),
            )
          ],
        ),
      ),
    );
  }
}

//Functions!!!

AppBar buildAppBar(){
  return AppBar(
    title: Center(
      child: Text(
        'Yeni Bir Nefes',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: appBarTitleColor,
        ),
      )
    ),
    backgroundColor: appBarBaseColor,
  );
}