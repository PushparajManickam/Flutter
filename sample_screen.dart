import 'package:flutter/Material.dart';
import 'package:mysamil/Screens/Registration_New/new_reg.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen();

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  //Screen List
  int currentIndex = 0;
  final screen = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];
  Widget customButton(int index) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          4.0,
        ),
        side: BorderSide(
          color: const Color(
            0xffD3D3D3,
          ),
        ),
      ),
      // color:  const Color(
      //   0xff00FF00,
      // ),
      elevation: 2.0,
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        onPressed: () {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
        child: Text(
          "Button ${index + 1}",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //if need space inside column widget use sizedbox
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customButton(
                    0,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  customButton(
                    1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  customButton(
                    2,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: deviceSize.height * 0.8,
              color: const Color(0xffF9F9F9),
              child: screen[currentIndex],
            ),
          ],
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Screen1",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Screen2",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Screen3",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
