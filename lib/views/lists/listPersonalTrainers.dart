import 'package:flutter/material.dart';
import 'package:movpass_test/controller/trainerController.dart';
import 'package:movpass_test/model/trainer.dart';
import 'package:movpass_test/views/details/detailsPersonalTrainer.dart';

class ListTrainers extends StatefulWidget {
  @override
  _ListTrainersState createState() => _ListTrainersState();
}

class _ListTrainersState extends State<ListTrainers> {
  TrainerAPI api = TrainerAPI();

  _listTrainer() {
    return api.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Treinadores"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<Trainer>>(
          future: _listTrainer(),
          // ignore: missing_return
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Color(0xffE9A945)),
                  ),
                );
                break;
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  print("Erro ao carregar lista" + snapshot.error.toString());
                  return Center(
                    child: Text("Error"),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      List<Trainer> lista = snapshot.data;
                      Trainer trainer = lista[index];

                      return Card(
                        margin: EdgeInsets.all(5.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.account_circle_rounded,
                            color: Color(0xff242A2C),
                            size: 50,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff242A2C),
                          ),
                          title: Text(trainer.name),
                          subtitle: Text(
                            "CREF: ${trainer.cref}",
                            style: TextStyle(
                              color: Color(0xffE9A945),
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DetailTrainer(
                                          id: trainer.id,
                                        )));
                          },
                        ),
                      );
                    },
                  );
                }
                break;
            }
          },
        ),
      ),
    );
  }
}
