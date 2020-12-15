part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;

  const OrderListItem({Key key, this.transaction, this.itemWidth})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(transaction.food.picturePath),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182, // -60 - 12 - 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food.name,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                "${transaction.quantity} item(s) - " +
                    NumberFormat.currency(
                            symbol: "IDR", decimalDigits: 0, locale: "id-ID")
                        .format(transaction.total),
                style: greyFontStyle.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                convertDateTime(transaction.dateTime),
                style: greyFontStyle.copyWith(fontSize: 12),
              ),
              transactionStatus(transaction.status)
            ],
          ),
        ),
      ],
    );
  }

  Widget transactionStatus(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.cancelled:
        return Text('Cancelled',
            style:
                GoogleFonts.poppins(color: 'D9435E'.toColor(), fontSize: 10));
        break;
      case TransactionStatus.pending:
        return Text('Pending',
            style:
                GoogleFonts.poppins(color: 'D9435E'.toColor(), fontSize: 10));
        break;
      case TransactionStatus.on_delivery:
        return Text('On Delivery',
            style:
                GoogleFonts.poppins(color: '1ABC9C'.toColor(), fontSize: 10));
        break;
      case TransactionStatus.delivered:
        return Text('Delivered',
            style:
                GoogleFonts.poppins(color: '1ABC9C'.toColor(), fontSize: 10));
        break;
      default:
        return SizedBox();
    }
  }

  String convertDateTime(DateTime date) {
    List<String> monts = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des'
    ];
    String month = monts[date.month - 1];
    return month + ' ${date.day}, ${date.hour}:${date.minute}';
  }
}
