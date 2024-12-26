import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_spend/widgets/transactions_card.dart';

class TransactionsCards extends StatelessWidget {
  const TransactionsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "Recent Transactions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          RecentTransactionsList(),
        ],
      ),
    );
  }
}

class RecentTransactionsList extends StatelessWidget {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  RecentTransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection("transactions")
          .orderBy('timestamp', descending: true)
          .limit(10)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>   snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('Error: ${snapshot.error}');
          return const Text('Something went wrong');
        }

        // Show loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          print('Snapshot is waiting...');
          return const Text("Loading...");
        }

        // If there is data
        if (snapshot.hasData) {
          print('Snapshot has data: ${snapshot.data!.docs.length} documents');
          for (var doc in snapshot.data!.docs) {
            print('Document data: ${doc.data()}'); // Print the data of each document
          }
        }

        // If no data is found
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          print('No transactions found.');
          return const Center(
            child: Text('No Transaction found.'),
          );
        }

        // If there is data, return the list of transaction cards
        var data = snapshot.data!.docs;
        print('Transactions retrieved: ${data.length}');
        return ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var cardData = data[index].data() as Map<String, dynamic>;
            return TransactionCard(data: cardData);
          },
        );
      },
    );
  }
}




