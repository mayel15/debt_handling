// import 'package:filter_list/filter_list.dart';
import 'package:debt_handling/src/components/debt-card.widget.dart';
import 'package:debt_handling/src/models/debt.model.dart';
import 'package:debt_handling/src/services/debt-database.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      amount: 100,
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

    // void openFilterOriginStationDialog(List<String> originStationList) async {
    //   await FilterListDialog.display<String>(
    //     context,
    //     listData: originStationList,
    //     selectedListData:
    //         seletedOriginStationNamesList.whereType<String>().toList(),
    //     choiceChipLabel: (category) => category,
    //     validateSelectedItem: (list, val) => list!.contains(val),
    //     onItemSearch: (category, query) {
    //       return category.toLowerCase().contains(query.toLowerCase());
    //     },
    //     onApplyButtonClick: (list) {
    //       setState(() {
    //         list!.isEmpty
    //             ? seletedOriginStationNamesList = []
    //             : seletedOriginStationNamesList = list;
    //       });
    //       Navigator.pop(context);
    //     },
    //     resetButtonText: "Reinitialiser",
    //     applyButtonText: "Appliquer",
    //     allButtonText: "Tout",
    //     selectedItemsText: "gares sélectionnées",
    //   );
    // }

    // void openFilterCategoryDialog(List<String> categoryList) async {
    //   await FilterListDialog.display<String>(
    //     context,
    //     listData: categoryList,
    //     selectedListData:
    //         selectedObjectCategoriesList.whereType<String>().toList(),
    //     choiceChipLabel: (category) => category,
    //     validateSelectedItem: (list, val) => list!.contains(val),
    //     onItemSearch: (category, query) {
    //       return category.toLowerCase().contains(query.toLowerCase());
    //     },
    //     onApplyButtonClick: (list) {
    //       setState(() {
    //         list!.isEmpty
    //             ? selectedObjectCategoriesList = []
    //             : selectedObjectCategoriesList = list;
    //       });
    //       Navigator.pop(context);
    //     },
    //     resetButtonText: "Reinitialiser",
    //     applyButtonText: "Appliquer",
    //     allButtonText: "Tout",
    //     selectedItemsText: "catégories sélectionnées",
    //   );
    // }

    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dettes'),
          leading: IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed(context, '/infos');
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/add-modify');
              },
            ),
          ],
          centerTitle: true,
          backgroundColor: const Color.fromARGB(217, 217, 217, 217),

          bottom: const TabBar(
            tabs: [
              Tab(text: "À rembourser"),
              Tab(text: "À encaisser"),
            ],
          ),
          // title: const Text('Tabs Demo'),
        ),
        body: Consumer<DebtDatabaseService>(
            builder: (context, debtDatabaseService, child) =>
                FutureBuilder<List<DebtModel>>(
                  future: debtDatabaseService.getDebts(),
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
                      return TabBarView(
                        children: [
                          Column(
                            children: [
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
                          ),
                          Column(
                            children: [
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
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    // By default, show a loading spinner.
                    return const Center(child: CircularProgressIndicator());
                  },
                )),
      ),
    ));
  }
}
