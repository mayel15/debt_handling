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
  // final List<DebtModel> debtsTest = [
  //   DebtModel(
  //     id: "1",
  //     amount: 100,
  //     currency: "€",
  //     personFullName: "John Doe",
  //     createdAt: DateTime.now(),
  //     updatedAt: DateTime.now(),
  //     deadlineDate: DateTime.now(),
  //     debtType: DebtType.TO_PAY,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    void handleOnPressedDebtButton(
        DebtDatabaseService db, DebtModel item) async {
      try {
        await db.deleteDebt(item.id);
        setState(() {});
      } catch (e) {
        print("Error deleting debt: $e");
      }
    }

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
                Navigator.pushNamed(context, '/add-debt');
              },
            ),
          ],
          centerTitle: true,
          backgroundColor: const Color.fromARGB(217, 217, 217, 217),

          bottom: const TabBar(
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.grey,
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
                      List<Widget> debtsToPay = [];
                      List<Widget> debtsToReceive = [];
                      for (DebtModel item in snapshot.data!) {
                        if (item.debtType == DebtType.TO_PAY) {
                          debtsToPay.add(DebtCard(
                            item: item,
                            onPressed: () => {
                              handleOnPressedDebtButton(
                                debtDatabaseService,
                                item,
                              ),
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Dette remboursée'),
                                ),
                              )
                            },
                          ));
                        } else if (item.debtType == DebtType.TO_RECEIVE) {
                          debtsToReceive.add(DebtCard(
                            item: item,
                            onPressed: () => {
                              handleOnPressedDebtButton(
                                debtDatabaseService,
                                item,
                              ),
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Dette encaissée'),
                                ),
                              )
                            },
                          ));
                        }
                      }

                      Widget debtsToPayListView = ListView(
                        children: debtsToPay,
                      );
                      Widget debtsToReceiveListView = ListView(
                        children: debtsToReceive,
                      );
                      return TabBarView(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                  child: debtsToPay.isEmpty
                                      ? const Center(
                                          child: Text(
                                              "Aucune dette à rembourser",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 24)),
                                        )
                                      : debtsToPayListView),
                            ],
                          ),
                          Column(
                            children: [
                              Expanded(
                                  child: debtsToReceive.isEmpty
                                      ? const Center(
                                          child: Text(
                                              "Aucune dette à encaisser",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 24)),
                                        )
                                      : debtsToReceiveListView),
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
