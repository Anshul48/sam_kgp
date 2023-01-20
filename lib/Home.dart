import 'package:flutter/material.dart';

double pulse = 0;
double weight = 0;
double temperature = 0;

// Abnormal

double pulseA = 0;
double weightA = 0;
double temperatureA = 0;

List<List<double>> history = [
  [1, 2, 30],
  [1, 2, 5]
];

double avg(final int index) {
  double sum = 0;
  history.map((List<double> m) => sum = sum + m[index]).toList();

  return sum / history.length;
}

// Set avg below

bool cyst = false;

const String cno =
    'Based on the information provided, it appears that you do not have any signs or symptoms of an ovarian cyst.';

const String cyes =
    'Based on the information provided, it appears that you may have an ovarian cyst. It is important to consult a healthcare professional for a proper diagnosis and treatment.';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void setAvg() {
    pulse = double.parse(avg(0).toStringAsFixed(2));
    weight = double.parse(avg(1).toStringAsFixed(2));
    temperature = double.parse(avg(2).toStringAsFixed(2));
    // weight = avg(1);
    // temperature = avg(2);
  }

  // void setAndCheck(double t1, double t2, double t3) {
  //   pulseA = t1;
  //   weightA = t2;
  //   temperatureA = t3;

  //   if (pulse > pulseA)
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Welcome Back",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    height: 80,
                    width: 80,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/woman.jpg',
                        // "https://cdn.pixabay.com/photo/2020/09/21/13/38/woman-5590119_960_720.jpg",
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: TextButton(
                      onPressed: () async {
                        final List tuple =
                            await Navigator.pushNamed(context, '/mod') as List;

                        // final List<String> result = [
                        //   tuple[0],
                        //   tuple[1],
                        //   tuple[2]
                        // ];
                        // // print(tuple);
                        // [, , , true]
                        if (tuple[3] != null) {
                          cyst = tuple[3];
                          setState(() {});
                        }
                        try {
                          // final double t1 = double.parse(result[0]);
                          // final double t2 = double.parse(result[1]);
                          // final double t3 = double.parse(result[2]);

                          // history.add([t1, t2, t3]);
                          // setAndCheck(t1, t2, t3);

                          setAvg();
                          setState(() {});
                          // print(history);
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text(
                        "Rose",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    "27 Years, Female",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Pulse",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Color(0xff808080),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                              pulse.toString(),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 20,
                                color: Color(0xff3a57e8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Weight",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Color(0xff808080),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                              weight.toString(),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 20,
                                color: Color(0xff3a57e8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Temperature",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Color(0xff808080),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                              temperature.toString(),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 20,
                                color: Color(0xff3a57e8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: MaterialButton(
                    onPressed: () async {
                      final List result =
                          await Navigator.pushNamed(context, '/contact')
                              as List;

                      try {
                        final double t1 = double.parse(result[0]);
                        final double t2 = double.parse(result[1]);
                        final double t3 = double.parse(result[2]);

                        setAvg();
                        history.add([t1, t2, t3]);
                        setState(() {});
                        print(history);
                      } catch (e) {
                        print(e);
                      }
                    },
                    color: Color(0xff3a57e8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      side: BorderSide(color: Color(0xffffffff), width: 1),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Update",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    textColor: Color(0xffffffff),
                    height: 45,
                    minWidth: 160,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Status",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff3a57e8),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setAvg();
                          setState(() {});
                        },
                        child: Text(
                          "All",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      cyst ? cyes : cno,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "History",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff3a57e8),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "All",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 2 / 7),
                  child: ListView.builder(
                      itemCount: history.length,
                      itemBuilder: (context, i) {
                        final item = history[i];

                        return Card(
                          child: ListTile(
                            title: Text(
                              'Pulse: ' +
                                  item[0].toString() +
                                  ', Weight: ' +
                                  item[1].toString() +
                                  ', Temperature: ' +
                                  item[2].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                color: Color(0xff000000),
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  history.removeAt(i);
                                  setAvg();
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
