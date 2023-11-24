import 'package:flutter/material.dart';
import 'package:practice2/rest_api/practice/product_details_screen.dart';
import 'package:practice2/rest_api/practice/user_model.dart';

class UserApiDetails extends StatefulWidget {
  final UserList2 userListDetails;
  const UserApiDetails({super.key, required this.userListDetails});

  @override
  State<UserApiDetails> createState() => _UserApiDetailsState();
}

class _UserApiDetailsState extends State<UserApiDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableRow(
                        maxline: 1,
                        title: 'FullName',
                        value:
                            '${widget.userListDetails.firstName.toString()} ${widget.userListDetails.lastName.toString()} ${widget.userListDetails.maidenName.toString()}'),
                    ReusableRow(
                        maxline: 10,
                        title: 'Personal Details',
                        value:
                            'DOB: ${widget.userListDetails.birthDate.toString()}\n'
                            'H/W: ${widget.userListDetails.height.toString()}/ ${widget.userListDetails.weight.toString()}\n'
                            'BloodG: ${widget.userListDetails.bloodGroup.toString()}\n'
                            'phone :${widget.userListDetails.phone.toString()}\n'
                            'Study :${widget.userListDetails.university.toString()}'),
                    ReusableRow(
                        maxline: 1,
                        title: 'Email',
                        value: widget.userListDetails.email.toString()),
                    ReusableRow(
                        maxline: 3,
                        title: 'Live at: ',
                        value:
                            '${widget.userListDetails.address!.address.toString()}, ${widget.userListDetails.address!.city.toString()}, ${widget.userListDetails.address!.postalCode.toString()}, ${widget.userListDetails.address!.state.toString()}'),
                    ReusableRow(
                        maxline: 1,
                        title: 'username :',
                        value: widget.userListDetails.username.toString()),
                    ReusableRow(
                        maxline: 1,
                        title: 'domain :',
                        value: widget.userListDetails.domain.toString()),
                    ReusableRow(
                        maxline: 2,
                        title: 'Bank Details :',
                        value:
                            'Card Type: ${widget.userListDetails.bank!.cardType.toString()} \nCurrenty: ${widget.userListDetails.bank!.currency.toString()}'),
                    ReusableRow(
                        maxline: 10,
                        title: 'About the Company :',
                        value:
                            'Name: ${widget.userListDetails.company!.name.toString()} \n'
                            'Dep.: ${widget.userListDetails.company!.department.toString()}\n'
                            'Prof.: ${widget.userListDetails.company!.title}\n'
                            'Location:\n${widget.userListDetails.company!.address!.address.toString()}\n'
                            '${widget.userListDetails.company!.address!.city.toString()}\n'
                            '${widget.userListDetails.company!.address!.state.toString()}'),
                    ReusableRow(
                        maxline: 2,
                        title: 'UserAgent',
                        value: widget.userListDetails.userAgent.toString()),
                  ],
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
