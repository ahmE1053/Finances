import 'dart:math';
import 'Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Transactions.dart';
import 'Widgets/Charts.dart';
import 'transactions_list.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.purpleAccent,
            centerTitle: true,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
            accentColor: Colors.yellowAccent,
            primaryColorDark: Colors.purple,
          ),
        ),
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            elevation: 10,
            context: context,
            builder: (BuildContext context) {
              return Container(
                height:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? MediaQuery.of(context).size.height * 0.6 +
                            MediaQuery.of(context).viewInsets.bottom
                        : MediaQuery.of(context).size.height * 0.6,
                padding: EdgeInsets.all(20),
                child: MediaQuery.of(context).orientation ==
                        Orientation.portrait
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: TextFieldForAdding(
                              numornormal: TextInputType.text,
                              Changed: (String value) {
                                traname = value;
                              },
                              hint: 'Title',
                              inputformatter: [],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: TextFieldForAdding(
                              numornormal: TextInputType.number,
                              inputformatter: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^(\d+)?\.?\d{0,2}'),
                                ),
                              ],
                              hint: 'It\'s Price',
                              Changed: (String value) {
                                tranamount = value;
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2010, 10),
                                    lastDate: DateTime(2101),
                                  );
                                  setState(
                                    () {
                                      transactionslist.add(
                                        Transactions(
                                          title: traname,
                                          date: picked != null
                                              ? picked
                                              : DateTime.now(),
                                          id: Random().nextInt(100),
                                          price: double.parse(tranamount),
                                        ),
                                      );
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 30),
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'Select a time',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  color: Color(0xff51155A),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      transactionslist.add(
                                        Transactions(
                                          title: traname,
                                          date: DateTime.now(),
                                          id: Random().nextInt(100),
                                          price: double.parse(tranamount),
                                        ),
                                      );
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 30),
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'Add Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  color: Color(0xff51155A),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child:
                                LayoutBuilder(builder: (contxt, constraints) {
                              return Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 20),
                                      child: TextFieldForAdding(
                                        numornormal: TextInputType.text,
                                        Changed: (String value) {
                                          traname = value;
                                        },
                                        hint: 'Title',
                                        inputformatter: [],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () async {
                                        DateTime? picked = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2010, 10),
                                          lastDate: DateTime(2101),
                                        );
                                        setState(
                                          () {
                                            transactionslist.add(
                                              Transactions(
                                                title: traname,
                                                date: picked != null
                                                    ? picked
                                                    : DateTime.now(),
                                                id: Random().nextInt(100),
                                                price: double.parse(tranamount),
                                              ),
                                            );
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xff51155A),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        height: constraints.maxHeight * .5,
                                        child: Center(
                                          child: Text(
                                            'Select a time',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                          Expanded(
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: TextFieldForAdding(
                                          numornormal: TextInputType.number,
                                          inputformatter: [
                                            FilteringTextInputFormatter.allow(
                                              RegExp(r'^(\d+)?\.?\d{0,2}'),
                                            ),
                                          ],
                                          hint: 'It\'s Price',
                                          Changed: (String value) {
                                            tranamount = value;
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              transactionslist.add(
                                                Transactions(
                                                  title: traname,
                                                  date: DateTime.now(),
                                                  id: Random().nextInt(100),
                                                  price:
                                                      double.parse(tranamount),
                                                ),
                                              );
                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xff51155A),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          height: constraints.maxHeight * 0.5,
                                          child: Center(
                                            child: Text(
                                              'Add Now',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 40,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          if (MediaQuery.of(context).viewInsets.bottom > 0)
                            Expanded(
                              flex: 3,
                              child: SizedBox(),
                            ),
                        ],
                      ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Charts(recents: transactionslist),
                    ),
                    Expanded(
                      flex: 3,
                      child: transactionslist.length != 0
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: ListView.builder(
                                itemCount: transactionslist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Dismissible(
                                    onDismissed: (d) {
                                      setState(() {
                                        transactionslist.removeAt(index);
                                      });
                                    },
                                    key: ValueKey(transactionslist.length),
                                    child: Container(
                                      margin: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Color(0xff51155A),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 100,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 15),
                                            child: CircleAvatar(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Container(
                                                  padding: EdgeInsets.all(20),
                                                  child: Text(
                                                    '\$${transactionslist[index].price}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 100),
                                                  ),
                                                ),
                                              ),
                                              minRadius: 50,
                                              backgroundColor: Colors.red,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child: Column(
                                                children: [
                                                  FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      '${transactionslist[index].title}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 60,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(10),
                                                    child: FittedBox(
                                                      child: Text(
                                                        transactionslist[index]
                                                            .formatdate(),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage('assets/confused.jpg'),
                                    height: 400,
                                    colorBlendMode: BlendMode.colorBurn,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Nothing to show here.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 60,
                                      ),
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ),
                  ],
                )
              : Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return ListView(
                          children: [
                            Container(
                              height: 300,
                              child: Charts(recents: transactionslist),
                            ),
                            transactionslist.isNotEmpty
                                ? Container(
                                    height: 200,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: ListView.builder(
                                      itemCount: transactionslist.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Dismissible(
                                          onDismissed: (d) {
                                            setState(() {
                                              transactionslist.removeAt(index);
                                            });
                                          },
                                          key:
                                              ValueKey(transactionslist.length),
                                          child: Container(
                                            margin: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              color: Color(0xff51155A),
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 15),
                                                  child: CircleAvatar(
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(20),
                                                        child: Text(
                                                          '\$${transactionslist[index].price}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 100),
                                                        ),
                                                      ),
                                                    ),
                                                    minRadius: 50,
                                                    backgroundColor: Colors.red,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: Column(
                                                      children: [
                                                        FittedBox(
                                                          fit: BoxFit.scaleDown,
                                                          child: Text(
                                                            '${transactionslist[index].title}',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 60,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: FittedBox(
                                                            child: Text(
                                                              transactionslist[
                                                                      index]
                                                                  .formatdate(),
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100,
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Container(
                                    height: 500,
                                    margin: EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Image(
                                          image:
                                              AssetImage('assets/confused.jpg'),
                                          height: 400,
                                          colorBlendMode: BlendMode.colorBurn,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Nothing to show here.',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 60,
                                            ),
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          ],
                        );
                      },
                    ),
                  ),
                ]),
        ),
      ),
    );
  }
}
