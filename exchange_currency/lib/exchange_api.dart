import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

class ExchangeApi {
  Future<ExchangeModule?> getData(String inCurrency) async {
    http.Response response = await http.get(Uri.parse(
        'https://v6.exchangerate-api.com/v6/7a6cd4869caf5075e178c3e8/latest/$inCurrency'));

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body);
        return ExchangeModule.fromJson(data);
      } catch (e) {
        print('Error decoding JSON: $e');
        return null;
      }
    } else {
      print('Failed to load Echange data. Status code: ${response.statusCode}');
      return null;
    }
  }
}

class ExchangeModule {
  String? result;
  String? documentation;
  String? termsOfUse;
  int? timeLastUpdateUnix;
  String? timeLastUpdateUtc;
  int? timeNextUpdateUnix;
  String? timeNextUpdateUtc;
  String? baseCode;
  ConversionRates? conversionRates;

  ExchangeModule(
      {this.result,
      this.documentation,
      this.termsOfUse,
      this.timeLastUpdateUnix,
      this.timeLastUpdateUtc,
      this.timeNextUpdateUnix,
      this.timeNextUpdateUtc,
      this.baseCode,
      this.conversionRates});

  ExchangeModule.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    documentation = json['documentation'];
    termsOfUse = json['terms_of_use'];
    timeLastUpdateUnix = json['time_last_update_unix'];
    timeLastUpdateUtc = json['time_last_update_utc'];
    timeNextUpdateUnix = json['time_next_update_unix'];
    timeNextUpdateUtc = json['time_next_update_utc'];
    baseCode = json['base_code'];
    conversionRates = json['conversion_rates'] != null
        ? new ConversionRates.fromJson(json['conversion_rates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['documentation'] = this.documentation;
    data['terms_of_use'] = this.termsOfUse;
    data['time_last_update_unix'] = this.timeLastUpdateUnix;
    data['time_last_update_utc'] = this.timeLastUpdateUtc;
    data['time_next_update_unix'] = this.timeNextUpdateUnix;
    data['time_next_update_utc'] = this.timeNextUpdateUtc;
    data['base_code'] = this.baseCode;
    if (this.conversionRates != null) {
      data['conversion_rates'] = this.conversionRates!.toJson();
    }
    return data;
  }
}

const List<String> currenciesList = [
  'aUD',
  'bRL',
  'cAD',
  'cNY',
  'eUR',
  'gBP',
  'hKD',
  'iDR',
  'iNR',
  'iLS',
  'iNR',
  'jPY',
  'mXN',
  'nOK',
  'nZD',
  'pKR',
  'pLN',
  'rON',
  'rUB',
  'sAR',
  'sEK',
  'sGD',
  'uSD',
  'zAR'
];

class ConversionRates {
  num? pKR;
  num? aED;
  num? aFN;
  num? aLL;
  num? aMD;
  num? aNG;
  num? aOA;
  num? aRS;
  num? aUD;
  num? aWG;
  num? aZN;
  num? bAM;
  num? bBD;
  num? bDT;
  num? bGN;
  num? bHD;
  num? bIF;
  num? bMD;
  num? bND;
  num? bOB;
  num? bRL;
  num? bSD;
  num? bTN;
  num? bWP;
  num? bYN;
  num? bZD;
  num? cAD;
  num? cDF;
  num? cHF;
  num? cLP;
  num? cNY;
  num? cOP;
  num? cRC;
  num? cUP;
  num? cVE;
  num? cZK;
  num? dJF;
  num? dKK;
  num? dOP;
  num? dZD;
  num? eGP;
  num? eRN;
  num? eTB;
  num? eUR;
  num? fJD;
  num? fKP;
  num? fOK;
  num? gBP;
  num? gEL;
  num? gGP;
  num? gHS;
  num? gIP;
  num? gMD;
  num? gNF;
  num? gTQ;
  num? gYD;
  num? hKD;
  num? hNL;
  num? hRK;
  num? hTG;
  num? hUF;
  num? iDR;
  num? iLS;
  num? iMP;
  num? iNR;
  num? iQD;
  num? iRR;
  num? iSK;
  num? jEP;
  num? jMD;
  num? jOD;
  num? jPY;
  num? kES;
  num? kGS;
  num? kHR;
  num? kID;
  num? kMF;
  num? kRW;
  num? kWD;
  num? kYD;
  num? kZT;
  num? lAK;
  num? lBP;
  num? lKR;
  num? lRD;
  num? lSL;
  num? lYD;
  num? mAD;
  num? mDL;
  num? mGA;
  num? mKD;
  num? mMK;
  num? mNT;
  num? mOP;
  num? mRU;
  num? mUR;
  num? mVR;
  num? mWK;
  num? mXN;
  num? mYR;
  num? mZN;
  num? nAD;
  num? nGN;
  num? nIO;
  num? nOK;
  num? nPR;
  num? nZD;
  num? oMR;
  num? pAB;
  num? pEN;
  num? pGK;
  num? pHP;
  num? pLN;
  num? pYG;
  num? qAR;
  num? rON;
  num? rSD;
  num? rUB;
  num? rWF;
  num? sAR;
  num? sBD;
  num? sCR;
  num? sDG;
  num? sEK;
  num? sGD;
  num? sHP;
  num? sLE;
  num? sLL;
  num? sOS;
  num? sRD;
  num? sSP;
  num? sTN;
  num? sYP;
  num? sZL;
  num? tHB;
  num? tJS;
  num? tMT;
  num? tND;
  num? tOP;
  num? tRY;
  num? tTD;
  num? tVD;
  num? tWD;
  num? tZS;
  num? uAH;
  num? uGX;
  num? uSD;
  num? uYU;
  num? uZS;
  num? vES;
  num? vND;
  num? vUV;
  num? wST;
  num? xAF;
  num? xCD;
  num? xDR;
  num? xOF;
  num? xPF;
  num? yER;
  num? zAR;
  num? zMW;
  num? zWL;

  ConversionRates(
      {this.pKR,
      this.aED,
      this.aFN,
      this.aLL,
      this.aMD,
      this.aNG,
      this.aOA,
      this.aRS,
      this.aUD,
      this.aWG,
      this.aZN,
      this.bAM,
      this.bBD,
      this.bDT,
      this.bGN,
      this.bHD,
      this.bIF,
      this.bMD,
      this.bND,
      this.bOB,
      this.bRL,
      this.bSD,
      this.bTN,
      this.bWP,
      this.bYN,
      this.bZD,
      this.cAD,
      this.cDF,
      this.cHF,
      this.cLP,
      this.cNY,
      this.cOP,
      this.cRC,
      this.cUP,
      this.cVE,
      this.cZK,
      this.dJF,
      this.dKK,
      this.dOP,
      this.dZD,
      this.eGP,
      this.eRN,
      this.eTB,
      this.eUR,
      this.fJD,
      this.fKP,
      this.fOK,
      this.gBP,
      this.gEL,
      this.gGP,
      this.gHS,
      this.gIP,
      this.gMD,
      this.gNF,
      this.gTQ,
      this.gYD,
      this.hKD,
      this.hNL,
      this.hRK,
      this.hTG,
      this.hUF,
      this.iDR,
      this.iLS,
      this.iMP,
      this.iNR,
      this.iQD,
      this.iRR,
      this.iSK,
      this.jEP,
      this.jMD,
      this.jOD,
      this.jPY,
      this.kES,
      this.kGS,
      this.kHR,
      this.kID,
      this.kMF,
      this.kRW,
      this.kWD,
      this.kYD,
      this.kZT,
      this.lAK,
      this.lBP,
      this.lKR,
      this.lRD,
      this.lSL,
      this.lYD,
      this.mAD,
      this.mDL,
      this.mGA,
      this.mKD,
      this.mMK,
      this.mNT,
      this.mOP,
      this.mRU,
      this.mUR,
      this.mVR,
      this.mWK,
      this.mXN,
      this.mYR,
      this.mZN,
      this.nAD,
      this.nGN,
      this.nIO,
      this.nOK,
      this.nPR,
      this.nZD,
      this.oMR,
      this.pAB,
      this.pEN,
      this.pGK,
      this.pHP,
      this.pLN,
      this.pYG,
      this.qAR,
      this.rON,
      this.rSD,
      this.rUB,
      this.rWF,
      this.sAR,
      this.sBD,
      this.sCR,
      this.sDG,
      this.sEK,
      this.sGD,
      this.sHP,
      this.sLE,
      this.sLL,
      this.sOS,
      this.sRD,
      this.sSP,
      this.sTN,
      this.sYP,
      this.sZL,
      this.tHB,
      this.tJS,
      this.tMT,
      this.tND,
      this.tOP,
      this.tRY,
      this.tTD,
      this.tVD,
      this.tWD,
      this.tZS,
      this.uAH,
      this.uGX,
      this.uSD,
      this.uYU,
      this.uZS,
      this.vES,
      this.vND,
      this.vUV,
      this.wST,
      this.xAF,
      this.xCD,
      this.xDR,
      this.xOF,
      this.xPF,
      this.yER,
      this.zAR,
      this.zMW,
      this.zWL});

  ConversionRates.fromJson(Map<String, dynamic> json) {
    pKR = json['PKR'];
    aED = json['AED'];
    aFN = json['AFN'];
    aLL = json['ALL'];
    aMD = json['AMD'];
    aNG = json['ANG'];
    aOA = json['AOA'];
    aRS = json['ARS'];
    aUD = json['AUD'];
    aWG = json['AWG'];
    aZN = json['AZN'];
    bAM = json['BAM'];
    bBD = json['BBD'];
    bDT = json['BDT'];
    bGN = json['BGN'];
    bHD = json['BHD'];
    bIF = json['BIF'];
    bMD = json['BMD'];
    bND = json['BND'];
    bOB = json['BOB'];
    bRL = json['BRL'];
    bSD = json['BSD'];
    bTN = json['BTN'];
    bWP = json['BWP'];
    bYN = json['BYN'];
    bZD = json['BZD'];
    cAD = json['CAD'];
    cDF = json['CDF'];
    cHF = json['CHF'];
    cLP = json['CLP'];
    cNY = json['CNY'];
    cOP = json['COP'];
    cRC = json['CRC'];
    cUP = json['CUP'];
    cVE = json['CVE'];
    cZK = json['CZK'];
    dJF = json['DJF'];
    dKK = json['DKK'];
    dOP = json['DOP'];
    dZD = json['DZD'];
    eGP = json['EGP'];
    eRN = json['ERN'];
    eTB = json['ETB'];
    eUR = json['EUR'];
    fJD = json['FJD'];
    fKP = json['FKP'];
    fOK = json['FOK'];
    gBP = json['GBP'];
    gEL = json['GEL'];
    gGP = json['GGP'];
    gHS = json['GHS'];
    gIP = json['GIP'];
    gMD = json['GMD'];
    gNF = json['GNF'];
    gTQ = json['GTQ'];
    gYD = json['GYD'];
    hKD = json['HKD'];
    hNL = json['HNL'];
    hRK = json['HRK'];
    hTG = json['HTG'];
    hUF = json['HUF'];
    iDR = json['IDR'];
    iLS = json['ILS'];
    iMP = json['IMP'];
    iNR = json['INR'];
    iQD = json['IQD'];
    iRR = json['IRR'];
    iSK = json['ISK'];
    jEP = json['JEP'];
    jMD = json['JMD'];
    jOD = json['JOD'];
    jPY = json['JPY'];
    kES = json['KES'];
    kGS = json['KGS'];
    kHR = json['KHR'];
    kID = json['KID'];
    kMF = json['KMF'];
    kRW = json['KRW'];
    kWD = json['KWD'];
    kYD = json['KYD'];
    kZT = json['KZT'];
    lAK = json['LAK'];
    lBP = json['LBP'];
    lKR = json['LKR'];
    lRD = json['LRD'];
    lSL = json['LSL'];
    lYD = json['LYD'];
    mAD = json['MAD'];
    mDL = json['MDL'];
    mGA = json['MGA'];
    mKD = json['MKD'];
    mMK = json['MMK'];
    mNT = json['MNT'];
    mOP = json['MOP'];
    mRU = json['MRU'];
    mUR = json['MUR'];
    mVR = json['MVR'];
    mWK = json['MWK'];
    mXN = json['MXN'];
    mYR = json['MYR'];
    mZN = json['MZN'];
    nAD = json['NAD'];
    nGN = json['NGN'];
    nIO = json['NIO'];
    nOK = json['NOK'];
    nPR = json['NPR'];
    nZD = json['NZD'];
    oMR = json['OMR'];
    pAB = json['PAB'];
    pEN = json['PEN'];
    pGK = json['PGK'];
    pHP = json['PHP'];
    pLN = json['PLN'];
    pYG = json['PYG'];
    qAR = json['QAR'];
    rON = json['RON'];
    rSD = json['RSD'];
    rUB = json['RUB'];
    rWF = json['RWF'];
    sAR = json['SAR'];
    sBD = json['SBD'];
    sCR = json['SCR'];
    sDG = json['SDG'];
    sEK = json['SEK'];
    sGD = json['SGD'];
    sHP = json['SHP'];
    sLE = json['SLE'];
    sLL = json['SLL'];
    sOS = json['SOS'];
    sRD = json['SRD'];
    sSP = json['SSP'];
    sTN = json['STN'];
    sYP = json['SYP'];
    sZL = json['SZL'];
    tHB = json['THB'];
    tJS = json['TJS'];
    tMT = json['TMT'];
    tND = json['TND'];
    tOP = json['TOP'];
    tRY = json['TRY'];
    tTD = json['TTD'];
    tVD = json['TVD'];
    tWD = json['TWD'];
    tZS = json['TZS'];
    uAH = json['UAH'];
    uGX = json['UGX'];
    uSD = json['USD'];
    uYU = json['UYU'];
    uZS = json['UZS'];
    vES = json['VES'];
    vND = json['VND'];
    vUV = json['VUV'];
    wST = json['WST'];
    xAF = json['XAF'];
    xCD = json['XCD'];
    xDR = json['XDR'];
    xOF = json['XOF'];
    xPF = json['XPF'];
    yER = json['YER'];
    zAR = json['ZAR'];
    zMW = json['ZMW'];
    zWL = json['ZWL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PKR'] = this.pKR;
    data['AED'] = this.aED;
    data['AFN'] = this.aFN;
    data['ALL'] = this.aLL;
    data['AMD'] = this.aMD;
    data['ANG'] = this.aNG;
    data['AOA'] = this.aOA;
    data['ARS'] = this.aRS;
    data['AUD'] = this.aUD;
    data['AWG'] = this.aWG;
    data['AZN'] = this.aZN;
    data['BAM'] = this.bAM;
    data['BBD'] = this.bBD;
    data['BDT'] = this.bDT;
    data['BGN'] = this.bGN;
    data['BHD'] = this.bHD;
    data['BIF'] = this.bIF;
    data['BMD'] = this.bMD;
    data['BND'] = this.bND;
    data['BOB'] = this.bOB;
    data['BRL'] = this.bRL;
    data['BSD'] = this.bSD;
    data['BTN'] = this.bTN;
    data['BWP'] = this.bWP;
    data['BYN'] = this.bYN;
    data['BZD'] = this.bZD;
    data['CAD'] = this.cAD;
    data['CDF'] = this.cDF;
    data['CHF'] = this.cHF;
    data['CLP'] = this.cLP;
    data['CNY'] = this.cNY;
    data['COP'] = this.cOP;
    data['CRC'] = this.cRC;
    data['CUP'] = this.cUP;
    data['CVE'] = this.cVE;
    data['CZK'] = this.cZK;
    data['DJF'] = this.dJF;
    data['DKK'] = this.dKK;
    data['DOP'] = this.dOP;
    data['DZD'] = this.dZD;
    data['EGP'] = this.eGP;
    data['ERN'] = this.eRN;
    data['ETB'] = this.eTB;
    data['EUR'] = this.eUR;
    data['FJD'] = this.fJD;
    data['FKP'] = this.fKP;
    data['FOK'] = this.fOK;
    data['GBP'] = this.gBP;
    data['GEL'] = this.gEL;
    data['GGP'] = this.gGP;
    data['GHS'] = this.gHS;
    data['GIP'] = this.gIP;
    data['GMD'] = this.gMD;
    data['GNF'] = this.gNF;
    data['GTQ'] = this.gTQ;
    data['GYD'] = this.gYD;
    data['HKD'] = this.hKD;
    data['HNL'] = this.hNL;
    data['HRK'] = this.hRK;
    data['HTG'] = this.hTG;
    data['HUF'] = this.hUF;
    data['IDR'] = this.iDR;
    data['ILS'] = this.iLS;
    data['IMP'] = this.iMP;
    data['INR'] = this.iNR;
    data['IQD'] = this.iQD;
    data['IRR'] = this.iRR;
    data['ISK'] = this.iSK;
    data['JEP'] = this.jEP;
    data['JMD'] = this.jMD;
    data['JOD'] = this.jOD;
    data['JPY'] = this.jPY;
    data['KES'] = this.kES;
    data['KGS'] = this.kGS;
    data['KHR'] = this.kHR;
    data['KID'] = this.kID;
    data['KMF'] = this.kMF;
    data['KRW'] = this.kRW;
    data['KWD'] = this.kWD;
    data['KYD'] = this.kYD;
    data['KZT'] = this.kZT;
    data['LAK'] = this.lAK;
    data['LBP'] = this.lBP;
    data['LKR'] = this.lKR;
    data['LRD'] = this.lRD;
    data['LSL'] = this.lSL;
    data['LYD'] = this.lYD;
    data['MAD'] = this.mAD;
    data['MDL'] = this.mDL;
    data['MGA'] = this.mGA;
    data['MKD'] = this.mKD;
    data['MMK'] = this.mMK;
    data['MNT'] = this.mNT;
    data['MOP'] = this.mOP;
    data['MRU'] = this.mRU;
    data['MUR'] = this.mUR;
    data['MVR'] = this.mVR;
    data['MWK'] = this.mWK;
    data['MXN'] = this.mXN;
    data['MYR'] = this.mYR;
    data['MZN'] = this.mZN;
    data['NAD'] = this.nAD;
    data['NGN'] = this.nGN;
    data['NIO'] = this.nIO;
    data['NOK'] = this.nOK;
    data['NPR'] = this.nPR;
    data['NZD'] = this.nZD;
    data['OMR'] = this.oMR;
    data['PAB'] = this.pAB;
    data['PEN'] = this.pEN;
    data['PGK'] = this.pGK;
    data['PHP'] = this.pHP;
    data['PLN'] = this.pLN;
    data['PYG'] = this.pYG;
    data['QAR'] = this.qAR;
    data['RON'] = this.rON;
    data['RSD'] = this.rSD;
    data['RUB'] = this.rUB;
    data['RWF'] = this.rWF;
    data['SAR'] = this.sAR;
    data['SBD'] = this.sBD;
    data['SCR'] = this.sCR;
    data['SDG'] = this.sDG;
    data['SEK'] = this.sEK;
    data['SGD'] = this.sGD;
    data['SHP'] = this.sHP;
    data['SLE'] = this.sLE;
    data['SLL'] = this.sLL;
    data['SOS'] = this.sOS;
    data['SRD'] = this.sRD;
    data['SSP'] = this.sSP;
    data['STN'] = this.sTN;
    data['SYP'] = this.sYP;
    data['SZL'] = this.sZL;
    data['THB'] = this.tHB;
    data['TJS'] = this.tJS;
    data['TMT'] = this.tMT;
    data['TND'] = this.tND;
    data['TOP'] = this.tOP;
    data['TRY'] = this.tRY;
    data['TTD'] = this.tTD;
    data['TVD'] = this.tVD;
    data['TWD'] = this.tWD;
    data['TZS'] = this.tZS;
    data['UAH'] = this.uAH;
    data['UGX'] = this.uGX;
    data['USD'] = this.uSD;
    data['UYU'] = this.uYU;
    data['UZS'] = this.uZS;
    data['VES'] = this.vES;
    data['VND'] = this.vND;
    data['VUV'] = this.vUV;
    data['WST'] = this.wST;
    data['XAF'] = this.xAF;
    data['XCD'] = this.xCD;
    data['XDR'] = this.xDR;
    data['XOF'] = this.xOF;
    data['XPF'] = this.xPF;
    data['YER'] = this.yER;
    data['ZAR'] = this.zAR;
    data['ZMW'] = this.zMW;
    data['ZWL'] = this.zWL;
    return data;
  }
}
