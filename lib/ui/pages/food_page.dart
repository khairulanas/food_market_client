part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            //// header
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Food Market',
                        style: blackFontStyle1,
                      ),
                      Text(
                        "let's get some food",
                        style:
                            greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://static.wikia.nocookie.net/saekano/images/b/b3/1b4779de01940bec59446ff549cb6a74.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
            //// list of food
            Container(
              height: 258,
              width: double.infinity,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Row(
                  children: mockFoods
                      .map((e) => Padding(
                            padding: EdgeInsets.only(
                                left:
                                    (e == mockFoods.first) ? defaultMargin : 0,
                                right: defaultMargin),
                            child: FoodCard(food: e),
                          ))
                      .toList(),
                )
              ]),
            ),
            //// list of food (tabs)
          ],
        )
      ],
    );
  }
}
