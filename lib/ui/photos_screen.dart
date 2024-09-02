import 'package:flutter/material.dart';
import 'package:untitled/service/api_service.dart';
import 'package:untitled/model/photos.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  final Future<List<Photos>?> photos = ApiService().getPhotos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
      ),
      body: FutureBuilder(
          future: photos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('${snapshot.data?[index].title}'),
                            content:
                                Image.network('${snapshot.data?[index].url}'),
                          );
                        },
                      );
                    },
                    child: ListTile(
                      title: Text(
                        '${snapshot.data?[index].title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        '${snapshot.data?[index].thumbnailUrl}',
                      ),
                      leading: Image.network(
                        '${snapshot.data?[index].url}',
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data?.length,
              );
            }
          }),
    );
  }
}
