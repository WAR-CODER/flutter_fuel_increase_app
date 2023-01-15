import 'package:flutter/material.dart';
import 'package:fuel_app/pages/model.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/home.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final myController = TextEditingController();
  final amountController = TextEditingController();
  late String problemItem;
  bool _showPetrolPrice = true;
  bool _showDieselPrice = true;
  bool _notifyChanges = false;

  double amount = 0;
  // get newText => 'R/liter';

  // get keyboardType => null;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _displayLatestValue() {
    setState(() {
      myController.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FuelPriceModel>(
        builder: (context, fuelModel, child)
    {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text('Settings'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 16.0,
            ),
            _buildToggleRow(context, 'Show Diesel Price', fuelModel.getShowDiesel,
                _updateShowDiesel),

            _buildToggleRow(context, 'Show Petrol Price', fuelModel.getShowPetrol,
               _updateShowPetrol ),
            _buildToggleRow(context, 'Notify Price Changes', _notifyChanges,
                _updateNotifyChanges),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Petrol',
                hintText: '${fuelModel.getPetrolPricePerLitre}',
                suffixText: 'R/litre',
              ),
                onChanged: (value) {
                  fuelModel.setPetrolPricePerLitre = double.parse(value);
                }
            ),
            TextField(

              decoration: InputDecoration(
                filled: true,
                labelText: 'Diesel',
                hintText: '${fuelModel.getDieselPricePerLitre}',
                suffixText: 'R/litre',
              ),
                onChanged: (value) {
                  fuelModel.setDieselPricePerLitre = double.parse(value);
                }),
            // TextField(
            //   controller: myController,
            // ),
            // TextField(
            //
          ],

        ),


      );
    });
  }
  // void addedValues(Item item){
  //   print('amount added on $item');
  // }

  _updateShowDiesel(bool value) {
    setState(() {
      _showDieselPrice = value;
    });
  }

  _updateShowPetrol(bool value) {
    setState(() {
      _showPetrolPrice = value;
    });
  }

  _updateNotifyChanges(bool value) {
    setState(() {
      _notifyChanges = value;
    });
  }


  Widget _buildToggleRow(BuildContext context, String label, bool initialValue,
      void Function(bool value) updateFunction) {
    // var cartModel = print('_SettingsViewState._buildToggleRow');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Switch(value: initialValue, onChanged: updateFunction),
        ],

      ),

    );
  }

}



