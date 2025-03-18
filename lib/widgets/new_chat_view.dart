import 'package:flutter/material.dart';
import 'suggestion_card.dart';

class NewChatView extends StatelessWidget {
  final Function(String) onSuggestionTap;

  const NewChatView({
    super.key,
    required this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Center(
            child: Image.asset('assets/images/icon.png', width: 80, height: 80),
          ),
          const SizedBox(height: 32),
          SuggestionCard(
            title: 'Give me ideas',
            subtitle: 'For what to do with my kids\' art',
            onTap: () => onSuggestionTap(
              'Give me ideas for what to do with my kids\' art',
            ),
          ),
          const SizedBox(height: 16),
          SuggestionCard(
            title: 'Create a charter',
            subtitle: 'To start a film club',
            onTap: () => onSuggestionTap('Create a charter to start a film club'),
          ),
          const SizedBox(height: 16),
          SuggestionCard(
            title: 'Analysis a PDF, Docs file',
            subtitle: 'For what to do with my kids\' art',
            onTap: () => onSuggestionTap(
              'Analysis a PDF, Docs file for what to do with my kids\' art',
            ),
          ),
          const SizedBox(height: 16),
          SuggestionCard(
            title: 'Brainstorm names',
            subtitle: 'For what to do with my kids\' art',
            onTap: () => onSuggestionTap(
              'Brainstorm names for what to do with my kids\' art',
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'These are just a few examples of what I can do.',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}