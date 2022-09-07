class ApartmentIndex {
  Metadata? metadata;
  List<ApartmentObject>? objects;

  ApartmentIndex({
    this.metadata,
    this.objects,
  });

  ApartmentIndex.fromJson(Map<String, dynamic> json) {
    metadata = json['Metadata'] != null ? Metadata.fromJson(json['Metadata']) : null;
    if (json['Objects'] != null) {
      objects = <ApartmentObject>[];
      json['Objects'].forEach((v) {
        objects!.add(ApartmentObject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metadata != null) {
      data['Metadata'] = metadata!.toJson();
    }
    if (objects != null) {
      data['Objects'] = objects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  String? objectType;
  String? omschrijving;
  String? titel;

  Metadata({this.objectType, this.omschrijving, this.titel});

  Metadata.fromJson(Map<String, dynamic> json) {
    objectType = json['ObjectType'];
    omschrijving = json['Omschrijving'];
    titel = json['Titel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ObjectType'] = objectType;
    data['Omschrijving'] = omschrijving;
    data['Titel'] = titel;
    return data;
  }
}

class ApartmentObject {
  String? aangebodenSindsTekst;
  String? aanmeldDatum;
  int? aantalKamers;
  String? aanvaarding;
  String? adres;
  int? afstand;
  String? bronCode;
  String? foto;
  String? fotoLarge;
  String? fotoLargest;
  String? fotoMedium;
  String? fotoSecure;
  int? globalId;
  String? groupByObjectType;
  bool? heeft360GradenFoto;
  bool? heeftBrochure;
  bool? heeftOpenhuizenTopper;
  bool? heeftOverbruggingsgrarantie;
  bool? heeftPlattegrond;
  bool? heeftTophuis;
  bool? heeftVeiling;
  bool? heeftVideo;
  String? id;
  bool? indProjectObjectType;
  bool? isSearchable;
  bool? isVerhuurd;
  bool? isVerkocht;
  bool? isVerkochtOfVerhuurd;
  int? koopprijs;
  String? koopprijsFormaat;
  int? koopprijsTot;
  int? makelaarId;
  String? makelaarNaam;
  String? mobileURL;
  List<String>? openHuis;
  int? oppervlakte;
  int? perceeloppervlakte;
  String? postcode;
  String? prijsGeformatteerdHtml;
  String? prijsGeformatteerdTextHuur;
  String? prijsGeformatteerdTextKoop;
  List<String>? producten;
  String? publicatieDatum;
  int? publicatieStatus;
  int? typeProject;
  String? uRL;
  String? verkoopStatus;
  double? wGS84X;
  double? wGS84Y;
  int? woonOppervlakteTot;
  int? woonoppervlakte;
  String? woonplaats;
  List<int>? zoekType;

  ApartmentObject(
      {this.aangebodenSindsTekst,
      this.aanmeldDatum,
      this.aantalKamers,
      this.aanvaarding,
      this.adres,
      this.afstand,
      this.bronCode,
      this.foto,
      this.fotoLarge,
      this.fotoLargest,
      this.fotoMedium,
      this.fotoSecure,
      this.globalId,
      this.groupByObjectType,
      this.heeft360GradenFoto,
      this.heeftBrochure,
      this.heeftOpenhuizenTopper,
      this.heeftOverbruggingsgrarantie,
      this.heeftPlattegrond,
      this.heeftTophuis,
      this.heeftVeiling,
      this.heeftVideo,
      this.id,
      this.indProjectObjectType,
      this.isSearchable,
      this.isVerhuurd,
      this.isVerkocht,
      this.isVerkochtOfVerhuurd,
      this.koopprijs,
      this.koopprijsFormaat,
      this.koopprijsTot,
      this.makelaarId,
      this.makelaarNaam,
      this.mobileURL,
      this.openHuis,
      this.oppervlakte,
      this.perceeloppervlakte,
      this.postcode,
      this.prijsGeformatteerdHtml,
      this.prijsGeformatteerdTextHuur,
      this.prijsGeformatteerdTextKoop,
      this.producten,
      this.publicatieDatum,
      this.publicatieStatus,
      this.typeProject,
      this.uRL,
      this.verkoopStatus,
      this.wGS84X,
      this.wGS84Y,
      this.woonOppervlakteTot,
      this.woonoppervlakte,
      this.woonplaats,
      this.zoekType});

  ApartmentObject.fromJson(Map<String, dynamic> json) {
    aangebodenSindsTekst = json['AangebodenSindsTekst'];
    aanmeldDatum = json['AanmeldDatum'];
    aantalKamers = json['AantalKamers'];
    aanvaarding = json['Aanvaarding'];
    adres = json['Adres'];
    afstand = json['Afstand'];
    bronCode = json['BronCode'];
    foto = json['Foto'];
    fotoLarge = json['FotoLarge'];
    fotoLargest = json['FotoLargest'];
    fotoMedium = json['FotoMedium'];
    fotoSecure = json['FotoSecure'];
    globalId = json['GlobalId'];
    groupByObjectType = json['GroupByObjectType'];
    heeft360GradenFoto = json['Heeft360GradenFoto'];
    heeftBrochure = json['HeeftBrochure'];
    heeftOpenhuizenTopper = json['HeeftOpenhuizenTopper'];
    heeftOverbruggingsgrarantie = json['HeeftOverbruggingsgrarantie'];
    heeftPlattegrond = json['HeeftPlattegrond'];
    heeftTophuis = json['HeeftTophuis'];
    heeftVeiling = json['HeeftVeiling'];
    heeftVideo = json['HeeftVideo'];
    id = json['Id'];
    indProjectObjectType = json['IndProjectObjectType'];
    isSearchable = json['IsSearchable'];
    isVerhuurd = json['IsVerhuurd'];
    isVerkocht = json['IsVerkocht'];
    isVerkochtOfVerhuurd = json['IsVerkochtOfVerhuurd'];
    koopprijs = json['Koopprijs'];
    koopprijsFormaat = json['KoopprijsFormaat'];
    koopprijsTot = json['KoopprijsTot'];
    makelaarId = json['MakelaarId'];
    makelaarNaam = json['MakelaarNaam'];
    mobileURL = json['MobileURL'];
    openHuis = json['OpenHuis'].cast<String>();
    oppervlakte = json['Oppervlakte'];
    perceeloppervlakte = json['Perceeloppervlakte'];
    postcode = json['Postcode'];
    prijsGeformatteerdHtml = json['PrijsGeformatteerdHtml'];
    prijsGeformatteerdTextHuur = json['PrijsGeformatteerdTextHuur'];
    prijsGeformatteerdTextKoop = json['PrijsGeformatteerdTextKoop'];
    producten = json['Producten'].cast<String>();
    publicatieDatum = json['PublicatieDatum'];
    publicatieStatus = json['PublicatieStatus'];
    typeProject = json['TypeProject'];
    uRL = json['URL'];
    verkoopStatus = json['VerkoopStatus'];
    wGS84X = json['WGS84_X'];
    wGS84Y = json['WGS84_Y'];
    woonOppervlakteTot = json['WoonOppervlakteTot'];
    woonoppervlakte = json['Woonoppervlakte'];
    woonplaats = json['Woonplaats'];
    zoekType = json['ZoekType'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AangebodenSindsTekst'] = aangebodenSindsTekst;
    data['AanmeldDatum'] = aanmeldDatum;
    data['AantalKamers'] = aantalKamers;
    data['Aanvaarding'] = aanvaarding;
    data['Adres'] = adres;
    data['Afstand'] = afstand;
    data['BronCode'] = bronCode;
    data['Foto'] = foto;
    data['FotoLarge'] = fotoLarge;
    data['FotoLargest'] = fotoLargest;
    data['FotoMedium'] = fotoMedium;
    data['FotoSecure'] = fotoSecure;
    data['GlobalId'] = globalId;
    data['GroupByObjectType'] = groupByObjectType;
    data['Heeft360GradenFoto'] = heeft360GradenFoto;
    data['HeeftBrochure'] = heeftBrochure;
    data['HeeftOpenhuizenTopper'] = heeftOpenhuizenTopper;
    data['HeeftOverbruggingsgrarantie'] = heeftOverbruggingsgrarantie;
    data['HeeftPlattegrond'] = heeftPlattegrond;
    data['HeeftTophuis'] = heeftTophuis;
    data['HeeftVeiling'] = heeftVeiling;
    data['HeeftVideo'] = heeftVideo;
    data['Id'] = id;
    data['IndProjectObjectType'] = indProjectObjectType;
    data['IsSearchable'] = isSearchable;
    data['IsVerhuurd'] = isVerhuurd;
    data['IsVerkocht'] = isVerkocht;
    data['IsVerkochtOfVerhuurd'] = isVerkochtOfVerhuurd;
    data['Koopprijs'] = koopprijs;
    data['KoopprijsFormaat'] = koopprijsFormaat;
    data['KoopprijsTot'] = koopprijsTot;
    data['MakelaarId'] = makelaarId;
    data['MakelaarNaam'] = makelaarNaam;
    data['MobileURL'] = mobileURL;
    data['OpenHuis'] = openHuis;
    data['Oppervlakte'] = oppervlakte;
    data['Perceeloppervlakte'] = perceeloppervlakte;
    data['Postcode'] = postcode;
    data['PrijsGeformatteerdHtml'] = prijsGeformatteerdHtml;
    data['PrijsGeformatteerdTextHuur'] = prijsGeformatteerdTextHuur;
    data['PrijsGeformatteerdTextKoop'] = prijsGeformatteerdTextKoop;
    data['Producten'] = producten;
    data['PublicatieDatum'] = publicatieDatum;
    data['PublicatieStatus'] = publicatieStatus;
    data['TypeProject'] = typeProject;
    data['URL'] = uRL;
    data['VerkoopStatus'] = verkoopStatus;
    data['WGS84_X'] = wGS84X;
    data['WGS84_Y'] = wGS84Y;
    data['WoonOppervlakteTot'] = woonOppervlakteTot;
    data['Woonoppervlakte'] = woonoppervlakte;
    data['Woonplaats'] = woonplaats;
    data['ZoekType'] = zoekType;
    return data;
  }
}
