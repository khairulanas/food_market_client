part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "You've Made Order",
        subtitle: "just stay at home while we are\npreparing your best food",
        picturePath: "assets/bike.png",
        buttonTitle1: "Order Other Foods",
        buttonTap1: () {},
        buttonTitle2: "View My Order",
        buttonTap2: () {},
      ),
    );
  }
}
