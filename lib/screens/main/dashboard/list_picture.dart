import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPicture extends StatefulWidget {
  ListPicture({super.key, required this.img});

  List? img;

  @override
  State<ListPicture> createState() => _ListPictureState();
}

class _ListPictureState extends State<ListPicture> {
  final ColorApp colorApp = ColorApp();
  final TextCollection textCollection = TextCollection();

  // List<Map<String, dynamic>> warehouses = [
  //   {
  //     'image' :'https://images.unsplash.com/photo-1624927637280-f033784c1279?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  //   },
  //   {
  //     'image':'https://images.unsplash.com/photo-1644079446600-219068676743?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fHdhcmVob3VzZXxlbnwwfHwwfHx8MA%3D%3D',
  //   },
  //   {
  //     'image':'https://images.unsplash.com/photo-1565610222536-ef125c59da2e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8d2FyZWhvdXNlfGVufDB8fDB8fHww',
  //   },
  //   {
  //     'image':'https://images.unsplash.com/photo-1586528116493-a029325540fa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fHdhcmVob3VzZXxlbnwwfHwwfHx8MA%3D%3D',
  //   },
  //   {
  //     'image':'https://images.unsplash.com/photo-1599452390941-251da594d7e3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTF8fHdhcmVob3VzZXxlbnwwfHwwfHx8MA%3D%3D',
  //   },
  //   {
  //     'image':'https://images.unsplash.com/photo-1616401776146-ae3453da7105?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjN8fHdhcmVob3VzZXxlbnwwfHwwfHx8MA%3D%3D',
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Foto Bangunan',
          style: textCollection.heading6,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorApp.secondaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: widget.img!.isEmpty
          ? Center(
              child: Text(
                'No images available',
                style: TextCollection()
                    .bodySmall
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 24, bottom: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.img?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.28,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                widget.img?[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
