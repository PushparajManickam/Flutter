import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

void main() {
  runApp(MaterialApp(home: pdf()));
}

class pdf extends StatefulWidget {
  //pdf({Key? key}) : super(key: key);

  @override
  _pdfState createState() => _pdfState();
}

class _pdfState extends State<pdf> {
  var dir = '/storage/emulated/0/Download/';
  //String dir = "";

  Future openFile({required String url, String? fileName}) async {
    final name = fileName ?? url.split('/').last;
    final file = await _requestDownload(url, name);
    //final file = await pickFile();
    if (file == null) return null;
    print('Path : ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return null;
    return File(result.files.first.path!);
  }

  Future<File?> _requestDownload(String link, String Name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$Name');

    //
    try {
      final response = await Dio().get(link,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          ));
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      print('response is received');
      return file;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RaisedButton(
                child: Text('download'),
                onPressed: () => openFile(
                      url:
                          'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
                      //fileName: 'file.pdf'
                    ))));
  }
}


//   if(Platform.isAndroid) {
//     dir = (await getExternalStorageDirectory()).path;
//   } else if(Platform.isIOS) {
//     dir = (await getApplicationDocumentsDirectory()).path;
//   }
// //  print(dir);
//     final taskId = await FlutterDownloader.enqueue(
//       url: link,
//       savedDir: '$dir/$fileName',
//       showNotification:
//           true, // show download progress in status bar (for Android)
//       openFileFromNotification:
//           true, // click on notification to open downloaded file (for Android)
//     );
