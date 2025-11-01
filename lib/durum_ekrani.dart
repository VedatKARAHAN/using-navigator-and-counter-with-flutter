import 'dart:async'; //Zamanlayıcı Kütüphanesi!
import 'package:flutter/material.dart';

class DurumEkrani extends StatefulWidget {
  final DateTime kararZamani;
  const DurumEkrani({super.key, required this.kararZamani});

  @override
  State<DurumEkrani> createState() => _DurumEkraniState();
}

class _DurumEkraniState extends State<DurumEkrani> {
  late Timer _timer; //Zamanlayıcıyı tutacak değişken
  Duration _gecenSure =
      Duration.zero; //Başlangıç ve şu an arasındaki farkı tutacak.

  //bu method sayfa ılk kez geldıgınde sadece 1 kere calısacak
  @override
  void initState() {
    super.initState();
    //Zamanlayıcı burada başlıyor
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //Her sayine geçen süreiyi tekrar hesapla ve ekranı guncelle
      final anlikZaman = DateTime.now();
      setState(() {
        _gecenSure = anlikZaman.difference(widget.kararZamani);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // sayfadan ayrılırken zamanlayıcıyı durdur !
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int gecenGun = _gecenSure.inDays;
    int gecenSaat = _gecenSure.inHours % 24;
    int geceDakika = _gecenSure.inMinutes % 60;
    int gecenSaniye = _gecenSure.inSeconds % 60;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Başarı Tablom'),
        backgroundColor: Colors.lightGreen.shade700,
        //Geri tüşuna basıldıgında bır onceki sayfaya donmesi için bu gerekli.
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'GEÇEN SÜRE',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Text(
              '${gecenGun} Gün ${gecenSaat} Saat',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text('${geceDakika} Dakika ${gecenSaniye} Saniye'),
            const SizedBox(height: 40),
            const Text(
              'TASARRUFUN',
              style: TextStyle(fontSize: 20, color: Colors.lightGreen),
            ),
            Text(
              '${(geceDakika + (gecenGun * 24 * 60) + (gecenSaat * 60)).toStringAsFixed(2)}TL',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
