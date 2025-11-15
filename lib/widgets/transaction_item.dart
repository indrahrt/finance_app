import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  final TransactionModel transaction;
  final int index;

  const TransactionItem({
    super.key,
    required this.transaction,
    required this.index,
  });

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0), // mulai dari kanan
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Delay animasi berdasarkan index
    Future.delayed(Duration(milliseconds: 100 * widget.index), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  IconData _getIcon(String category) {
    switch (category) {
      case 'Deposit':
        return Icons.account_balance;
      case 'Asuransi':
        return Icons.health_and_safety;
      case 'Donasi':
        return Icons.volunteer_activism;
      case 'Investasi':
        return Icons.trending_up;
      case 'Pinjaman':
        return Icons.request_page;
      case 'Pendapatan':
        return Icons.attach_money;
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Detail: ${widget.transaction.title}")),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple.shade50,
              child: Icon(
                _getIcon(widget.transaction.category),
                color: Colors.deepPurple,
              ),
            ),
            title: Text(
              widget.transaction.title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              widget.transaction.category,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            trailing: Text(
              widget.transaction.amount,
              style: TextStyle(
                color: widget.transaction.amount.startsWith('-')
                    ? Colors.redAccent
                    : Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}