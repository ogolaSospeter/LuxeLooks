import 'package:flutter/material.dart';
import 'package:luxelooks/Screens/serviceproviderdescription.dart';
import 'package:luxelooks/datasets/service_providers.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      fit: FlexFit.tight,
      child: GridView.count(
        crossAxisCount: 2,
        semanticChildCount: providers.length,
        // Adjust the aspect ratio
        padding: const EdgeInsets.all(7.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 5.0,
        children: providers.map((provider) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return DescriptionPage(
                      title: provider.title,
                      image: provider.image,
                      name: provider.name,
                      location: provider.location,
                      authenticity: provider.description,
                    );
                  },
                ),
              );
            },
            child: Container(
              height: 200,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 80, width: 80, child: provider.image),
                  ListTile(
                    title: Text(
                      provider.name,
                      style: const TextStyle(fontSize: 13.5),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ID: ${provider.id}',
                          style: const TextStyle(fontSize: 9),
                        ),
                        Text(
                          'Title: ${provider.title}',
                          style: const TextStyle(fontSize: 9),
                        ),
                        Text(
                          'Location: ${provider.location}',
                          style: const TextStyle(fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
