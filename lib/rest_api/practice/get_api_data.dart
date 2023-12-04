// class GetDataApiScreen extends StatefulWidget {
//   const GetDataApiScreen({super.key});
//
//   @override
//   State<GetDataApiScreen> createState() => _GetDataApiScreenState();
// }
//
// class _GetDataApiScreenState extends State<GetDataApiScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.blue),
//       body: FutureBuilder<List<StatusList>>(
//           future: GetApiService.statusList(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             } else {
//               return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         Text(snapshot.data![index].data![index].id.toString())
//                       ],
//                     );
//                   });
//             }
//           }),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'get_api_data_service.dart';
import 'get_api_detail.dart';
import 'get_api_model.dart';

class GetDataApiScreen extends StatefulWidget {
  const GetDataApiScreen({super.key});

  @override
  State<GetDataApiScreen> createState() => _GetDataApiScreenState();
}

class _GetDataApiScreenState extends State<GetDataApiScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<EntriesData>(
          future: GetApiService.entriesList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: GestureDetector(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetApiDetails(
                                dataModeldetails: snapshot.data!)));
                  },
                  child: ListTile(
                    title: Card(
                      color: Colors.teal[300],
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${snapshot.data!.disclaimer.toString()}.',
                              maxLines: 1,
                            ),
                            Text(
                              '${snapshot.data!.chartName.toString()}',
                              maxLines: 1,
                            ),
                            // Text(
                            //     'Salary: ${snapshot.data![index].employeeSalary.toString()}'),
                            // Text(
                            //     'Age: ${snapshot.data![index].employeeAge.toString()}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
