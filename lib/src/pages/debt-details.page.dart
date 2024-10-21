// import 'package:filter_list/filter_list.dart';
import 'package:debt_handling/src/components/debt-card.widget.dart';
import 'package:debt_handling/src/models/debt.model.dart';
import 'package:debt_handling/src/services/debt-database.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DebtDetailsPage extends StatefulWidget {
  const DebtDetailsPage({super.key});

  @override
  _DebtDetailsPageState createState() => _DebtDetailsPageState();
}

class _DebtDetailsPageState extends State<DebtDetailsPage> {
  List<String?> seletedOriginStationNamesList = [];
  List<String?> selectedObjectCategoriesList = [];
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  DateTimeRange selectedDateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  final currentMonth = DateTime.now().month;

  @override
  // void initState() {
  //   super.initState();
  //   updateLastConsultationDate(DateTime.now());
  //   //fileService.writeLastConsulationDate("2024-10-01");
  // }

  // void updateLastConsultationDate(DateTime date) {
  //   FileService fileService = FileService();
  //   fileService.writeLastConsulationDate(date.toString());
  // }

  // void handleDateRangeSelected(BuildContext context) async {
  //   final DateTimeRange? dateTimeRangePicked = await showDateRangePicker(
  //       context: context,
  //       firstDate: DateTime.parse("2024-$currentMonth-01"),
  //       lastDate: DateTime.now()); // range is only from 2000 to
  //   if (dateTimeRangePicked != null) {
  //     setState(() {
  //       selectedStartDate = dateTimeRangePicked.start;
  //       selectedEndDate = dateTimeRangePicked.end;
  //     });
  //   }
  // }

  //Listes des objets perdus
  final List<DebtModel> debtsTest = [
    DebtModel(
      id: "1",
      amount: 1000,
      currency: "€",
      personFullName: "John Doe",
      isPaid: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      deadlineDate: DateTime.now(),
      debtType: DebtType.TO_PAY,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dettes'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(217, 217, 217, 217),
      ),
      body: Consumer<DebtDatabaseService>(
          builder: (context, debtDatabaseService, child) =>
              FutureBuilder<DebtModel>(
                future: debtDatabaseService.getDebtById("1"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Widget> debts = [];
                    // for (DebtModel item in snapshot.data!) {
                    //   debts.add(DebtCard(
                    //     item: item,
                    //   ));
                    // }
                    for (DebtModel item in debtsTest) {
                      debts.add(DebtCard(
                        item: item,
                      ));
                    }
                    Widget debtsListView = ListView(
                      children: debts,
                    );
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MaterialButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0, vertical: 8.0),
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: const Icon(Icons.train,
                                      color: Colors.white, size: 24.0),
                                  onPressed: () async => {
                                    // openFilterOriginStationDialog(
                                    //     await apiService
                                    //         .getOriginStationList()
                                    //         .then((data) => data
                                    //             .whereType<String>()
                                    //             .toList()))
                                  },
                                ),
                                MaterialButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0, vertical: 8.0),
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: const Icon(Icons.category,
                                      color: Colors.white, size: 24.0),
                                  onPressed: () async => {
                                    // openFilterCategoryDialog(await apiService
                                    //     .getObjectCategoriesList()
                                    //     .then((data) =>
                                    //         data.whereType<String>().toList()))
                                  },
                                ),
                                MaterialButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0, vertical: 8.0),
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: const Icon(Icons.date_range,
                                      color: Colors.white, size: 24.0),
                                  onPressed: () async => {
                                    // handleDateRangeSelected(
                                    //   context,
                                    // )
                                  },
                                ),
                                MaterialButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0, vertical: 8.0),
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: const Icon(Icons.refresh,
                                      color: Colors.white, size: 24.0),
                                  onPressed: () async => {
                                    setState(() {
                                      selectedObjectCategoriesList = [];
                                      seletedOriginStationNamesList = [];
                                      selectedStartDate = null;
                                      selectedEndDate = null;
                                      // updateLastConsultationDate(DateTime.parse(
                                      //     "2024-$currentMonth-01"));
                                    })
                                  },
                                ),
                              ]),
                        ),
                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 0, vertical: 16),
                        //   child: const Text(
                        //     "Liste des objets",
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.bold, fontSize: 24),
                        //   ),
                        // ),
                        Expanded(
                            child: debts.isEmpty
                                ? const Center(
                                    child: Text("Aucun objet trouvé",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 24)),
                                  )
                                : debtsListView),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const Center(child: CircularProgressIndicator());
                },
              )),
    );
  }
}
