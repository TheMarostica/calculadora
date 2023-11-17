import 'package:calculadora/src/theme/theme.dart';
import 'package:calculadora/src/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

sealed class ButtonClick {
  final String value;

  ButtonClick(this.value);
}

class CommonButtonClick extends ButtonClick {
  CommonButtonClick(super.value);
}

class EqualsButtonClick extends ButtonClick {
  EqualsButtonClick(super.value);
}

class ClearButtonClick extends ButtonClick {
  ClearButtonClick(super.value);
}

class ClearEntryButtonClick extends ButtonClick {
  ClearEntryButtonClick(super.value);
}

class ThemeButtonClick extends ButtonClick {
  ThemeButtonClick(super.value);
}

class ButtonHub extends StatelessWidget {
  final void Function(ButtonClick click) onButtonClick;
  
  const ButtonHub({super.key, required this.onButtonClick});


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 4,
      children: <Widget>[
        Button(
          value: '%',
          color: Theme.of(context).colorScheme.onPrimary,
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: 'CE',
          color: Theme.of(context).colorScheme.onPrimary,
          onTap: (value) => onButtonClick(ClearEntryButtonClick(value)),
        ),
        Button(
          value: 'C',
          color: Theme.of(context).colorScheme.onPrimary,
          onTap: (value) => onButtonClick(ClearButtonClick(value)),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: IconButton(
              // icon: const Icon(Icons.wb_sunny_outlined),
              icon: Visibility(
                visible: Provider.of<ThemeProvider>(context).themeData == lightMode,
                replacement: const Icon(Icons.wb_sunny_outlined),
                child: const Icon(Icons.wb_sunny_sharp), 
              ),
              color: Theme.of(context).colorScheme.tertiary,
              iconSize: 40,
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
            ),
          ),
        ),
        // Button(
        //   value: '', 
        //   color: Theme.of(context).colorScheme.primary,
        //   onTap: (value) => onButtonClick(ThemeButtonClick(value)),
        // ),
        Button(
          value: '7',
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '8',
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '9',
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '/',
          color: Theme.of(context).colorScheme.onPrimary,
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '4',
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '5',
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '6',
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '*',
          color: Theme.of(context).colorScheme.onPrimary,
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '1',
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '2',
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '3',
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '+',
          color: Theme.of(context).colorScheme.onPrimary,
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '-',
          color: Theme.of(context).colorScheme.onPrimary,
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '0',
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '.',
          color: Theme.of(context).colorScheme.onPrimary,
          onTap: (value) => onButtonClick(CommonButtonClick(value)),
        ),
        Button(
          value: '=',
          color: Theme.of(context).colorScheme.onTertiary,
          onTap: (value) => onButtonClick(EqualsButtonClick(value)),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  final String value;
  final Color? color;
  final void Function(String value)? onTap;
  const Button({super.key, required this.value, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).colorScheme.primaryContainer;
    return Material(
      color: color,
      child: InkWell(
        onTap: onTap == null ? null : () => onTap!(value),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(
              value,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
      ),
    );
  }
}