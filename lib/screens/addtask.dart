import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'package:login_app/api%20_codes/apitasks.dart';
import 'package:login_app/colours.dart';
import 'package:login_app/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class addtaskpage extends StatefulWidget {
  @override
  _addtaskpageState createState() => _addtaskpageState();
}

class _addtaskpageState extends State<addtaskpage> {
  var taskcontroller = TextEditingController();
  bool isInasyncall = false;
  var _states = [
    'Ariana',
    'Beja',
    'BenArous',
    'Bizerte',
    'Gabes',
    'Gafsa',
    'Jendouba',
    'Kairouan',
    'Kasserine',
    'Kebili',
    'Kef',
    'Mahdia',
    'Manouba',
    'Medenine',
    'Monastir',
    'Nabeul',
    'Sfax',
    'SidiBouzid',
    'Siliana',
    'Sousse',
    'Tataouine',
    'Tozeur',
    'Tunis',
    'Zaghouan',
  ];
  var RegionsAriana = [
    'Ariana Ville',
    'Soukra',
    'Ettadhamen',
    'Raoued',
    'Mnihla',
    'Kalaat el-Andalous',
    'Sidi Thabet'
  ];
  var RegionsBeja = [
    'Béja Nord	',
    ' Nefza	',
    ' Medjez el-Bab',
    'Béja Sud	',
    ' Testour	',
    'Teboursouk',
    'Amdoun',
    'Goubellat',
    'Thibar'
  ];
  var RegionsBenArous = [
    'El Mourouj,Fouchana',
    'Mornag',
    'Mohamedia',
    'Radès',
    'Medina Jedida',
    'Hammam Lif',
    'Ben Arous',
    'Ezzahra',
    'Bou Mhel el-Bassatine',
    'Hammam Chott',
    'Mégrine'
  ];
  var RegionsBizerte = [
    'Bizerte Nord',
    'Menzel Bourguiba',
    'Ras Jebel',
    'Mateur',
    'Bizerte Sud',
    'Sejnane',
    'Menzel Jemil',
    ' Joumine',
    ' Ghezala',
    ' El Alia',
    'Zarzouna',
    'Tinja',
    'Ghar El Melh',
    'Utique'
  ];
  var RegionsGabes = [
    'El Hamma',
    'Gabes Sud',
    'Mareth',
    'Gabes Médina',
    'Gabes Ouest',
    'Metouia',
    'Ghannouch',
    'Nouvelle Matmata',
    'Menzel El Habib',
    'Matmata'
  ];
  var RegionsGafsa = [
    'Gafsa Sud',
    'Metlaoui',
    'Sened',
    'El Ksar',
    'Moulares',
    'Redeyef',
    'El Guettar',
    'Belkhir',
    'Mdhilla',
    'Gafsa Nord',
    'Sidi Aïch'
  ];
  var RegionsJendouba = [
    'Jendouba Sud',
    'Ghardimaou',
    'Fernana',
    'Tabarka',
    'Jendouba Nord',
    'Balta-Bou Aouane',
    'Aïn Draham',
    'Bou Salem',
    'Oued Meliz'
  ];
  var RegionsKairouan = [
    'Kairouan Nord',
    'Kairouan Sud',
    'Bou Hajla',
    'Sbikha',
    'Haffouz',
    'Nasrallah',
    'Oueslatia',
    'Hajeb El Ayoun',
    'Chebika',
    'El Alâa',
    'Echrarda'
  ];
  var RegionsKasserine = [
    'Sbeitla',
    'Kasserine Nord',
    'Feriana',
    'Sbiba',
    'Foussana',
    'Thala',
    'Majel Bel Abbes',
    'Kasserine Sud',
    'Ezzouhour',
    'El Ayoun',
    'Hassi El Ferid',
    'Jedelienne',
    'Haidra'
  ];
  var RegionsKebili = [
    'Kebili Sud',
    'Kebili Nord',
    'Souk Lahad',
    'Douz Nord',
    'Douz Sud',
    'Faouar'
  ];
  var RegionsKef = [
    'Kef Est',
    'Dahmani',
    'Tajerouine',
    'Kef Ouest',
    'Nebeur',
    'Sers',
    'Sakiet Sidi Youssef',
    'El Ksour',
    'Kalaat Senan',
    'Jérissa',
    'Kalâat Khasba'
  ];
  var RegionsMahdia = [
    'Mahdia',
    'Ksour Essef',
    'Essouassi',
    'El Jem',
    'Sidi Alouane',
    'Bou Merdes',
    'Chorbane',
    'Chebba',
    'Ouled Chamekh',
    'Mellouleche',
    'Hebira'
  ];

  var RegionsManouba = [
    'Douar Hicher',
    'Oued Ellil',
    'La Manouba',
    'Tebourba',
    'Djedeida',
    'Mornaguia',
    'El Batan',
    'Borj El Amri'
  ];

  var RegionsMedenine = [
    'Zarzis',
    'Ben Gardane',
    'Djerba - Houmt Souk',
    'Djerba - Midoun',
    'Medenine Nord',
    'Medenine Sud',
    'Beni Khedache',
    'Djerba - Ajim',
    'Sidi Makhlouf'
  ];
  var RegionsMonastir = [
    'Monastir',
    'Moknine',
    'Jemmal',
    'Ksar Hellal',
    'Téboulba',
    'Ksibet el-Médiouni',
    'Bembla',
    'Zéramdine',
    'Sayada-Lamta-Bou Hajar',
    'Sahline',
    'Ouerdanine',
    'Bekalta',
    'Beni Hassen'
  ];
  var RegionsNabeul = [
    'Hammamet',
    'Korba',
    'Nabeul',
    'Menzel Temime',
    'Grombalia',
    'Kelibia',
    'Soliman',
    'Dar Chaabane El Fehri',
    'El Haouaria',
    'Beni Khiar',
    'Beni Khalled',
    'Menzel Bouzelfa',
    'Bou Argoub',
    'El Mida',
    'Takelsa',
    'Hammam Ghezeze'
  ];
  var RegionsSfax = [
    'Sfax Ville',
    'Sfax Ouest',
    'Sfax Sud',
    'Sakiet Eddaier',
    'Sakiet Ezzit',
    'Bir Ali Ben Khalifa',
    'Thyna',
    'Jebiniana',
    'El Hencha',
    'Agareb',
    ' Menzel Chaker',
    'Mahres',
    'Skhira',
    'El Amra',
    'Graiba',
    'Kerkennah'
  ];
  var RegionsSidiBouzid = [
    'Sidi Bouzid Ouest',
    'Regueb',
    'Sidi Bouzid Est',
    'Jilma',
    'Bir El Hafey',
    'Sidi Ali Ben Aoun',
    'Menzel Bouzaiane',
    'Mezzouna',
    'Meknassy',
    'Ouled Haffouz',
    'Souk Jedid',
    'Cebbala Ouled Asker'
  ];
  var RegionsSiliana = [
    'Makthar',
    'Rouhia',
    'Siliana Sud',
    'Siliana Nord',
    'El Krib',
    'Bou Arada',
    'Gaafour',
    'Kesra',
    'Sidi Bou Rouis',
    'Bargou',
    'El Aroussa'
  ];
  var RegionsSousse = [
    'Msaken',
    'Sousse Riadh',
    'Sousse Jawhara',
    'Kalaa Kebira',
    'Sousse Sidi Abdelhamid',
    'Enfida',
    'Hammam Sousse',
    'Sousse Medina',
    'Kalaa Seghira',
    'Akouda',
    'Bouficha',
    'Sidi Bou Ali',
    'Kondar',
    'Sidi El Hani',
    'Hergla'
  ];
  var RegionsTataouine = [
    'Tataouine Nord',
    'Tataouine Sud',
    'Ghomrassen',
    'Smâr',
    'Remada',
    'Bir Lahmar',
    'Dehiba'
  ];
  var RegionsTozeur = ['Tozeur', 'Degache', 'Nefta', 'Tameghza', 'Hazoua'];
  var RegionsTunis = [
    'Hrairia',
    'El Kabaria',
    'Sidi Hassine',
    'La Marsa',
    'Le Bardo',
    'El Omrane supérieur',
    'Le Kram',
    'El Menzah',
    'El Omrane',
    'Ezzouhour',
    'Bab El Bhar',
    'Cité El Khadra',
    'Séjoumi',
    'El Ouardia',
    'Bab Souika',
    'Sidi El Béchir',
    'La Goulette',
    'Médina',
    'Djebel Jelloud',
    'Ettahrir',
    'Carthage'
  ];
  var RegionsZaghouan = [
    'El Fahs',
    'Zaghouan',
    'Nadhour',
    'Bir Mcherga',
    'Zriba',
    'Saouaf'
  ];

  var risk = ['GRELE', 'INCENDIE', 'MULTIRISQUES SERRES'];
  List<String> regions = [];

  @override
  void initState() {
    super.initState();
    regions = RegionsTunis;
  }

  int selectedRadio;
  /* @override
  void initStateRadio() {
    super.initStateRadio();
    selectedRadio=0;
  }
*/
  var _currentItemSelected = 'Tunis';
  var _currentRegionSelected = 'Hrairia';
  var _currentRiskSelected = 'GRELE';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ajoutez votre parcelle'),
        backgroundColor: colorPrimary,
      ),
      body: ModalProgressHUD(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<String>(
                    items: _states.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      //mycodeof regions which wil be applied on the second dropdown
                      _onDropDownItemSelected(newValueSelected);
                    },
                    value: _currentItemSelected,
                  ),

                  //SizedBox(height: 40),
                  DropdownButton<String>(
                    items: regions.map((String dropDownStringItemRegion) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItemRegion,
                        child: Text(dropDownStringItemRegion),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      //mycodeof regions which wil be applied on the second dropdown
                      //_onDropDownItemSelected(newValueSelected);
                    },
                    value: _currentRegionSelected,
                  ),
                ],
              ),
              /*Text('inchallah i will :',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  )),*/
              SizedBox(height: 20),
              t3EditTextField('Adresse', taskcontroller, isPassword: false),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Assurance contre :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        //fontWeight: FontWeight.bold*
                      )),
                  DropdownButton<String>(
                    items: risk.map((String dropDownStringItemRisk) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItemRisk,
                        child: Text(dropDownStringItemRisk),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      //mycodeof regions which wil be applied on the second dropdown
                      _onDropDownRiskSelected(newValueSelected);
                    },
                    value: _currentRiskSelected,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(21, 0, 16, 16),
                    child: Text('Nature de production',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                  ),
                ],
              ),
              t3EditTextField('Nature de production', taskcontroller,
                  isPassword: false),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(21, 0, 16, 16),
                    child: Text('Rendement attendu',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                  ),
                ],
              ),
              t3EditTextField('Rendement attendu ', taskcontroller,
                  isPassword: false),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(21, 0, 16, 16),
                    child: Text('Prix de ventes',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                  ),
                ],
              ),
              t3EditTextField('Prix de ventes ', taskcontroller,
                  isPassword: false),
              SizedBox(height: 20),
              t3EditTextField('Commentaire...', taskcontroller,
                  isPassword: false),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: t3Appbutton(
                  textContent: 'add',
                  onPressed: () {
                    setState(() {
                      isInasyncall = true;
                    });
                    var body = {"description": taskcontroller.text.toString()};
                    ApiTask.addnewtask(body).then((statusCode) {
                      setState(() {
                        isInasyncall = false;
                      });
                      if (statusCode == 200) {
                        Navigator.pop(context, 'added');
                      } else {
                        showMyDialog(
                          context,
                          'ERROR',
                          'SORRY SOMETHING WENT WRONG !',
                          () {
                            Navigator.pop(context);
                          },
                        );
                      }
                    });
                  },
                ),
              )
            ],
          ),
        ),
        inAsyncCall: isInasyncall,
        opacity: 0.1,
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      //this.regions = RegionsTunis;
      //this._curretItemSelected = newValueSelected ;
      //fonction switch
      //chaque state recoit ses propres regions
      switch (newValueSelected) {
        case "Ariana":
          {
            this.regions = RegionsAriana;
            this._currentRegionSelected = RegionsAriana[0];
          }
          break;

        case "Beja":
          {
            this.regions = this.RegionsBeja;
            this._currentRegionSelected = RegionsBeja[0];
          }
          break;

        case "BenArous":
          {
            this.regions = RegionsBenArous;
            this._currentRegionSelected = RegionsBenArous[0];
          }
          break;

        case "Bizerte":
          {
            this.regions = RegionsBizerte;
            this._currentRegionSelected = RegionsBizerte[0];
          }
          break;

        case "Gabes":
          {
            this.regions = RegionsGabes;
            this._currentRegionSelected = RegionsGabes[0];
          }
          break;

        case "Gafsa":
          {
            this.regions = RegionsGafsa;
            this._currentRegionSelected = RegionsGafsa[0];
          }
          break;

        case "Jendouba":
          {
            this.regions = RegionsJendouba;
            this._currentRegionSelected = RegionsJendouba[0];
          }
          break;

        case "Kairouan":
          {
            this.regions = RegionsKairouan;
            this._currentRegionSelected = RegionsKairouan[0];
          }
          break;

        case "Kasserine":
          {
            this.regions = RegionsKasserine;
            this._currentRegionSelected = RegionsKasserine[0];
          }
          break;

        case "Kebili":
          {
            this.regions = RegionsKebili;
            this._currentRegionSelected = RegionsKebili[0];
          }
          break;

        case "Kef":
          {
            this.regions = RegionsKef;
            this._currentRegionSelected = RegionsKef[0];
          }
          break;

        case "Mahdia":
          {
            this.regions = RegionsMahdia;
            this._currentRegionSelected = RegionsMahdia[0];
          }
          break;

        case "Manouba":
          {
            this.regions = RegionsManouba;
            this._currentRegionSelected = RegionsManouba[0];
          }
          break;

        case "Medenine":
          {
            this.regions = RegionsMedenine;
            this._currentRegionSelected = RegionsMedenine[0];
          }
          break;

        case "Monastir":
          {
            this.regions = RegionsMonastir;
            this._currentRegionSelected = RegionsMonastir[0];
          }
          break;

        case "Nabeul":
          {
            this.regions = RegionsNabeul;
            this._currentRegionSelected = RegionsNabeul[0];
          }
          break;
        case "Sfax":
          {
            this.regions = RegionsSfax;
            this._currentRegionSelected = RegionsSfax[0];
          }

          break;
        case "SidiBouzid":
          {
            this.regions = RegionsSidiBouzid;
            this._currentRegionSelected = RegionsSidiBouzid[0];
          }

          break;
        case "Siliana":
          {
            this.regions = RegionsSiliana;
            this._currentRegionSelected = RegionsSiliana[0];
          }
          break;
        case "Sousse":
          {
            this.regions = RegionsSousse;
            this._currentRegionSelected = RegionsSousse[0];
          }

          break;
        case "Tataouine":
          {
            this.regions = RegionsTataouine;
            this._currentRegionSelected = RegionsTataouine[0];
          }
          break;
        case "Tozeur":
          {
            this.regions = RegionsTozeur;
            this._currentRegionSelected = RegionsTozeur[0];
          }
          break;

        case "Tunis":
          {
            this.regions = RegionsTunis;
            this._currentRegionSelected = RegionsTunis[0];
          }
          break;
        case "Zaghouan":
          {
            this.regions = RegionsZaghouan;
            this._currentRegionSelected = RegionsZaghouan[0];
          }
          break;

          this._currentRegionSelected = newValueSelected;
      }
      this._currentItemSelected = newValueSelected;
    });
  }

  void _onDropDownRiskSelected(String newValueSelected) {
    setState(() {
      switch (newValueSelected) {
        case "INCENDIE":
          {
            ButtonBar(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: 2,
                  activeColor: t3_edit_background,
                  onChanged: (val) {
                    print("Radio $val");
                  },
                )
              ],
            );
            ButtonBar(
              children: <Widget>[
                Radio(
                  value: 2,
                  groupValue: 2,
                  activeColor: t3_edit_background,
                )
              ],
            );
          }
          break;

        case "GRELE":
          {
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(21, 0, 16, 16),
                  child: Text('les risques possibles',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
              ],
            ));
            t3EditTextField('les risques possibles ', taskcontroller,
                isPassword: false);
          }
          break;
        case "MULTIRISQUES SERRES":
          {
            this.regions = this.RegionsBeja;
            this._currentRegionSelected = RegionsBeja[0];
          }
          break;

          this._currentRiskSelected = newValueSelected;
      }
    });
  }
}
/*@override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('RegionsTunis', RegionsTunis));
  }*/
