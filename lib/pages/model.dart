import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fuel_app/pages/settings.dart';
import 'package:provider/provider.dart';



class FuelPriceModel extends ChangeNotifier {
  double _petrolPricePerLitre = 21;
  double _dieselPricePerLitre = 22;

  bool _showPetrolPrice = true;
  bool _showDieselPrice = true;
  bool _notifyChanges = false;



  double get getPetrolPricePerLitre {
    return _petrolPricePerLitre;
  }


  bool get getNotifyChange{
    return _notifyChanges;

  }
  double get getDieselPricePerLitre {
    return _dieselPricePerLitre;
  }

  bool get getShowDiesel {
    return _showDieselPrice;
}
bool get getShowPetrol{
    return _showPetrolPrice;
}

  updateShowDiesel(bool value) {
      _showDieselPrice = value;
      notifyListeners();
    }
    updateNotifyChange(bool value){
    _notifyChanges = value;
    notifyListeners();
}

    updateShowPetrol(bool value){
    _showPetrolPrice = value;
    notifyListeners();
    }

  void incrementPetrolPrice(BuildContext context) {
    Provider.of<FuelPriceModel>(context, listen: false).getPetrolPricePerLitre;
    _petrolPricePerLitre++;
    notifyListeners();
  }

  void incrementDieselPrice(BuildContext context) {
    Provider.of<FuelPriceModel>(context, listen: false).getDieselPricePerLitre;
    _dieselPricePerLitre++;
    notifyListeners();
  }
  void notifyChanges(BuildContext context){
    Provider.of<FuelPriceModel>(context , listen: false).getNotifyChange;
    _notifyChanges;
    notifyListeners();
  }

  set setPetrolPricePerLitre(double value){
    _petrolPricePerLitre = value;
    notifyListeners();
  }

  set setDieselPricePerLitre(double value){
    _dieselPricePerLitre = value;
    notifyListeners();
  }



  _openSettingsView(BuildContext context, FuelPriceModel fuelPriceModel) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider.value(
              value: fuelPriceModel,
              child: const SettingsView()),
          fullscreenDialog: true),
    );
  }

}
