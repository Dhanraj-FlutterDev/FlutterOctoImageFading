
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ImagePage(),
));


class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Fading'),
      ),
      body: ListView(
        children: [
          _customImage(),
          SizedBox(height: 20),
          _simpleImageBlur(),
          SizedBox(height: 20,),
          _avatarImage(),
        ],
      ),
    );
  }
  
  Widget _customImage(){
    return SizedBox(
      height: 150,
      child: OctoImage(
        image: NetworkImage('https://cdn.pixabay.com/photo/2019/08/11/07/11/casette-4398267_1280.png'),
        progressIndicatorBuilder: (context,progress){
          double value;
          if(progress!= null && progress.expectedTotalBytes !=null){
            value = progress.cumulativeBytesLoaded / progress.expectedTotalBytes;
          }
          return CircularProgressIndicator(value: value);
        },
      ),
    );
  }
  
  Widget _simpleImageBlur(){
    return AspectRatio(aspectRatio: 320/240,
    child: OctoImage(
      image: NetworkImage('https://blurha.sh/assets/images/img2.jpg'),
      placeholderBuilder: OctoPlaceholder.blurHash('LGF5]+Yk^6#M@-5c,1J5@[or[Q6.'),
      errorBuilder: OctoError.icon(color: Colors.red),
      fit: BoxFit.cover,
    ),
    
    );
    
  }
  
  Widget _avatarImage(){
    return SizedBox(
      height: 75,
      child: OctoImage.fromSet(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Macaca_nigra_self-portrait_large.jpg/1024px-Macaca_nigra_self-portrait_large.jpg'),
          octoSet:OctoSet.circleAvatar(backgroundColor: Colors.yellow, text:Text('Monkey'),),

      ),
    );
    
  }
  
  
  
  
  
}
