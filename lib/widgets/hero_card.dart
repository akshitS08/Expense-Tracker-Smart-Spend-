import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({super.key, this.userId});

  final String? userId;

  // Use the userId dynamically to fetch data
  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots();

    return StreamBuilder<DocumentSnapshot>(
      stream: usersStream,
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        var data = snapshot.data!.data() as Map<String, dynamic>;

        return Cards(data: data);
      },
    );
  }
}


class Cards extends StatelessWidget {
  const Cards({
    super.key, required this.data,
  });

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Text(
                  "Total Balance",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "₹ ${data['remainingAmount']}",
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 30, bottom: 10, left: 10, right: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.black26,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CardOne(color: Colors.green, heading: 'Credit',
                    amount: "${data['totalCredit']}",),
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: CardOne(color: Colors.red, heading: 'Debit',
                    amount: "${data['totalDebit']}",),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne({super.key, required this.color, required this.heading, required this.amount});

  final Color color;
  final String heading;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: TextStyle(
                    color: color,
                    fontSize: 14, // Reduced font size
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "₹ $amount",
                  style: TextStyle(
                    color: color,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,// Reduced font size
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                heading == "Credit"?
                Icons.arrow_upward_outlined
                    :Icons.arrow_downward_outlined,
                color: color,),
            )
          ],
        ),
      ),
    );
  }
}
