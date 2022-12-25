import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_flutter/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_colors.dart';
import 'bottom_loader.dart';

class ProductListItem extends StatefulWidget {
  const ProductListItem({Key? key, required this.item}) : super(key: key);

  final ProductModel item;

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return  InkWell(
      onTap: (){

      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),

        decoration: const BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child:Column(
          children:[
            //image container
            Container(
              height:width/2.75,
              decoration: const BoxDecoration(
                // color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: widget.item.image.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.transparent,
                      ),
                    ],
                    image: DecorationImage(

                      image: imageProvider,
                      fit: BoxFit.fill,

                      // colorFilter: const ColorFilter.mode(Colors.white, BlendMode.colorBurn)
                    ),
                  ),
                ),
                placeholder: (context, url) => Loader(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            ),

            //product description
            Padding(
              padding: const EdgeInsets.only(top: 5.0,left: 8),
              child: Text(widget.item.title.toString(),
                style: const TextStyle(
                    fontSize:14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackTextColor
                ),),
            ),

            //price row
            Container(
              margin: const EdgeInsets.only(left: 8.0,right:8,top: 5,bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Row(
                    children:  [
                      const Text("Price:",
                        style: TextStyle(
                            fontSize:8,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyTextColor
                        ),),

                      const SizedBox(width: 5,),

                      Text(
                        '৳ ${widget.item.price.toString()}',
                        style: const TextStyle(
                            fontSize:16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.pinkTextColor
                        ),),
                    ],
                  ),
                ],),
            ),

            //category row

            Container(
              margin:  const EdgeInsets.only(left: 8.0,right:8,bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Row(
                    children:  [
                      const Text("category:",
                        style: TextStyle(
                            fontSize:8,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyTextColor
                        ),),

                      const SizedBox(width: 5,),

                      Text("৳ ${widget.item.category}",
                        style: const TextStyle(
                            fontSize:16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.pinkTextColor
                        ),),
                    ],
                  ),

                  Row(
                    children: [
                      const Text("Rating",
                        style: TextStyle(
                            fontSize:8,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyTextColor
                        ),),
                      Text(" ৳${widget.item.rating}",
                        style: const TextStyle(
                          fontSize:12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.pinkTextColor,
                        ),),
                    ],
                  ),

                ],),
            ),
            // SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
