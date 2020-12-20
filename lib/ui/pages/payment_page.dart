part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  const PaymentPage({Key key, @required this.transaction}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Widget _itemDetailRow({String title, String subtitle}) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
              child: Text(
                title,
                style: greyFontStyle,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
              child: Text(
                subtitle,
                style: blackFontStyle3,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        );
    return GeneralPage(
      title: 'Payment',
      subtitle: 'you deserve beter meal',
      onBackButtonPressed: () {},
      backColor: 'FAFAFC'.toColor(),
      child: Column(
        children: [
          //// bagian atas
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: 16,
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Ordered',
                  style: blackFontStyle3,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.transaction.food.picturePath),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 189,
                              child: Text(
                                widget.transaction.food.name,
                                style: blackFontStyle2,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                                NumberFormat.currency(
                                        locale: 'id-ID',
                                        symbol: 'IDR',
                                        decimalDigits: 0)
                                    .format(widget.transaction.food.price),
                                style: greyFontStyle.copyWith(fontSize: 13)),
                          ],
                        ),
                      ],
                    ),
                    Text('${widget.transaction.quantity} item(s)',
                        style: greyFontStyle.copyWith(fontSize: 13))
                  ],
                ),
                //// detail transaction
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Details Transaction',
                    style: blackFontStyle3,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.food.name,
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(widget.transaction.total),
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        'Driver',
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(50000),
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        'Tax 10%',
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(widget.transaction.total * 0.1),
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        "Total",
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(widget.transaction.total),
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.w500,
                            color: '1ABC9C'.toColor()),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
              ],
            ),
          ),
          //// bagian bawah
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: 16,
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Deliver to',
                    style: blackFontStyle3,
                  ),
                ),
                _itemDetailRow(
                    title: 'Name', subtitle: widget.transaction.user.name),
                SizedBox(height: 6),
                _itemDetailRow(
                    title: 'Phone no',
                    subtitle: widget.transaction.user.phoneNumber),
                SizedBox(height: 6),
                _itemDetailRow(
                    title: 'Address',
                    subtitle: widget.transaction.user.address),
                SizedBox(height: 6),
                _itemDetailRow(
                    title: 'House no',
                    subtitle: widget.transaction.user.houseNumber),
                SizedBox(height: 6),
                _itemDetailRow(
                    title: 'City', subtitle: widget.transaction.user.city),
                SizedBox(height: 6),
              ],
            ),
          ),
          //// button checkout
          Padding(
            padding: const EdgeInsets.only(bottom: 26),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              height: 45,
              child: RaisedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });

                  bool isSubmitted = await context
                      .read<TransactionCubit>()
                      .submitTransactions(widget.transaction.copyWith(
                        dateTime: DateTime.now(),
                        total: (widget.transaction.total * 1.1).toInt() + 50000,
                      ));

                  if (isSubmitted) {
                    Get.to(SuccessOrderPage());
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                    Get.snackbar(
                      "",
                      "",
                      backgroundColor: 'D9435E'.toColor(),
                      icon: Icon(
                        MdiIcons.closeCircleOutline,
                        color: Colors.white,
                      ),
                      titleText: Text(
                        'Transaction Failed',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      messageText: Text('Please try again later.',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          )),
                    );
                  }
                },
                color: mainColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  'Checkout Now',
                  style: blackFontStyle3.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
