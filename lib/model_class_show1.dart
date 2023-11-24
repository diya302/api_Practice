import 'package:flutter/material.dart';
import 'package:practice2/model/make_model_api.dart';

class ModelClassShow1 extends StatefulWidget {
  const ModelClassShow1({super.key});

  @override
  State<ModelClassShow1> createState() => _ModelClassShow1State();
}

class _ModelClassShow1State extends State<ModelClassShow1> {
  List<NamesModel> nameList = [
    NamesModel(
        name: 'One',
        age: 22,
        profession: 'Developer',
        image: '',
        details: Details(fathername: 'abc')),
    NamesModel(
        name: 'Two',
        age: 25,
        profession: 'Developer',
        image: '',
        details: Details(fathername: 'abc')),
    NamesModel(
      name: 'Three',
      age: 23,
      profession: 'Developer',
      image: '',
      details: Details(fathername: 'abc'),
    ),
    NamesModel(
        name: 'Four',
        age: 20,
        profession: 'Developer',
        image: '',
        details: Details(fathername: '')),
    NamesModel(
        name: 'Five',
        age: 19,
        profession: 'Developer',
        image: '',
        details: Details(fathername: 'abc')),
    NamesModel(
        name: 'Six',
        age: 21,
        profession: 'Developer',
        image: '',
        details: Details(fathername: 'abc'))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Model Class'),
      ),
      body: ListView.builder(
          itemCount: nameList.length,
          itemBuilder: (context, index) {
            if (nameList[index].details == null) {
              return ListTile(
                title: Text(nameList[index].name.toString()),
                subtitle: Text(nameList[index].age.toString()),
                trailing: IconButton(
                  onPressed: () {
                    print('pressed');
                    nameList.removeAt(index);
                    setState(() {});
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            } else {
              return ListTile(
                title: Text(nameList[index].name.toString()),
                subtitle: Text(nameList[index].details.fathername.toString()),
                trailing: IconButton(
                  onPressed: () {
                    print('pressed');
                    nameList.removeAt(index);
                    setState(() {});
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            }
          }),
    );
  }
}
//
// class Names {
//   String name;
//   int age;
//   DateTime dob;
//
//   Names({required this.name, required this.age, required this.dob});
// }
