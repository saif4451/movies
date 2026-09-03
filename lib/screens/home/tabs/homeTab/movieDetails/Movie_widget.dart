import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/Model/movie_details/Movie.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_routs.dart';
import 'package:movies_app/core/utils/app_text_styels.dart';
import 'package:movies_app/screens/home/tabs/homeTab/movieDetails/movie_suggest_response.dart';
import 'package:movies_app/screens/widgets/Custom_container_rate.dart';
import 'package:movies_app/screens/widgets/ScreenShot_image.dart';
import 'package:movies_app/screens/widgets/cast_container.dart';
import 'package:movies_app/screens/widgets/custom_elevated_button.dart';
import 'package:movies_app/screens/widgets/genres_container.dart';

import '../../../../../core/utils/mob_size.dart';

class MovieWidget extends StatelessWidget {
 final  Movie movie;
 const MovieWidget({super.key, required this.movie, });


 /*Future<void> _markMovieAsWatched(BuildContext context) async {
   try {
     final user = FirebaseAuth.instance.currentUser;
     if (user == null) {
       ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: Text('Please log in first!')),
       );
       return;
     }

     await FirebaseFirestore.instance
         .collection('users')
         .doc(user.uid)
         .collection('watched_movies')
         .doc(movie.id.toString())
         .set({
       'movieId': movie.id,
       'title': movie.title ?? '',
       'posterPath': movie.largeCoverImage ?? '',
       'watchedAt': FieldValue.serverTimestamp(),
     });

     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('Added to Watched History successfully!')),
     );
   } catch (e) {
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Error: ${e.toString()}')),
     );
   }
 }
*/

 /*Future<void> _markMovieAsWatched(BuildContext context) async {
   try {
     const dummyUserId = "test_user_id";

     await FirebaseFirestore.instance
         .collection('users')
         .doc(dummyUserId)
         .collection('watched_movies')
         .doc(movie.id.toString())
         .set({
       'movieId': movie.id,
       'title': movie.title ?? '',
       'posterPath': movie.largeCoverImage ?? '',
       'watchedAt': FieldValue.serverTimestamp(),
     });

     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('Added to Watched History successfully!')),
     );
   } catch (e) {
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Error: ${e.toString()}')),
     );
   }
 }
 */
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return SingleChildScrollView(
      child: Stack(
        children: [
          CachedNetworkImage(imageUrl: movie.largeCoverImage??''),
          Image.asset(AppAssets.movieShadow, fit: BoxFit.fill,),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: height*0.02, horizontal: width*0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: height*0.015,

              children: [
                SizedBox(
                  height: height*0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                  ,children: [
                    IconButton(onPressed: (){
                      Navigator.popUntil(context, ModalRoute.withName(AppRouts.homeRouteName));
                    },
                        icon: Icon(Icons.arrow_back_ios_new,color: AppColors.whiteColor, size: 30,)),
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.bookmark, color: AppColors.whiteColor,size: 30,))


                  ],
                ),
                SizedBox(
                  height: height*0.15,
                ),
                IconButton(onPressed: (){},
                    icon: Image.asset(AppAssets.watch)),
                SizedBox(
                  height: height*0.15,
                ),
                Text(movie.title??'',
                  style: AppTextStyels.white24bold,),
                Text('${movie.year??''}',
                  style: AppTextStyels.grey20bold,),
                CustomElevatedButton(text: context.tr("watch"),
                    func: () {},
                    color: AppColors.redColor, textStyle: AppTextStyels.white20bold),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainerRate(icon: Icons.favorite, rate: movie.likeCount),
                    CustomContainerRate(icon: Icons.watch_later, rate: movie.runtime),
                    CustomContainerRate(icon: Icons.star, rate: movie.rating),

                  ],
                ),
                SizedBox(
                  width: width,
                    child: Text(context.tr("screen_shots"), style: AppTextStyels.white24bold,textAlign: TextAlign.start,)),
                ScreenshotImage(image: movie.largeScreenshotImage1),
                ScreenshotImage(image: movie.largeScreenshotImage2),
                ScreenshotImage(image: movie.largeScreenshotImage3),
                SizedBox(
                    width: width,
                    child: Text(context.tr("similar"), style: AppTextStyels.white24bold,textAlign: TextAlign.start,)),
                MovieSuggestResponse(movieId: movie.id!),
                if(movie.descriptionFull!=null && movie.descriptionFull !='')
                  SizedBox(
                    width: width,
                    child: Text(context.tr("summary"),
                      style: AppTextStyels.white24bold,textAlign: TextAlign.start,)),
                Text(movie.descriptionFull??'',
                  style: AppTextStyels.White16regular,),
                SizedBox(
                    width: width,
                    child: Text(context.tr("cast"),
                      style: AppTextStyels.white24bold,textAlign: TextAlign.start,)),
                if(movie.cast!=null && movie.cast!.isNotEmpty)
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CastContainer(actor: movie.cast![index]);
                    },
                  itemCount: movie.cast!.length,
                ),
                SizedBox(
                    width: width,
                    child: Text(context.tr("genres"),
                      style: AppTextStyels.white24bold,textAlign: TextAlign.start,)),
                if(movie.genres!=null && movie.genres!.isNotEmpty)
                GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                        mainAxisSpacing: height*0.02,
                        crossAxisSpacing: width*0.04,
                      childAspectRatio: 2.5
                    ),
                    itemBuilder: (context, index) {
                      return GenresContainer(genres: movie.genres![index]);
                    },
                  itemCount: movie.genres!.length,
                )





              ],
            ),
          )
        ],
      ),
    );
  }
}
