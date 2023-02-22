import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false)
class Country {
  Country({
    this.name,
    this.tld,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.borders,
    this.area,
    this.demonyms,
    this.flag,
    this.maps,
    this.population,
    this.gini,
    this.fifa,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
    this.postalCode,
  });

  final Name? name;
  final List<String>? tld;
  final bool? independent;
  final Status? status;
  final bool? unMember;
  final Currencies? currencies;
  final List<String>? capital;
  final List<String>? altSpellings;
  final Region? region;
  final String? subregion;
  final Map<String, String>? languages;
  final Map<String, Translation>? translations;
  final List<double>? latlng;
  final bool? landlocked;
  final List<String>? borders;
  final double? area;
  final Demonyms? demonyms;
  final String? flag;
  final Maps? maps;
  final int? population;
  final Map<String, double>? gini;
  final String? fifa;
  final Car? car;
  final List<String>? timezones;
  final List<Continent>? continents;
  final CoatOfArms? flags;
  final CoatOfArms? coatOfArms;
  final StartOfWeek? startOfWeek;
  final CapitalInfo? capitalInfo;
  final PostalCode? postalCode;

  //factory Country.fromJson(Map<String, dynamic> json) => _CountryFromJson(json);
}

class Name {}

class Idd {}

class Currencies {
  Currencies({
    this.mru,
    this.awg,
    this.ars,
    this.sek,
    this.mvr,
    this.mxn,
    this.nzd,
    this.usd,
    this.xpf,
    this.eur,
    this.pkr,
    this.zmw,
    this.scr,
    this.myr,
    this.nok,
    this.uzs,
    this.vuv,
    this.aud,
    this.sgd,
    this.srd,
    this.dzd,
    this.mad,
    this.crc,
    this.lyd,
    this.qar,
    this.dkk,
    this.mur,
    this.kzt,
    this.all,
    this.bhd,
    this.pgk,
    this.bif,
    this.inr,
    this.uyu,
    this.xcd,
    this.bbd,
    this.mop,
    this.gbp,
    this.imp,
    this.syp,
    this.ang,
    this.xof,
    this.kgs,
    this.ttd,
    this.egp,
    this.ils,
    this.jod,
    this.mga,
    this.hrk,
    this.fok,
    this.htg,
    this.ckd,
    this.cuc,
    this.cup,
    this.twd,
    this.szl,
    this.zar,
    this.uah,
    this.bmd,
    this.krw,
    this.pen,
    this.iqd,
    this.mdl,
    this.ves,
    this.gyd,
    this.kyd,
    this.khr,
    this.lkr,
    this.sdg,
    this.ern,
    this.sos,
    this.kmf,
    this.nio,
    this.rub,
    this.ugx,
    this.chf,
    this.tjs,
    this.ssp,
    this.czk,
    this.bwp,
    this.tnd,
    this.jmd,
    this.mzn,
    this.hnl,
    this.azn,
    this.mkd,
    this.gmd,
    this.lrd,
    this.cve,
    this.bsd,
    this.gel,
    this.kid,
    this.tzs,
    this.cny,
    this.gtq,
    this.stn,
    this.sll,
    this.xaf,
    this.thb,
    this.idr,
    this.gip,
    this.tmt,
    this.dop,
    this.ghs,
    this.jep,
    this.currenciesTry,
    this.tvd,
    this.irr,
    this.kes,
    this.bgn,
    this.zwl,
    this.aoa,
    this.ngn,
    this.pln,
    this.shp,
    this.lbp,
    this.wst,
    this.php,
    this.ggp,
    this.kwd,
    this.top,
    this.omr,
    this.afn,
    this.rsd,
    this.amd,
    this.bdt,
    this.lak,
    this.clp,
    this.pab,
    this.npr,
    this.mmk,
    this.fkp,
    this.huf,
    this.gnf,
    this.aed,
    this.bam,
    this.mwk,
    this.btn,
    this.cdf,
    this.vnd,
    this.brl,
    this.bzd,
    this.pyg,
    this.bnd,
    this.bob,
    this.djf,
    this.cad,
    this.jpy,
    this.rwf,
    this.isk,
    this.byn,
    this.hkd,
    this.lsl,
    this.fjd,
    this.cop,
    this.sar,
    this.etb,
    this.kpw,
    this.nad,
    this.mnt,
    this.sbd,
    this.yer,
    this.ron,
  });

  final Aed? mru;
  final Aed? awg;
  final Aed? ars;
  final Aed? sek;
  final Aed? mvr;
  final Aed? mxn;
  final Aed? nzd;
  final Aed? usd;
  final Aed? xpf;
  final Aed? eur;
  final Aed? pkr;
  final Aed? zmw;
  final Aed? scr;
  final Aed? myr;
  final Aed? nok;
  final Aed? uzs;
  final Aed? vuv;
  final Aed? aud;
  final Aed? sgd;
  final Aed? srd;
  final Aed? dzd;
  final Aed? mad;
  final Aed? crc;
  final Aed? lyd;
  final Aed? qar;
  final Aed? dkk;
  final Aed? mur;
  final Aed? kzt;
  final Aed? all;
  final Aed? bhd;
  final Aed? pgk;
  final Aed? bif;
  final Aed? inr;
  final Aed? uyu;
  final Aed? xcd;
  final Aed? bbd;
  final Aed? mop;
  final Aed? gbp;
  final Aed? imp;
  final Aed? syp;
  final Aed? ang;
  final Aed? xof;
  final Aed? kgs;
  final Aed? ttd;
  final Aed? egp;
  final Aed? ils;
  final Aed? jod;
  final Aed? mga;
  final Aed? hrk;
  final Aed? fok;
  final Aed? htg;
  final Aed? ckd;
  final Aed? cuc;
  final Aed? cup;
  final Aed? twd;
  final Aed? szl;
  final Aed? zar;
  final Aed? uah;
  final Aed? bmd;
  final Aed? krw;
  final Aed? pen;
  final Aed? iqd;
  final Aed? mdl;
  final Aed? ves;
  final Aed? gyd;
  final Aed? kyd;
  final Aed? khr;
  final Aed? lkr;
  final Bam? sdg;
  final Aed? ern;
  final Aed? sos;
  final Aed? kmf;
  final Aed? nio;
  final Aed? rub;
  final Aed? ugx;
  final Aed? chf;
  final Aed? tjs;
  final Aed? ssp;
  final Aed? czk;
  final Aed? bwp;
  final Aed? tnd;
  final Aed? jmd;
  final Aed? mzn;
  final Aed? hnl;
  final Aed? azn;
  final Aed? mkd;
  final Aed? gmd;
  final Aed? lrd;
  final Aed? cve;
  final Aed? bsd;
  final Aed? gel;
  final Aed? kid;
  final Aed? tzs;
  final Aed? cny;
  final Aed? gtq;
  final Aed? stn;
  final Aed? sll;
  final Aed? xaf;
  final Aed? thb;
  final Aed? idr;
  final Aed? gip;
  final Aed? tmt;
  final Aed? dop;
  final Aed? ghs;
  final Aed? jep;
  final Aed? currenciesTry;
  final Aed? tvd;
  final Aed? irr;
  final Aed? kes;
  final Aed? bgn;
  final Aed? zwl;
  final Aed? aoa;
  final Aed? ngn;
  final Aed? pln;
  final Aed? shp;
  final Aed? lbp;
  final Aed? wst;
  final Aed? php;
  final Aed? ggp;
  final Aed? kwd;
  final Aed? top;
  final Aed? omr;
  final Aed? afn;
  final Aed? rsd;
  final Aed? amd;
  final Aed? bdt;
  final Aed? lak;
  final Aed? clp;
  final Aed? pab;
  final Aed? npr;
  final Aed? mmk;
  final Aed? fkp;
  final Aed? huf;
  final Aed? gnf;
  final Aed? aed;
  final Bam? bam;
  final Aed? mwk;
  final Aed? btn;
  final Aed? cdf;
  final Aed? vnd;
  final Aed? brl;
  final Aed? bzd;
  final Aed? pyg;
  final Aed? bnd;
  final Aed? bob;
  final Aed? djf;
  final Aed? cad;
  final Aed? jpy;
  final Aed? rwf;
  final Aed? isk;
  final Aed? byn;
  final Aed? hkd;
  final Aed? lsl;
  final Aed? fjd;
  final Aed? cop;
  final Aed? sar;
  final Aed? etb;
  final Aed? kpw;
  final Aed? nad;
  final Aed? mnt;
  final Aed? sbd;
  final Aed? yer;
  final Aed? ron;

  //factory Currencies.FromJson(Map<String, dynamic> json) =>
  //  _CurrenciesFromJson(json);
}

class Bam {}

class Aed {
  Aed({
    this.name,
    this.symbol,
  });

  final String? name;
  final String? symbol;

  //factory Aed.FromJson(Map<String, dynamic> json) => _AedFromJson(json);
}

class Region {}

class Translation {}

class Demonyms {}

class Status {}

class Maps {}

class Car {}

class Continent {}

class CoatOfArms {}

class StartOfWeek {}

class CapitalInfo {}

class PostalCode {}
