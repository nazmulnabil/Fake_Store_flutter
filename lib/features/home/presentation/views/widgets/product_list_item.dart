import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_flutter/features/details/presentation/views/pages/product_details_page.dart';
import 'package:fake_store_flutter/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/value/app_colors.dart';
import 'bottom_loader.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({Key? key, required this.item}) : super(key: key);

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: item,

            )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),

        decoration: const BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child:CachedNetworkImage(
                imageUrl: item.image.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.transparent,
                      ),
                    ],
                    image: DecorationImage(

                      image: imageProvider,
                      fit: BoxFit.contain,

                      // colorFilter: const ColorFilter.mode(Colors.white, BlendMode.colorBurn)
                    ),
                  ),
                ),
                placeholder: (context, url) => Loader(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              item.title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '\$${item.price}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                  color: Color.fromARGB(
                      255, 253, 104, 104),
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
