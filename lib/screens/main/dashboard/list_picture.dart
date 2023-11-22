import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class ListPicture extends StatefulWidget {
  const ListPicture({super.key});

  @override
  State<ListPicture> createState() => _ListPictureState();
}

class _ListPictureState extends State<ListPicture> {
  final ColorApp colorApp = ColorApp();
  final TextCollection textCollection = TextCollection();

  List<Map<String, dynamic>> warehouses = [
    {
      'image':'https://s3-alpha-sig.figma.com/img/c629/04f3/b3c749e126af689f97393bc22d46f6c3?Expires=1701648000&Signature=cQwQ1P~uj6nM726HVS3e8MYe53bMOhpfJo8xAJvUQHNCTpYPXwkJAHBdIi70N0W4pnVzBROCjE6xJ9F28QNGk3Q1k-OMbmO3jqpAZIbXb5xgHjwjSknPNpXJSLx4KYQsgP2YTkYhHs6l~YSRcyuOBBxGLzzdmps-FZwHj7yKpz-l5PxAyiR2M4FEeAelJPxNBSJBuKUMuMbHPw9cV~WjDGWy4nxQ~RI0BtdZosiYU8Z2K4lTnOtdBn81-PNchtmhvygANIKOWpkTr1lkK9a4jUcxmDZe1tjAlbxVwtmwWeqbJBnIeZYJhATTiSGU605NAvaGSgf12ATzludZFW92~Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    },
    {
      'image':'https://s3-alpha-sig.figma.com/img/fd68/580f/05330c75a307a6a00db84a224e609818?Expires=1701648000&Signature=R5Z42DLTKy6YtTe5Z6If0gi9ttXcI7T1KkYHPMXOG8wqtztgBF2YwJgl5lieawNqkXNm0HiqR0t3cJOIU4thwr2NkYvaIXBk4IRl2sHOeC898vSKK2V7UrOMB0GUSm-u7-JjBx5DkjUDg7iP~UuOQoAsT4dRN4nIhtZIlFrwb8WgJC-6GvFOzsc3ZcEM1n6~LHDlGiesHuZD~QJNWBuT8Fu66UnN9QIOEPFgAJeAZ~1qhb4EBl2EHJcbLg0dJqRr9B0cMe6KzOStpBlUYyIu0FQ9itm5qRFpgWXZNo17ZzJLAU06dF44Y5wazvP5DC49Cn~l14vNwCcHxJLx2Kf32A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    },
    {
      'image':'https://s3-alpha-sig.figma.com/img/2279/498d/7b506e68a63920e2d4a31852d5552fa3?Expires=1701648000&Signature=ctxbXuMY1Kp61JhcoSJtyRRVLbKjMRmXKip1yMtkifpEQszfc2aIpIeJjcAcTzYTSwPvzqS7UuWfiDQfcW445reO5fuM0uiM~2DCoGHGlO3O0M9rsJmYVbHChOs~zePzSloG7QH~6iX9EKvSzggQBwAUa6fV-9P9fId4-3RyeCSirIUgtUrE3LstHVUNckb9A7lXVaFYiaLrCi2cF7WK-raQ6XzkKjNMZOa6VTRkyBJC7aLC~KX4v5BmyJB~Lu2~sxNihUGq5eV9-DKyex-Bt8yuCO7EAozp-mIOHDB~sTbe8UgMtSHXMT6T7NZi4F7o88azAGRLrol06JnlPS3MFg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    },
    {
      'image':'https://s3-alpha-sig.figma.com/img/e27f/35b2/5642309754959019936c3559163eaa17?Expires=1701648000&Signature=AkqlVY-aW3vVb1ShJ1-~SXcyvXBC7GQOziyPfIU4MxYYEIywVMxiyLwnjutvt85b~Ci2aJwi54hQVHO9KM007U9EoQjMmT9ugzr4vP6slceodWW2phOqfG2PAOB7FrUHRIPk0TIFJKmcp~YaH6BwKizCD0Q5Fr-A6~QPomvp~-m1sS3ygpVPxsTBbqZURJs3WMwDNwQ~x65QgPYLJd1uXz3M2mrWGtWHmFs3KlYgrI6O1H6iMu0Jl0HCwkYFnvStUD1~49V7Bytc3GpIhbGzJCrnlMAqSPYRfQlfIUDS3-aklT2Q1O9iY4ZmYoULg7zaecgqk54mO5CYObPjvbzkRQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    },
    {
      'image':'https://s3-alpha-sig.figma.com/img/06d0/7549/94920cfebb2e75f42e767a861bdb9485?Expires=1701648000&Signature=EfTrsE9YHGMmsnsGH1-obTeCFCO7i3wpB5HMLS50ap152qSZOaK6LwsFjJD4IDClTIYnNclPiOODKsUxyYwGRn-AI3ziu5dq4tTjxsgcSkfm~Rekbu6n10AksmXPTrqOTqmvLtxmkKgaR6Z294QaKNEfq8TEshiBrtBWQu0sCzxwUAEp006pN-ehjgEzilEIDR3-CLeaJQtLMAgAozIS2mCZK96W0WqM-UjTdRzqKDCwAbGJvBGW0eGpzjLY6ORPTlExi~rAHbKSnbaX5re2UVlbKsJ-WGAYwBb59sRqQUCQXvp35R6K-l9rXpHMYk-vJVxhuc0An7geprVR9FZh4A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    },
    {
      'image':'https://s3-alpha-sig.figma.com/img/d80e/28c3/0ac50ba081e3f8d8fd516ea6f2c68a90?Expires=1701648000&Signature=A4jYhfrqj7wr89VlRLCLIrs35Zvn6mPckgiywom79CfLKWM6oHeALuAVcAojTbKUVCMZRlxx6gVxGWcXSE~aLQnbPFTaZrLLh4TuzVpoGcawEioX32AVg9pRa65h-nnVA-e2J8RU-95bngqNkUnSjKInqSCsC6rvUQBVxyvfl1PJBVWs-M91u6jV6A8eRPR59mtCJRGJKZac8RV9j1VedqYG5vvbAaOytCL~NIcVUHKH8Bt98aEaqztvv~aZW4CgA2SySkcpLdTjSSIgZxsFcIIIx-bEB3FFvjFK8umoHCGMJ2d9wg4X9hhQeEfHH-2DqHuTxUF-WtNtAFCui~YwPA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foto Bangunan', style: textCollection.heading6,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorApp.secondaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 24, bottom: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: warehouses.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.28,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          warehouses[index]['image'],
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