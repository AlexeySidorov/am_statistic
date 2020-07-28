// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDataBase.moor.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Country extends DataClass implements Insertable<Country> {
  final int id;
  final String country;
  final String slug;
  final String iso2;
  final double lat;
  final double lon;
  final String locationId;
  Country(
      {@required this.id,
      @required this.country,
      @required this.slug,
      @required this.iso2,
      this.lat,
      this.lon,
      this.locationId});
  factory Country.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Country(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      country:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}country']),
      slug: stringType.mapFromDatabaseResponse(data['${effectivePrefix}slug']),
      iso2: stringType.mapFromDatabaseResponse(data['${effectivePrefix}iso2']),
      lat: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}lat']),
      lon: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}lon']),
      locationId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || slug != null) {
      map['slug'] = Variable<String>(slug);
    }
    if (!nullToAbsent || iso2 != null) {
      map['iso2'] = Variable<String>(iso2);
    }
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lon != null) {
      map['lon'] = Variable<double>(lon);
    }
    if (!nullToAbsent || locationId != null) {
      map['location_id'] = Variable<String>(locationId);
    }
    return map;
  }

  CountryModelCompanion toCompanion(bool nullToAbsent) {
    return CountryModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      slug: slug == null && nullToAbsent ? const Value.absent() : Value(slug),
      iso2: iso2 == null && nullToAbsent ? const Value.absent() : Value(iso2),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lon: lon == null && nullToAbsent ? const Value.absent() : Value(lon),
      locationId: locationId == null && nullToAbsent
          ? const Value.absent()
          : Value(locationId),
    );
  }

  factory Country.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Country(
      id: serializer.fromJson<int>(json['id']),
      country: serializer.fromJson<String>(json['country']),
      slug: serializer.fromJson<String>(json['slug']),
      iso2: serializer.fromJson<String>(json['iso2']),
      lat: serializer.fromJson<double>(json['lat']),
      lon: serializer.fromJson<double>(json['lon']),
      locationId: serializer.fromJson<String>(json['locationId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'country': serializer.toJson<String>(country),
      'slug': serializer.toJson<String>(slug),
      'iso2': serializer.toJson<String>(iso2),
      'lat': serializer.toJson<double>(lat),
      'lon': serializer.toJson<double>(lon),
      'locationId': serializer.toJson<String>(locationId),
    };
  }

  Country copyWith(
          {int id,
          String country,
          String slug,
          String iso2,
          double lat,
          double lon,
          String locationId}) =>
      Country(
        id: id ?? this.id,
        country: country ?? this.country,
        slug: slug ?? this.slug,
        iso2: iso2 ?? this.iso2,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        locationId: locationId ?? this.locationId,
      );
  @override
  String toString() {
    return (StringBuffer('Country(')
          ..write('id: $id, ')
          ..write('country: $country, ')
          ..write('slug: $slug, ')
          ..write('iso2: $iso2, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('locationId: $locationId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          country.hashCode,
          $mrjc(
              slug.hashCode,
              $mrjc(
                  iso2.hashCode,
                  $mrjc(lat.hashCode,
                      $mrjc(lon.hashCode, locationId.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Country &&
          other.id == this.id &&
          other.country == this.country &&
          other.slug == this.slug &&
          other.iso2 == this.iso2 &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.locationId == this.locationId);
}

class CountryModelCompanion extends UpdateCompanion<Country> {
  final Value<int> id;
  final Value<String> country;
  final Value<String> slug;
  final Value<String> iso2;
  final Value<double> lat;
  final Value<double> lon;
  final Value<String> locationId;
  const CountryModelCompanion({
    this.id = const Value.absent(),
    this.country = const Value.absent(),
    this.slug = const Value.absent(),
    this.iso2 = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.locationId = const Value.absent(),
  });
  CountryModelCompanion.insert({
    this.id = const Value.absent(),
    @required String country,
    @required String slug,
    @required String iso2,
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.locationId = const Value.absent(),
  })  : country = Value(country),
        slug = Value(slug),
        iso2 = Value(iso2);
  static Insertable<Country> custom({
    Expression<int> id,
    Expression<String> country,
    Expression<String> slug,
    Expression<String> iso2,
    Expression<double> lat,
    Expression<double> lon,
    Expression<String> locationId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (country != null) 'country': country,
      if (slug != null) 'slug': slug,
      if (iso2 != null) 'iso2': iso2,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (locationId != null) 'location_id': locationId,
    });
  }

  CountryModelCompanion copyWith(
      {Value<int> id,
      Value<String> country,
      Value<String> slug,
      Value<String> iso2,
      Value<double> lat,
      Value<double> lon,
      Value<String> locationId}) {
    return CountryModelCompanion(
      id: id ?? this.id,
      country: country ?? this.country,
      slug: slug ?? this.slug,
      iso2: iso2 ?? this.iso2,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      locationId: locationId ?? this.locationId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (iso2.present) {
      map['iso2'] = Variable<String>(iso2.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<String>(locationId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountryModelCompanion(')
          ..write('id: $id, ')
          ..write('country: $country, ')
          ..write('slug: $slug, ')
          ..write('iso2: $iso2, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('locationId: $locationId')
          ..write(')'))
        .toString();
  }
}

class $CountryModelTable extends CountryModel
    with TableInfo<$CountryModelTable, Country> {
  final GeneratedDatabase _db;
  final String _alias;
  $CountryModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _countryMeta = const VerificationMeta('country');
  GeneratedTextColumn _country;
  @override
  GeneratedTextColumn get country => _country ??= _constructCountry();
  GeneratedTextColumn _constructCountry() {
    return GeneratedTextColumn(
      'country',
      $tableName,
      false,
    );
  }

  final VerificationMeta _slugMeta = const VerificationMeta('slug');
  GeneratedTextColumn _slug;
  @override
  GeneratedTextColumn get slug => _slug ??= _constructSlug();
  GeneratedTextColumn _constructSlug() {
    return GeneratedTextColumn(
      'slug',
      $tableName,
      false,
    );
  }

  final VerificationMeta _iso2Meta = const VerificationMeta('iso2');
  GeneratedTextColumn _iso2;
  @override
  GeneratedTextColumn get iso2 => _iso2 ??= _constructIso2();
  GeneratedTextColumn _constructIso2() {
    return GeneratedTextColumn(
      'iso2',
      $tableName,
      false,
    );
  }

  final VerificationMeta _latMeta = const VerificationMeta('lat');
  GeneratedRealColumn _lat;
  @override
  GeneratedRealColumn get lat => _lat ??= _constructLat();
  GeneratedRealColumn _constructLat() {
    return GeneratedRealColumn(
      'lat',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lonMeta = const VerificationMeta('lon');
  GeneratedRealColumn _lon;
  @override
  GeneratedRealColumn get lon => _lon ??= _constructLon();
  GeneratedRealColumn _constructLon() {
    return GeneratedRealColumn(
      'lon',
      $tableName,
      true,
    );
  }

  final VerificationMeta _locationIdMeta = const VerificationMeta('locationId');
  GeneratedTextColumn _locationId;
  @override
  GeneratedTextColumn get locationId => _locationId ??= _constructLocationId();
  GeneratedTextColumn _constructLocationId() {
    return GeneratedTextColumn(
      'location_id',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, country, slug, iso2, lat, lon, locationId];
  @override
  $CountryModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'country_model';
  @override
  final String actualTableName = 'country_model';
  @override
  VerificationContext validateIntegrity(Insertable<Country> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country'], _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('slug')) {
      context.handle(
          _slugMeta, slug.isAcceptableOrUnknown(data['slug'], _slugMeta));
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('iso2')) {
      context.handle(
          _iso2Meta, iso2.isAcceptableOrUnknown(data['iso2'], _iso2Meta));
    } else if (isInserting) {
      context.missing(_iso2Meta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat'], _latMeta));
    }
    if (data.containsKey('lon')) {
      context.handle(
          _lonMeta, lon.isAcceptableOrUnknown(data['lon'], _lonMeta));
    }
    if (data.containsKey('location_id')) {
      context.handle(
          _locationIdMeta,
          locationId.isAcceptableOrUnknown(
              data['location_id'], _locationIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Country map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Country.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CountryModelTable createAlias(String alias) {
    return $CountryModelTable(_db, alias);
  }
}

class Global extends DataClass implements Insertable<Global> {
  final int id;
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  Global(
      {@required this.id,
      @required this.newConfirmed,
      @required this.totalConfirmed,
      @required this.newDeaths,
      @required this.totalDeaths,
      @required this.newRecovered,
      @required this.totalRecovered});
  factory Global.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return Global(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      newConfirmed: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}new_confirmed']),
      totalConfirmed: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_confirmed']),
      newDeaths:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}new_deaths']),
      totalDeaths: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_deaths']),
      newRecovered: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}new_recovered']),
      totalRecovered: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_recovered']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || newConfirmed != null) {
      map['new_confirmed'] = Variable<int>(newConfirmed);
    }
    if (!nullToAbsent || totalConfirmed != null) {
      map['total_confirmed'] = Variable<int>(totalConfirmed);
    }
    if (!nullToAbsent || newDeaths != null) {
      map['new_deaths'] = Variable<int>(newDeaths);
    }
    if (!nullToAbsent || totalDeaths != null) {
      map['total_deaths'] = Variable<int>(totalDeaths);
    }
    if (!nullToAbsent || newRecovered != null) {
      map['new_recovered'] = Variable<int>(newRecovered);
    }
    if (!nullToAbsent || totalRecovered != null) {
      map['total_recovered'] = Variable<int>(totalRecovered);
    }
    return map;
  }

  GlobalModelCompanion toCompanion(bool nullToAbsent) {
    return GlobalModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      newConfirmed: newConfirmed == null && nullToAbsent
          ? const Value.absent()
          : Value(newConfirmed),
      totalConfirmed: totalConfirmed == null && nullToAbsent
          ? const Value.absent()
          : Value(totalConfirmed),
      newDeaths: newDeaths == null && nullToAbsent
          ? const Value.absent()
          : Value(newDeaths),
      totalDeaths: totalDeaths == null && nullToAbsent
          ? const Value.absent()
          : Value(totalDeaths),
      newRecovered: newRecovered == null && nullToAbsent
          ? const Value.absent()
          : Value(newRecovered),
      totalRecovered: totalRecovered == null && nullToAbsent
          ? const Value.absent()
          : Value(totalRecovered),
    );
  }

  factory Global.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Global(
      id: serializer.fromJson<int>(json['id']),
      newConfirmed: serializer.fromJson<int>(json['newConfirmed']),
      totalConfirmed: serializer.fromJson<int>(json['totalConfirmed']),
      newDeaths: serializer.fromJson<int>(json['newDeaths']),
      totalDeaths: serializer.fromJson<int>(json['totalDeaths']),
      newRecovered: serializer.fromJson<int>(json['newRecovered']),
      totalRecovered: serializer.fromJson<int>(json['totalRecovered']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'newConfirmed': serializer.toJson<int>(newConfirmed),
      'totalConfirmed': serializer.toJson<int>(totalConfirmed),
      'newDeaths': serializer.toJson<int>(newDeaths),
      'totalDeaths': serializer.toJson<int>(totalDeaths),
      'newRecovered': serializer.toJson<int>(newRecovered),
      'totalRecovered': serializer.toJson<int>(totalRecovered),
    };
  }

  Global copyWith(
          {int id,
          int newConfirmed,
          int totalConfirmed,
          int newDeaths,
          int totalDeaths,
          int newRecovered,
          int totalRecovered}) =>
      Global(
        id: id ?? this.id,
        newConfirmed: newConfirmed ?? this.newConfirmed,
        totalConfirmed: totalConfirmed ?? this.totalConfirmed,
        newDeaths: newDeaths ?? this.newDeaths,
        totalDeaths: totalDeaths ?? this.totalDeaths,
        newRecovered: newRecovered ?? this.newRecovered,
        totalRecovered: totalRecovered ?? this.totalRecovered,
      );
  @override
  String toString() {
    return (StringBuffer('Global(')
          ..write('id: $id, ')
          ..write('newConfirmed: $newConfirmed, ')
          ..write('totalConfirmed: $totalConfirmed, ')
          ..write('newDeaths: $newDeaths, ')
          ..write('totalDeaths: $totalDeaths, ')
          ..write('newRecovered: $newRecovered, ')
          ..write('totalRecovered: $totalRecovered')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          newConfirmed.hashCode,
          $mrjc(
              totalConfirmed.hashCode,
              $mrjc(
                  newDeaths.hashCode,
                  $mrjc(
                      totalDeaths.hashCode,
                      $mrjc(
                          newRecovered.hashCode, totalRecovered.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Global &&
          other.id == this.id &&
          other.newConfirmed == this.newConfirmed &&
          other.totalConfirmed == this.totalConfirmed &&
          other.newDeaths == this.newDeaths &&
          other.totalDeaths == this.totalDeaths &&
          other.newRecovered == this.newRecovered &&
          other.totalRecovered == this.totalRecovered);
}

class GlobalModelCompanion extends UpdateCompanion<Global> {
  final Value<int> id;
  final Value<int> newConfirmed;
  final Value<int> totalConfirmed;
  final Value<int> newDeaths;
  final Value<int> totalDeaths;
  final Value<int> newRecovered;
  final Value<int> totalRecovered;
  const GlobalModelCompanion({
    this.id = const Value.absent(),
    this.newConfirmed = const Value.absent(),
    this.totalConfirmed = const Value.absent(),
    this.newDeaths = const Value.absent(),
    this.totalDeaths = const Value.absent(),
    this.newRecovered = const Value.absent(),
    this.totalRecovered = const Value.absent(),
  });
  GlobalModelCompanion.insert({
    this.id = const Value.absent(),
    @required int newConfirmed,
    @required int totalConfirmed,
    @required int newDeaths,
    @required int totalDeaths,
    @required int newRecovered,
    @required int totalRecovered,
  })  : newConfirmed = Value(newConfirmed),
        totalConfirmed = Value(totalConfirmed),
        newDeaths = Value(newDeaths),
        totalDeaths = Value(totalDeaths),
        newRecovered = Value(newRecovered),
        totalRecovered = Value(totalRecovered);
  static Insertable<Global> custom({
    Expression<int> id,
    Expression<int> newConfirmed,
    Expression<int> totalConfirmed,
    Expression<int> newDeaths,
    Expression<int> totalDeaths,
    Expression<int> newRecovered,
    Expression<int> totalRecovered,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (newConfirmed != null) 'new_confirmed': newConfirmed,
      if (totalConfirmed != null) 'total_confirmed': totalConfirmed,
      if (newDeaths != null) 'new_deaths': newDeaths,
      if (totalDeaths != null) 'total_deaths': totalDeaths,
      if (newRecovered != null) 'new_recovered': newRecovered,
      if (totalRecovered != null) 'total_recovered': totalRecovered,
    });
  }

  GlobalModelCompanion copyWith(
      {Value<int> id,
      Value<int> newConfirmed,
      Value<int> totalConfirmed,
      Value<int> newDeaths,
      Value<int> totalDeaths,
      Value<int> newRecovered,
      Value<int> totalRecovered}) {
    return GlobalModelCompanion(
      id: id ?? this.id,
      newConfirmed: newConfirmed ?? this.newConfirmed,
      totalConfirmed: totalConfirmed ?? this.totalConfirmed,
      newDeaths: newDeaths ?? this.newDeaths,
      totalDeaths: totalDeaths ?? this.totalDeaths,
      newRecovered: newRecovered ?? this.newRecovered,
      totalRecovered: totalRecovered ?? this.totalRecovered,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (newConfirmed.present) {
      map['new_confirmed'] = Variable<int>(newConfirmed.value);
    }
    if (totalConfirmed.present) {
      map['total_confirmed'] = Variable<int>(totalConfirmed.value);
    }
    if (newDeaths.present) {
      map['new_deaths'] = Variable<int>(newDeaths.value);
    }
    if (totalDeaths.present) {
      map['total_deaths'] = Variable<int>(totalDeaths.value);
    }
    if (newRecovered.present) {
      map['new_recovered'] = Variable<int>(newRecovered.value);
    }
    if (totalRecovered.present) {
      map['total_recovered'] = Variable<int>(totalRecovered.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GlobalModelCompanion(')
          ..write('id: $id, ')
          ..write('newConfirmed: $newConfirmed, ')
          ..write('totalConfirmed: $totalConfirmed, ')
          ..write('newDeaths: $newDeaths, ')
          ..write('totalDeaths: $totalDeaths, ')
          ..write('newRecovered: $newRecovered, ')
          ..write('totalRecovered: $totalRecovered')
          ..write(')'))
        .toString();
  }
}

class $GlobalModelTable extends GlobalModel
    with TableInfo<$GlobalModelTable, Global> {
  final GeneratedDatabase _db;
  final String _alias;
  $GlobalModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _newConfirmedMeta =
      const VerificationMeta('newConfirmed');
  GeneratedIntColumn _newConfirmed;
  @override
  GeneratedIntColumn get newConfirmed =>
      _newConfirmed ??= _constructNewConfirmed();
  GeneratedIntColumn _constructNewConfirmed() {
    return GeneratedIntColumn(
      'new_confirmed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalConfirmedMeta =
      const VerificationMeta('totalConfirmed');
  GeneratedIntColumn _totalConfirmed;
  @override
  GeneratedIntColumn get totalConfirmed =>
      _totalConfirmed ??= _constructTotalConfirmed();
  GeneratedIntColumn _constructTotalConfirmed() {
    return GeneratedIntColumn(
      'total_confirmed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _newDeathsMeta = const VerificationMeta('newDeaths');
  GeneratedIntColumn _newDeaths;
  @override
  GeneratedIntColumn get newDeaths => _newDeaths ??= _constructNewDeaths();
  GeneratedIntColumn _constructNewDeaths() {
    return GeneratedIntColumn(
      'new_deaths',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalDeathsMeta =
      const VerificationMeta('totalDeaths');
  GeneratedIntColumn _totalDeaths;
  @override
  GeneratedIntColumn get totalDeaths =>
      _totalDeaths ??= _constructTotalDeaths();
  GeneratedIntColumn _constructTotalDeaths() {
    return GeneratedIntColumn(
      'total_deaths',
      $tableName,
      false,
    );
  }

  final VerificationMeta _newRecoveredMeta =
      const VerificationMeta('newRecovered');
  GeneratedIntColumn _newRecovered;
  @override
  GeneratedIntColumn get newRecovered =>
      _newRecovered ??= _constructNewRecovered();
  GeneratedIntColumn _constructNewRecovered() {
    return GeneratedIntColumn(
      'new_recovered',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalRecoveredMeta =
      const VerificationMeta('totalRecovered');
  GeneratedIntColumn _totalRecovered;
  @override
  GeneratedIntColumn get totalRecovered =>
      _totalRecovered ??= _constructTotalRecovered();
  GeneratedIntColumn _constructTotalRecovered() {
    return GeneratedIntColumn(
      'total_recovered',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        newConfirmed,
        totalConfirmed,
        newDeaths,
        totalDeaths,
        newRecovered,
        totalRecovered
      ];
  @override
  $GlobalModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'global_model';
  @override
  final String actualTableName = 'global_model';
  @override
  VerificationContext validateIntegrity(Insertable<Global> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('new_confirmed')) {
      context.handle(
          _newConfirmedMeta,
          newConfirmed.isAcceptableOrUnknown(
              data['new_confirmed'], _newConfirmedMeta));
    } else if (isInserting) {
      context.missing(_newConfirmedMeta);
    }
    if (data.containsKey('total_confirmed')) {
      context.handle(
          _totalConfirmedMeta,
          totalConfirmed.isAcceptableOrUnknown(
              data['total_confirmed'], _totalConfirmedMeta));
    } else if (isInserting) {
      context.missing(_totalConfirmedMeta);
    }
    if (data.containsKey('new_deaths')) {
      context.handle(_newDeathsMeta,
          newDeaths.isAcceptableOrUnknown(data['new_deaths'], _newDeathsMeta));
    } else if (isInserting) {
      context.missing(_newDeathsMeta);
    }
    if (data.containsKey('total_deaths')) {
      context.handle(
          _totalDeathsMeta,
          totalDeaths.isAcceptableOrUnknown(
              data['total_deaths'], _totalDeathsMeta));
    } else if (isInserting) {
      context.missing(_totalDeathsMeta);
    }
    if (data.containsKey('new_recovered')) {
      context.handle(
          _newRecoveredMeta,
          newRecovered.isAcceptableOrUnknown(
              data['new_recovered'], _newRecoveredMeta));
    } else if (isInserting) {
      context.missing(_newRecoveredMeta);
    }
    if (data.containsKey('total_recovered')) {
      context.handle(
          _totalRecoveredMeta,
          totalRecovered.isAcceptableOrUnknown(
              data['total_recovered'], _totalRecoveredMeta));
    } else if (isInserting) {
      context.missing(_totalRecoveredMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Global map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Global.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $GlobalModelTable createAlias(String alias) {
    return $GlobalModelTable(_db, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final int countryId;
  final String iso2;
  User({@required this.id, @required this.countryId, @required this.iso2});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      countryId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}country_id']),
      iso2: stringType.mapFromDatabaseResponse(data['${effectivePrefix}iso2']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<int>(countryId);
    }
    if (!nullToAbsent || iso2 != null) {
      map['iso2'] = Variable<String>(iso2);
    }
    return map;
  }

  UserModelCompanion toCompanion(bool nullToAbsent) {
    return UserModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      iso2: iso2 == null && nullToAbsent ? const Value.absent() : Value(iso2),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      countryId: serializer.fromJson<int>(json['countryId']),
      iso2: serializer.fromJson<String>(json['iso2']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'countryId': serializer.toJson<int>(countryId),
      'iso2': serializer.toJson<String>(iso2),
    };
  }

  User copyWith({int id, int countryId, String iso2}) => User(
        id: id ?? this.id,
        countryId: countryId ?? this.countryId,
        iso2: iso2 ?? this.iso2,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('iso2: $iso2')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(countryId.hashCode, iso2.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.countryId == this.countryId &&
          other.iso2 == this.iso2);
}

class UserModelCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<int> countryId;
  final Value<String> iso2;
  const UserModelCompanion({
    this.id = const Value.absent(),
    this.countryId = const Value.absent(),
    this.iso2 = const Value.absent(),
  });
  UserModelCompanion.insert({
    this.id = const Value.absent(),
    @required int countryId,
    @required String iso2,
  })  : countryId = Value(countryId),
        iso2 = Value(iso2);
  static Insertable<User> custom({
    Expression<int> id,
    Expression<int> countryId,
    Expression<String> iso2,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (countryId != null) 'country_id': countryId,
      if (iso2 != null) 'iso2': iso2,
    });
  }

  UserModelCompanion copyWith(
      {Value<int> id, Value<int> countryId, Value<String> iso2}) {
    return UserModelCompanion(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      iso2: iso2 ?? this.iso2,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
    }
    if (iso2.present) {
      map['iso2'] = Variable<String>(iso2.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserModelCompanion(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('iso2: $iso2')
          ..write(')'))
        .toString();
  }
}

class $UserModelTable extends UserModel with TableInfo<$UserModelTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UserModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  GeneratedIntColumn _countryId;
  @override
  GeneratedIntColumn get countryId => _countryId ??= _constructCountryId();
  GeneratedIntColumn _constructCountryId() {
    return GeneratedIntColumn(
      'country_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _iso2Meta = const VerificationMeta('iso2');
  GeneratedTextColumn _iso2;
  @override
  GeneratedTextColumn get iso2 => _iso2 ??= _constructIso2();
  GeneratedTextColumn _constructIso2() {
    return GeneratedTextColumn(
      'iso2',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, countryId, iso2];
  @override
  $UserModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'user_model';
  @override
  final String actualTableName = 'user_model';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id'], _countryIdMeta));
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    if (data.containsKey('iso2')) {
      context.handle(
          _iso2Meta, iso2.isAcceptableOrUnknown(data['iso2'], _iso2Meta));
    } else if (isInserting) {
      context.missing(_iso2Meta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UserModelTable createAlias(String alias) {
    return $UserModelTable(_db, alias);
  }
}

class World extends DataClass implements Insertable<World> {
  final int id;
  final int countryId;
  final int confirmed;
  final int deaths;
  final int recovered;
  final int active;
  final DateTime date;
  World(
      {@required this.id,
      @required this.countryId,
      @required this.confirmed,
      @required this.deaths,
      @required this.recovered,
      @required this.active,
      this.date});
  factory World.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return World(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      countryId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}country_id']),
      confirmed:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}confirmed']),
      deaths: intType.mapFromDatabaseResponse(data['${effectivePrefix}deaths']),
      recovered:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}recovered']),
      active: intType.mapFromDatabaseResponse(data['${effectivePrefix}active']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<int>(countryId);
    }
    if (!nullToAbsent || confirmed != null) {
      map['confirmed'] = Variable<int>(confirmed);
    }
    if (!nullToAbsent || deaths != null) {
      map['deaths'] = Variable<int>(deaths);
    }
    if (!nullToAbsent || recovered != null) {
      map['recovered'] = Variable<int>(recovered);
    }
    if (!nullToAbsent || active != null) {
      map['active'] = Variable<int>(active);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  WorldModelCompanion toCompanion(bool nullToAbsent) {
    return WorldModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      confirmed: confirmed == null && nullToAbsent
          ? const Value.absent()
          : Value(confirmed),
      deaths:
          deaths == null && nullToAbsent ? const Value.absent() : Value(deaths),
      recovered: recovered == null && nullToAbsent
          ? const Value.absent()
          : Value(recovered),
      active:
          active == null && nullToAbsent ? const Value.absent() : Value(active),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory World.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return World(
      id: serializer.fromJson<int>(json['id']),
      countryId: serializer.fromJson<int>(json['countryId']),
      confirmed: serializer.fromJson<int>(json['confirmed']),
      deaths: serializer.fromJson<int>(json['deaths']),
      recovered: serializer.fromJson<int>(json['recovered']),
      active: serializer.fromJson<int>(json['active']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'countryId': serializer.toJson<int>(countryId),
      'confirmed': serializer.toJson<int>(confirmed),
      'deaths': serializer.toJson<int>(deaths),
      'recovered': serializer.toJson<int>(recovered),
      'active': serializer.toJson<int>(active),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  World copyWith(
          {int id,
          int countryId,
          int confirmed,
          int deaths,
          int recovered,
          int active,
          DateTime date}) =>
      World(
        id: id ?? this.id,
        countryId: countryId ?? this.countryId,
        confirmed: confirmed ?? this.confirmed,
        deaths: deaths ?? this.deaths,
        recovered: recovered ?? this.recovered,
        active: active ?? this.active,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('World(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('confirmed: $confirmed, ')
          ..write('deaths: $deaths, ')
          ..write('recovered: $recovered, ')
          ..write('active: $active, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          countryId.hashCode,
          $mrjc(
              confirmed.hashCode,
              $mrjc(
                  deaths.hashCode,
                  $mrjc(recovered.hashCode,
                      $mrjc(active.hashCode, date.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is World &&
          other.id == this.id &&
          other.countryId == this.countryId &&
          other.confirmed == this.confirmed &&
          other.deaths == this.deaths &&
          other.recovered == this.recovered &&
          other.active == this.active &&
          other.date == this.date);
}

class WorldModelCompanion extends UpdateCompanion<World> {
  final Value<int> id;
  final Value<int> countryId;
  final Value<int> confirmed;
  final Value<int> deaths;
  final Value<int> recovered;
  final Value<int> active;
  final Value<DateTime> date;
  const WorldModelCompanion({
    this.id = const Value.absent(),
    this.countryId = const Value.absent(),
    this.confirmed = const Value.absent(),
    this.deaths = const Value.absent(),
    this.recovered = const Value.absent(),
    this.active = const Value.absent(),
    this.date = const Value.absent(),
  });
  WorldModelCompanion.insert({
    this.id = const Value.absent(),
    @required int countryId,
    @required int confirmed,
    @required int deaths,
    @required int recovered,
    @required int active,
    this.date = const Value.absent(),
  })  : countryId = Value(countryId),
        confirmed = Value(confirmed),
        deaths = Value(deaths),
        recovered = Value(recovered),
        active = Value(active);
  static Insertable<World> custom({
    Expression<int> id,
    Expression<int> countryId,
    Expression<int> confirmed,
    Expression<int> deaths,
    Expression<int> recovered,
    Expression<int> active,
    Expression<DateTime> date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (countryId != null) 'country_id': countryId,
      if (confirmed != null) 'confirmed': confirmed,
      if (deaths != null) 'deaths': deaths,
      if (recovered != null) 'recovered': recovered,
      if (active != null) 'active': active,
      if (date != null) 'date': date,
    });
  }

  WorldModelCompanion copyWith(
      {Value<int> id,
      Value<int> countryId,
      Value<int> confirmed,
      Value<int> deaths,
      Value<int> recovered,
      Value<int> active,
      Value<DateTime> date}) {
    return WorldModelCompanion(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      confirmed: confirmed ?? this.confirmed,
      deaths: deaths ?? this.deaths,
      recovered: recovered ?? this.recovered,
      active: active ?? this.active,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
    }
    if (confirmed.present) {
      map['confirmed'] = Variable<int>(confirmed.value);
    }
    if (deaths.present) {
      map['deaths'] = Variable<int>(deaths.value);
    }
    if (recovered.present) {
      map['recovered'] = Variable<int>(recovered.value);
    }
    if (active.present) {
      map['active'] = Variable<int>(active.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorldModelCompanion(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('confirmed: $confirmed, ')
          ..write('deaths: $deaths, ')
          ..write('recovered: $recovered, ')
          ..write('active: $active, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $WorldModelTable extends WorldModel
    with TableInfo<$WorldModelTable, World> {
  final GeneratedDatabase _db;
  final String _alias;
  $WorldModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  GeneratedIntColumn _countryId;
  @override
  GeneratedIntColumn get countryId => _countryId ??= _constructCountryId();
  GeneratedIntColumn _constructCountryId() {
    return GeneratedIntColumn(
      'country_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _confirmedMeta = const VerificationMeta('confirmed');
  GeneratedIntColumn _confirmed;
  @override
  GeneratedIntColumn get confirmed => _confirmed ??= _constructConfirmed();
  GeneratedIntColumn _constructConfirmed() {
    return GeneratedIntColumn(
      'confirmed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _deathsMeta = const VerificationMeta('deaths');
  GeneratedIntColumn _deaths;
  @override
  GeneratedIntColumn get deaths => _deaths ??= _constructDeaths();
  GeneratedIntColumn _constructDeaths() {
    return GeneratedIntColumn(
      'deaths',
      $tableName,
      false,
    );
  }

  final VerificationMeta _recoveredMeta = const VerificationMeta('recovered');
  GeneratedIntColumn _recovered;
  @override
  GeneratedIntColumn get recovered => _recovered ??= _constructRecovered();
  GeneratedIntColumn _constructRecovered() {
    return GeneratedIntColumn(
      'recovered',
      $tableName,
      false,
    );
  }

  final VerificationMeta _activeMeta = const VerificationMeta('active');
  GeneratedIntColumn _active;
  @override
  GeneratedIntColumn get active => _active ??= _constructActive();
  GeneratedIntColumn _constructActive() {
    return GeneratedIntColumn(
      'active',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, countryId, confirmed, deaths, recovered, active, date];
  @override
  $WorldModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'world_model';
  @override
  final String actualTableName = 'world_model';
  @override
  VerificationContext validateIntegrity(Insertable<World> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id'], _countryIdMeta));
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    if (data.containsKey('confirmed')) {
      context.handle(_confirmedMeta,
          confirmed.isAcceptableOrUnknown(data['confirmed'], _confirmedMeta));
    } else if (isInserting) {
      context.missing(_confirmedMeta);
    }
    if (data.containsKey('deaths')) {
      context.handle(_deathsMeta,
          deaths.isAcceptableOrUnknown(data['deaths'], _deathsMeta));
    } else if (isInserting) {
      context.missing(_deathsMeta);
    }
    if (data.containsKey('recovered')) {
      context.handle(_recoveredMeta,
          recovered.isAcceptableOrUnknown(data['recovered'], _recoveredMeta));
    } else if (isInserting) {
      context.missing(_recoveredMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active'], _activeMeta));
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  World map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return World.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WorldModelTable createAlias(String alias) {
    return $WorldModelTable(_db, alias);
  }
}

class SyncDate extends DataClass implements Insertable<SyncDate> {
  final int id;
  final String type;
  final DateTime syncDate;
  SyncDate({@required this.id, this.type, this.syncDate});
  factory SyncDate.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return SyncDate(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      syncDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || syncDate != null) {
      map['sync_date'] = Variable<DateTime>(syncDate);
    }
    return map;
  }

  SyncDateModelCompanion toCompanion(bool nullToAbsent) {
    return SyncDateModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      syncDate: syncDate == null && nullToAbsent
          ? const Value.absent()
          : Value(syncDate),
    );
  }

  factory SyncDate.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SyncDate(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      syncDate: serializer.fromJson<DateTime>(json['syncDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'syncDate': serializer.toJson<DateTime>(syncDate),
    };
  }

  SyncDate copyWith({int id, String type, DateTime syncDate}) => SyncDate(
        id: id ?? this.id,
        type: type ?? this.type,
        syncDate: syncDate ?? this.syncDate,
      );
  @override
  String toString() {
    return (StringBuffer('SyncDate(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('syncDate: $syncDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(type.hashCode, syncDate.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SyncDate &&
          other.id == this.id &&
          other.type == this.type &&
          other.syncDate == this.syncDate);
}

class SyncDateModelCompanion extends UpdateCompanion<SyncDate> {
  final Value<int> id;
  final Value<String> type;
  final Value<DateTime> syncDate;
  const SyncDateModelCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.syncDate = const Value.absent(),
  });
  SyncDateModelCompanion.insert({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.syncDate = const Value.absent(),
  });
  static Insertable<SyncDate> custom({
    Expression<int> id,
    Expression<String> type,
    Expression<DateTime> syncDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (syncDate != null) 'sync_date': syncDate,
    });
  }

  SyncDateModelCompanion copyWith(
      {Value<int> id, Value<String> type, Value<DateTime> syncDate}) {
    return SyncDateModelCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      syncDate: syncDate ?? this.syncDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (syncDate.present) {
      map['sync_date'] = Variable<DateTime>(syncDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncDateModelCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('syncDate: $syncDate')
          ..write(')'))
        .toString();
  }
}

class $SyncDateModelTable extends SyncDateModel
    with TableInfo<$SyncDateModelTable, SyncDate> {
  final GeneratedDatabase _db;
  final String _alias;
  $SyncDateModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _syncDateMeta = const VerificationMeta('syncDate');
  GeneratedDateTimeColumn _syncDate;
  @override
  GeneratedDateTimeColumn get syncDate => _syncDate ??= _constructSyncDate();
  GeneratedDateTimeColumn _constructSyncDate() {
    return GeneratedDateTimeColumn(
      'sync_date',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, type, syncDate];
  @override
  $SyncDateModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sync_date_model';
  @override
  final String actualTableName = 'sync_date_model';
  @override
  VerificationContext validateIntegrity(Insertable<SyncDate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    }
    if (data.containsKey('sync_date')) {
      context.handle(_syncDateMeta,
          syncDate.isAcceptableOrUnknown(data['sync_date'], _syncDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncDate map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SyncDate.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SyncDateModelTable createAlias(String alias) {
    return $SyncDateModelTable(_db, alias);
  }
}

class Status extends DataClass implements Insertable<Status> {
  final int id;
  final int countryId;
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  Status(
      {@required this.id,
      @required this.countryId,
      @required this.newConfirmed,
      @required this.totalConfirmed,
      @required this.newDeaths,
      @required this.totalDeaths,
      @required this.newRecovered,
      @required this.totalRecovered});
  factory Status.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return Status(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      countryId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}country_id']),
      newConfirmed: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}new_confirmed']),
      totalConfirmed: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_confirmed']),
      newDeaths:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}new_deaths']),
      totalDeaths: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_deaths']),
      newRecovered: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}new_recovered']),
      totalRecovered: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_recovered']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<int>(countryId);
    }
    if (!nullToAbsent || newConfirmed != null) {
      map['new_confirmed'] = Variable<int>(newConfirmed);
    }
    if (!nullToAbsent || totalConfirmed != null) {
      map['total_confirmed'] = Variable<int>(totalConfirmed);
    }
    if (!nullToAbsent || newDeaths != null) {
      map['new_deaths'] = Variable<int>(newDeaths);
    }
    if (!nullToAbsent || totalDeaths != null) {
      map['total_deaths'] = Variable<int>(totalDeaths);
    }
    if (!nullToAbsent || newRecovered != null) {
      map['new_recovered'] = Variable<int>(newRecovered);
    }
    if (!nullToAbsent || totalRecovered != null) {
      map['total_recovered'] = Variable<int>(totalRecovered);
    }
    return map;
  }

  StatusModelCompanion toCompanion(bool nullToAbsent) {
    return StatusModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      newConfirmed: newConfirmed == null && nullToAbsent
          ? const Value.absent()
          : Value(newConfirmed),
      totalConfirmed: totalConfirmed == null && nullToAbsent
          ? const Value.absent()
          : Value(totalConfirmed),
      newDeaths: newDeaths == null && nullToAbsent
          ? const Value.absent()
          : Value(newDeaths),
      totalDeaths: totalDeaths == null && nullToAbsent
          ? const Value.absent()
          : Value(totalDeaths),
      newRecovered: newRecovered == null && nullToAbsent
          ? const Value.absent()
          : Value(newRecovered),
      totalRecovered: totalRecovered == null && nullToAbsent
          ? const Value.absent()
          : Value(totalRecovered),
    );
  }

  factory Status.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Status(
      id: serializer.fromJson<int>(json['id']),
      countryId: serializer.fromJson<int>(json['countryId']),
      newConfirmed: serializer.fromJson<int>(json['newConfirmed']),
      totalConfirmed: serializer.fromJson<int>(json['totalConfirmed']),
      newDeaths: serializer.fromJson<int>(json['newDeaths']),
      totalDeaths: serializer.fromJson<int>(json['totalDeaths']),
      newRecovered: serializer.fromJson<int>(json['newRecovered']),
      totalRecovered: serializer.fromJson<int>(json['totalRecovered']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'countryId': serializer.toJson<int>(countryId),
      'newConfirmed': serializer.toJson<int>(newConfirmed),
      'totalConfirmed': serializer.toJson<int>(totalConfirmed),
      'newDeaths': serializer.toJson<int>(newDeaths),
      'totalDeaths': serializer.toJson<int>(totalDeaths),
      'newRecovered': serializer.toJson<int>(newRecovered),
      'totalRecovered': serializer.toJson<int>(totalRecovered),
    };
  }

  Status copyWith(
          {int id,
          int countryId,
          int newConfirmed,
          int totalConfirmed,
          int newDeaths,
          int totalDeaths,
          int newRecovered,
          int totalRecovered}) =>
      Status(
        id: id ?? this.id,
        countryId: countryId ?? this.countryId,
        newConfirmed: newConfirmed ?? this.newConfirmed,
        totalConfirmed: totalConfirmed ?? this.totalConfirmed,
        newDeaths: newDeaths ?? this.newDeaths,
        totalDeaths: totalDeaths ?? this.totalDeaths,
        newRecovered: newRecovered ?? this.newRecovered,
        totalRecovered: totalRecovered ?? this.totalRecovered,
      );
  @override
  String toString() {
    return (StringBuffer('Status(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('newConfirmed: $newConfirmed, ')
          ..write('totalConfirmed: $totalConfirmed, ')
          ..write('newDeaths: $newDeaths, ')
          ..write('totalDeaths: $totalDeaths, ')
          ..write('newRecovered: $newRecovered, ')
          ..write('totalRecovered: $totalRecovered')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          countryId.hashCode,
          $mrjc(
              newConfirmed.hashCode,
              $mrjc(
                  totalConfirmed.hashCode,
                  $mrjc(
                      newDeaths.hashCode,
                      $mrjc(
                          totalDeaths.hashCode,
                          $mrjc(newRecovered.hashCode,
                              totalRecovered.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Status &&
          other.id == this.id &&
          other.countryId == this.countryId &&
          other.newConfirmed == this.newConfirmed &&
          other.totalConfirmed == this.totalConfirmed &&
          other.newDeaths == this.newDeaths &&
          other.totalDeaths == this.totalDeaths &&
          other.newRecovered == this.newRecovered &&
          other.totalRecovered == this.totalRecovered);
}

class StatusModelCompanion extends UpdateCompanion<Status> {
  final Value<int> id;
  final Value<int> countryId;
  final Value<int> newConfirmed;
  final Value<int> totalConfirmed;
  final Value<int> newDeaths;
  final Value<int> totalDeaths;
  final Value<int> newRecovered;
  final Value<int> totalRecovered;
  const StatusModelCompanion({
    this.id = const Value.absent(),
    this.countryId = const Value.absent(),
    this.newConfirmed = const Value.absent(),
    this.totalConfirmed = const Value.absent(),
    this.newDeaths = const Value.absent(),
    this.totalDeaths = const Value.absent(),
    this.newRecovered = const Value.absent(),
    this.totalRecovered = const Value.absent(),
  });
  StatusModelCompanion.insert({
    this.id = const Value.absent(),
    @required int countryId,
    @required int newConfirmed,
    @required int totalConfirmed,
    @required int newDeaths,
    @required int totalDeaths,
    @required int newRecovered,
    @required int totalRecovered,
  })  : countryId = Value(countryId),
        newConfirmed = Value(newConfirmed),
        totalConfirmed = Value(totalConfirmed),
        newDeaths = Value(newDeaths),
        totalDeaths = Value(totalDeaths),
        newRecovered = Value(newRecovered),
        totalRecovered = Value(totalRecovered);
  static Insertable<Status> custom({
    Expression<int> id,
    Expression<int> countryId,
    Expression<int> newConfirmed,
    Expression<int> totalConfirmed,
    Expression<int> newDeaths,
    Expression<int> totalDeaths,
    Expression<int> newRecovered,
    Expression<int> totalRecovered,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (countryId != null) 'country_id': countryId,
      if (newConfirmed != null) 'new_confirmed': newConfirmed,
      if (totalConfirmed != null) 'total_confirmed': totalConfirmed,
      if (newDeaths != null) 'new_deaths': newDeaths,
      if (totalDeaths != null) 'total_deaths': totalDeaths,
      if (newRecovered != null) 'new_recovered': newRecovered,
      if (totalRecovered != null) 'total_recovered': totalRecovered,
    });
  }

  StatusModelCompanion copyWith(
      {Value<int> id,
      Value<int> countryId,
      Value<int> newConfirmed,
      Value<int> totalConfirmed,
      Value<int> newDeaths,
      Value<int> totalDeaths,
      Value<int> newRecovered,
      Value<int> totalRecovered}) {
    return StatusModelCompanion(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      newConfirmed: newConfirmed ?? this.newConfirmed,
      totalConfirmed: totalConfirmed ?? this.totalConfirmed,
      newDeaths: newDeaths ?? this.newDeaths,
      totalDeaths: totalDeaths ?? this.totalDeaths,
      newRecovered: newRecovered ?? this.newRecovered,
      totalRecovered: totalRecovered ?? this.totalRecovered,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
    }
    if (newConfirmed.present) {
      map['new_confirmed'] = Variable<int>(newConfirmed.value);
    }
    if (totalConfirmed.present) {
      map['total_confirmed'] = Variable<int>(totalConfirmed.value);
    }
    if (newDeaths.present) {
      map['new_deaths'] = Variable<int>(newDeaths.value);
    }
    if (totalDeaths.present) {
      map['total_deaths'] = Variable<int>(totalDeaths.value);
    }
    if (newRecovered.present) {
      map['new_recovered'] = Variable<int>(newRecovered.value);
    }
    if (totalRecovered.present) {
      map['total_recovered'] = Variable<int>(totalRecovered.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatusModelCompanion(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('newConfirmed: $newConfirmed, ')
          ..write('totalConfirmed: $totalConfirmed, ')
          ..write('newDeaths: $newDeaths, ')
          ..write('totalDeaths: $totalDeaths, ')
          ..write('newRecovered: $newRecovered, ')
          ..write('totalRecovered: $totalRecovered')
          ..write(')'))
        .toString();
  }
}

class $StatusModelTable extends StatusModel
    with TableInfo<$StatusModelTable, Status> {
  final GeneratedDatabase _db;
  final String _alias;
  $StatusModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  GeneratedIntColumn _countryId;
  @override
  GeneratedIntColumn get countryId => _countryId ??= _constructCountryId();
  GeneratedIntColumn _constructCountryId() {
    return GeneratedIntColumn(
      'country_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _newConfirmedMeta =
      const VerificationMeta('newConfirmed');
  GeneratedIntColumn _newConfirmed;
  @override
  GeneratedIntColumn get newConfirmed =>
      _newConfirmed ??= _constructNewConfirmed();
  GeneratedIntColumn _constructNewConfirmed() {
    return GeneratedIntColumn(
      'new_confirmed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalConfirmedMeta =
      const VerificationMeta('totalConfirmed');
  GeneratedIntColumn _totalConfirmed;
  @override
  GeneratedIntColumn get totalConfirmed =>
      _totalConfirmed ??= _constructTotalConfirmed();
  GeneratedIntColumn _constructTotalConfirmed() {
    return GeneratedIntColumn(
      'total_confirmed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _newDeathsMeta = const VerificationMeta('newDeaths');
  GeneratedIntColumn _newDeaths;
  @override
  GeneratedIntColumn get newDeaths => _newDeaths ??= _constructNewDeaths();
  GeneratedIntColumn _constructNewDeaths() {
    return GeneratedIntColumn(
      'new_deaths',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalDeathsMeta =
      const VerificationMeta('totalDeaths');
  GeneratedIntColumn _totalDeaths;
  @override
  GeneratedIntColumn get totalDeaths =>
      _totalDeaths ??= _constructTotalDeaths();
  GeneratedIntColumn _constructTotalDeaths() {
    return GeneratedIntColumn(
      'total_deaths',
      $tableName,
      false,
    );
  }

  final VerificationMeta _newRecoveredMeta =
      const VerificationMeta('newRecovered');
  GeneratedIntColumn _newRecovered;
  @override
  GeneratedIntColumn get newRecovered =>
      _newRecovered ??= _constructNewRecovered();
  GeneratedIntColumn _constructNewRecovered() {
    return GeneratedIntColumn(
      'new_recovered',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalRecoveredMeta =
      const VerificationMeta('totalRecovered');
  GeneratedIntColumn _totalRecovered;
  @override
  GeneratedIntColumn get totalRecovered =>
      _totalRecovered ??= _constructTotalRecovered();
  GeneratedIntColumn _constructTotalRecovered() {
    return GeneratedIntColumn(
      'total_recovered',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        countryId,
        newConfirmed,
        totalConfirmed,
        newDeaths,
        totalDeaths,
        newRecovered,
        totalRecovered
      ];
  @override
  $StatusModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'status_model';
  @override
  final String actualTableName = 'status_model';
  @override
  VerificationContext validateIntegrity(Insertable<Status> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id'], _countryIdMeta));
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    if (data.containsKey('new_confirmed')) {
      context.handle(
          _newConfirmedMeta,
          newConfirmed.isAcceptableOrUnknown(
              data['new_confirmed'], _newConfirmedMeta));
    } else if (isInserting) {
      context.missing(_newConfirmedMeta);
    }
    if (data.containsKey('total_confirmed')) {
      context.handle(
          _totalConfirmedMeta,
          totalConfirmed.isAcceptableOrUnknown(
              data['total_confirmed'], _totalConfirmedMeta));
    } else if (isInserting) {
      context.missing(_totalConfirmedMeta);
    }
    if (data.containsKey('new_deaths')) {
      context.handle(_newDeathsMeta,
          newDeaths.isAcceptableOrUnknown(data['new_deaths'], _newDeathsMeta));
    } else if (isInserting) {
      context.missing(_newDeathsMeta);
    }
    if (data.containsKey('total_deaths')) {
      context.handle(
          _totalDeathsMeta,
          totalDeaths.isAcceptableOrUnknown(
              data['total_deaths'], _totalDeathsMeta));
    } else if (isInserting) {
      context.missing(_totalDeathsMeta);
    }
    if (data.containsKey('new_recovered')) {
      context.handle(
          _newRecoveredMeta,
          newRecovered.isAcceptableOrUnknown(
              data['new_recovered'], _newRecoveredMeta));
    } else if (isInserting) {
      context.missing(_newRecoveredMeta);
    }
    if (data.containsKey('total_recovered')) {
      context.handle(
          _totalRecoveredMeta,
          totalRecovered.isAcceptableOrUnknown(
              data['total_recovered'], _totalRecoveredMeta));
    } else if (isInserting) {
      context.missing(_totalRecoveredMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Status map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Status.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StatusModelTable createAlias(String alias) {
    return $StatusModelTable(_db, alias);
  }
}

class CountryWeb extends DataClass implements Insertable<CountryWeb> {
  final int id;
  final int countryId;
  final String url;
  CountryWeb({@required this.id, @required this.countryId, @required this.url});
  factory CountryWeb.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CountryWeb(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      countryId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}country_id']),
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<int>(countryId);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    return map;
  }

  CountryWebModelCompanion toCompanion(bool nullToAbsent) {
    return CountryWebModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
    );
  }

  factory CountryWeb.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CountryWeb(
      id: serializer.fromJson<int>(json['id']),
      countryId: serializer.fromJson<int>(json['countryId']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'countryId': serializer.toJson<int>(countryId),
      'url': serializer.toJson<String>(url),
    };
  }

  CountryWeb copyWith({int id, int countryId, String url}) => CountryWeb(
        id: id ?? this.id,
        countryId: countryId ?? this.countryId,
        url: url ?? this.url,
      );
  @override
  String toString() {
    return (StringBuffer('CountryWeb(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(countryId.hashCode, url.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CountryWeb &&
          other.id == this.id &&
          other.countryId == this.countryId &&
          other.url == this.url);
}

class CountryWebModelCompanion extends UpdateCompanion<CountryWeb> {
  final Value<int> id;
  final Value<int> countryId;
  final Value<String> url;
  const CountryWebModelCompanion({
    this.id = const Value.absent(),
    this.countryId = const Value.absent(),
    this.url = const Value.absent(),
  });
  CountryWebModelCompanion.insert({
    this.id = const Value.absent(),
    @required int countryId,
    @required String url,
  })  : countryId = Value(countryId),
        url = Value(url);
  static Insertable<CountryWeb> custom({
    Expression<int> id,
    Expression<int> countryId,
    Expression<String> url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (countryId != null) 'country_id': countryId,
      if (url != null) 'url': url,
    });
  }

  CountryWebModelCompanion copyWith(
      {Value<int> id, Value<int> countryId, Value<String> url}) {
    return CountryWebModelCompanion(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountryWebModelCompanion(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

class $CountryWebModelTable extends CountryWebModel
    with TableInfo<$CountryWebModelTable, CountryWeb> {
  final GeneratedDatabase _db;
  final String _alias;
  $CountryWebModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  GeneratedIntColumn _countryId;
  @override
  GeneratedIntColumn get countryId => _countryId ??= _constructCountryId();
  GeneratedIntColumn _constructCountryId() {
    return GeneratedIntColumn(
      'country_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  @override
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, countryId, url];
  @override
  $CountryWebModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'country_web_model';
  @override
  final String actualTableName = 'country_web_model';
  @override
  VerificationContext validateIntegrity(Insertable<CountryWeb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id'], _countryIdMeta));
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url'], _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CountryWeb map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CountryWeb.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CountryWebModelTable createAlias(String alias) {
    return $CountryWebModelTable(_db, alias);
  }
}

class Buy extends DataClass implements Insertable<Buy> {
  final int id;
  final bool isBuy;
  final String productType;
  final DateTime date;
  Buy(
      {@required this.id,
      @required this.isBuy,
      @required this.productType,
      this.date});
  factory Buy.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Buy(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      isBuy: boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_buy']),
      productType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_type']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || isBuy != null) {
      map['is_buy'] = Variable<bool>(isBuy);
    }
    if (!nullToAbsent || productType != null) {
      map['product_type'] = Variable<String>(productType);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  BuyModelCompanion toCompanion(bool nullToAbsent) {
    return BuyModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      isBuy:
          isBuy == null && nullToAbsent ? const Value.absent() : Value(isBuy),
      productType: productType == null && nullToAbsent
          ? const Value.absent()
          : Value(productType),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory Buy.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Buy(
      id: serializer.fromJson<int>(json['id']),
      isBuy: serializer.fromJson<bool>(json['isBuy']),
      productType: serializer.fromJson<String>(json['productType']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isBuy': serializer.toJson<bool>(isBuy),
      'productType': serializer.toJson<String>(productType),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Buy copyWith({int id, bool isBuy, String productType, DateTime date}) => Buy(
        id: id ?? this.id,
        isBuy: isBuy ?? this.isBuy,
        productType: productType ?? this.productType,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Buy(')
          ..write('id: $id, ')
          ..write('isBuy: $isBuy, ')
          ..write('productType: $productType, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(isBuy.hashCode, $mrjc(productType.hashCode, date.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Buy &&
          other.id == this.id &&
          other.isBuy == this.isBuy &&
          other.productType == this.productType &&
          other.date == this.date);
}

class BuyModelCompanion extends UpdateCompanion<Buy> {
  final Value<int> id;
  final Value<bool> isBuy;
  final Value<String> productType;
  final Value<DateTime> date;
  const BuyModelCompanion({
    this.id = const Value.absent(),
    this.isBuy = const Value.absent(),
    this.productType = const Value.absent(),
    this.date = const Value.absent(),
  });
  BuyModelCompanion.insert({
    this.id = const Value.absent(),
    @required bool isBuy,
    @required String productType,
    this.date = const Value.absent(),
  })  : isBuy = Value(isBuy),
        productType = Value(productType);
  static Insertable<Buy> custom({
    Expression<int> id,
    Expression<bool> isBuy,
    Expression<String> productType,
    Expression<DateTime> date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isBuy != null) 'is_buy': isBuy,
      if (productType != null) 'product_type': productType,
      if (date != null) 'date': date,
    });
  }

  BuyModelCompanion copyWith(
      {Value<int> id,
      Value<bool> isBuy,
      Value<String> productType,
      Value<DateTime> date}) {
    return BuyModelCompanion(
      id: id ?? this.id,
      isBuy: isBuy ?? this.isBuy,
      productType: productType ?? this.productType,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isBuy.present) {
      map['is_buy'] = Variable<bool>(isBuy.value);
    }
    if (productType.present) {
      map['product_type'] = Variable<String>(productType.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BuyModelCompanion(')
          ..write('id: $id, ')
          ..write('isBuy: $isBuy, ')
          ..write('productType: $productType, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $BuyModelTable extends BuyModel with TableInfo<$BuyModelTable, Buy> {
  final GeneratedDatabase _db;
  final String _alias;
  $BuyModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _isBuyMeta = const VerificationMeta('isBuy');
  GeneratedBoolColumn _isBuy;
  @override
  GeneratedBoolColumn get isBuy => _isBuy ??= _constructIsBuy();
  GeneratedBoolColumn _constructIsBuy() {
    return GeneratedBoolColumn(
      'is_buy',
      $tableName,
      false,
    );
  }

  final VerificationMeta _productTypeMeta =
      const VerificationMeta('productType');
  GeneratedTextColumn _productType;
  @override
  GeneratedTextColumn get productType =>
      _productType ??= _constructProductType();
  GeneratedTextColumn _constructProductType() {
    return GeneratedTextColumn(
      'product_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, isBuy, productType, date];
  @override
  $BuyModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'buy_model';
  @override
  final String actualTableName = 'buy_model';
  @override
  VerificationContext validateIntegrity(Insertable<Buy> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('is_buy')) {
      context.handle(
          _isBuyMeta, isBuy.isAcceptableOrUnknown(data['is_buy'], _isBuyMeta));
    } else if (isInserting) {
      context.missing(_isBuyMeta);
    }
    if (data.containsKey('product_type')) {
      context.handle(
          _productTypeMeta,
          productType.isAcceptableOrUnknown(
              data['product_type'], _productTypeMeta));
    } else if (isInserting) {
      context.missing(_productTypeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Buy map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Buy.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BuyModelTable createAlias(String alias) {
    return $BuyModelTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CountryModelTable _countryModel;
  $CountryModelTable get countryModel =>
      _countryModel ??= $CountryModelTable(this);
  $GlobalModelTable _globalModel;
  $GlobalModelTable get globalModel => _globalModel ??= $GlobalModelTable(this);
  $UserModelTable _userModel;
  $UserModelTable get userModel => _userModel ??= $UserModelTable(this);
  $WorldModelTable _worldModel;
  $WorldModelTable get worldModel => _worldModel ??= $WorldModelTable(this);
  $SyncDateModelTable _syncDateModel;
  $SyncDateModelTable get syncDateModel =>
      _syncDateModel ??= $SyncDateModelTable(this);
  $StatusModelTable _statusModel;
  $StatusModelTable get statusModel => _statusModel ??= $StatusModelTable(this);
  $CountryWebModelTable _countryWebModel;
  $CountryWebModelTable get countryWebModel =>
      _countryWebModel ??= $CountryWebModelTable(this);
  $BuyModelTable _buyModel;
  $BuyModelTable get buyModel => _buyModel ??= $BuyModelTable(this);
  CountryService _countryService;
  CountryService get countryService =>
      _countryService ??= CountryService(this as Database);
  GlobalService _globalService;
  GlobalService get globalService =>
      _globalService ??= GlobalService(this as Database);
  UserService _userService;
  UserService get userService => _userService ??= UserService(this as Database);
  WorldService _worldService;
  WorldService get worldService =>
      _worldService ??= WorldService(this as Database);
  SyncDateService _syncDateService;
  SyncDateService get syncDateService =>
      _syncDateService ??= SyncDateService(this as Database);
  StatusService _statusService;
  StatusService get statusService =>
      _statusService ??= StatusService(this as Database);
  CountryWebService _countryWebService;
  CountryWebService get countryWebService =>
      _countryWebService ??= CountryWebService(this as Database);
  BuyService _buyService;
  BuyService get buyService => _buyService ??= BuyService(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        countryModel,
        globalModel,
        userModel,
        worldModel,
        syncDateModel,
        statusModel,
        countryWebModel,
        buyModel
      ];
}
