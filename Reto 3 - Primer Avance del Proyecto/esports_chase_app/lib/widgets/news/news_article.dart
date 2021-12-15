import 'package:flutter/material.dart';

class NewsArticle extends StatelessWidget {
  const NewsArticle({Key? key, required this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              "Título de la noticia $number",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Image(image: AssetImage("static/assets/loading.gif")),
            ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempor lacus at erat posuere ullamcorper. Nulla laoreet lectus quis efficitur faucibus. Nulla vitae lacus nisl. Donec mattis justo ut dapibus efficitur. Maecenas fringilla odio rutrum, luctus mi et, dictum tellus. Nullam non magna sit amet lectus pulvinar semper quis eget neque. Aenean nisi metus, ornare vitae vulputate non, vulputate ac nibh. In nulla risus, cursus vel scelerisque vitae, tempus vitae massa. Phasellus a magna ut mi malesuada ullamcorper. Sed dictum sagittis tortor, quis rutrum magna commodo eget. Nulla pulvinar pretium nunc, a suscipit velit fermentum id. Integer pretium varius dolor a imperdiet. Sed eros odio, pharetra vel quam nec, pulvinar fringilla dolor. Integer et lectus velit.\n\nAenean ut enim luctus, faucibus nisi eget, aliquam justo. Nam sed tempus erat, vitae interdum urna. Proin ut lacinia ante. Curabitur libero sem, eleifend vitae pretium et, laoreet in erat. Donec nec risus tellus. Morbi imperdiet id ante ac sollicitudin. Vestibulum venenatis nisi et enim finibus commodo. Vestibulum eu consequat libero. Proin ac neque diam. In hac habitasse platea dictumst. Mauris ullamcorper vitae justo quis pharetra. Nunc tincidunt orci elit, ac scelerisque ligula interdum eu. Donec gravida, magna nec fringilla consequat, leo lectus bibendum leo, non consequat arcu massa eu purus. Curabitur accumsan arcu eget lectus finibus laoreet. Etiam facilisis mi enim, vitae gravida odio aliquet a.\n\nUt et neque et magna egestas ultricies. Fusce eu turpis eu odio tempus feugiat. Aliquam rutrum velit non lacus lobortis pharetra. Duis in ex eget libero pellentesque iaculis tincidunt sed ipsum. In ut risus eget enim porta gravida sit amet ac nibh. Proin vestibulum urna sed purus porttitor ultricies. Sed vel augue leo. Vivamus viverra dui ex, nec commodo orci hendrerit nec. Donec odio metus, hendrerit eget ornare nec, sollicitudin et enim. Phasellus orci ipsum, euismod et libero eu, rhoncus elementum neque. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis sodales ante et sem condimentum auctor. Quisque laoreet rhoncus turpis, nec suscipit leo tristique et. Cras egestas tortor quis dolor ultrices, at mattis ipsum tincidunt.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
