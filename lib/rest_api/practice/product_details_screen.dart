import 'package:flutter/material.dart';
import 'package:practice2/rest_api/practice/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductApiList productApiList;
  ProductDetailScreen({
    super.key,
    required this.productApiList,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.productApiList.title.toString(),
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                  ),
                ),
              ),
              ReusableRow(
                  maxline: 1,
                  title: 'Price:',
                  value: widget.productApiList.price.toString()),
              ReusableRow(
                  maxline: 1,
                  title: 'Brand:',
                  value: widget.productApiList.brand.toString()),
              ReusableRow(
                title: 'Category:',
                value: widget.productApiList.category.toString(),
                maxline: 1,
              ),
              ReusableRow(
                  maxline: 1,
                  title: 'Stock:',
                  value: widget.productApiList.stock.toString()),
              ReusableRow(
                  maxline: 1,
                  title: 'Rating:',
                  value: widget.productApiList.rating.toString()),
              ReusableRow(
                  maxline: 1,
                  title: 'ThumbNail:',
                  value: widget.productApiList.thumbnail.toString()),
              ReusableRow(
                  maxline: 1,
                  title: 'Description:',
                  value: widget.productApiList.description.toString()),
              ReusableRow(
                  maxline: 1,
                  title: ' ',
                  value:
                      '${widget.productApiList.discountPercentage.toString()} % Off'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    widget.productApiList.images!.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: Container(
                          height: 100,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle),
                          child: Image.network(
                            fit: BoxFit.fill,
                            widget.productApiList.images![index].toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle),
                  child: Image.network(
                    fit: BoxFit.cover,
                    widget.productApiList.thumbnail.toString(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  int maxline;
  ReusableRow(
      {super.key,
      required this.value,
      required this.title,
      required this.maxline});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(title, overflow: TextOverflow.ellipsis)),
                Expanded(
                    child: Text(value,
                        overflow: TextOverflow.ellipsis,
                        maxLines: maxline == maxline ? maxline : 1)),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
