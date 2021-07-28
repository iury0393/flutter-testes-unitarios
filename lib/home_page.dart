import 'package:flutter/material.dart';
import 'package:flutter_testes/person_bloc.dart';
import 'package:flutter_testes/person_state.dart';

import 'bloc_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Persons'),
        actions: [
          StreamBuilder(
            stream: bloc.stream,
            builder: (context, snapshot) {
              final isEnable =
                  bloc.state is PersonListState && (bloc.state as PersonListState).data.isNotEmpty;
              return IconButton(
                  icon: const Icon(Icons.refresh_outlined),
                  onPressed: isEnable ? () => bloc.add(PersonEvent.clear) : null);
            },
          )
        ],
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloc.stream,
          builder: (context, snapshot) {
            if (bloc.state is PersonErrorState) {
              return _ErrorWidget();
            } else if (bloc.state is PersonLoadingState) {
              return const CircularProgressIndicator();
            } else {
              return _ListWidget();
            }
          },
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.get(context);
    final textError = (bloc.state as PersonErrorState).error?.toString() ?? 'Unknow error';
    return Text(textError);
  }
}

class _ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.get(context);
    final listPerson = (bloc.state as PersonListState).data;

    if (listPerson.isEmpty) {
      return TextButton(
          onPressed: () {
            bloc.add(PersonEvent.fetch);
          },
          child: const Text('Fetch persons'));
    }

    return ListView.builder(
      itemCount: listPerson.length,
      itemBuilder: (context, index) {
        final item = listPerson[index];
        return ListTile(
          title: Text(item.name),
          subtitle: Text(item.isOlder ? 'Maior' : 'Menor' ' de idade'),
        );
      },
    );
  }
}
