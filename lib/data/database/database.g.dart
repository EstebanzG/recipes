// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $RecipeTable extends Recipe with TableInfo<$RecipeTable, RecipeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idRecipeMeta =
      const VerificationMeta('idRecipe');
  @override
  late final GeneratedColumn<int> idRecipe = GeneratedColumn<int>(
      'id_recipe', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'Title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'Category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _favoriteMeta =
      const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
      'Favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("Favorite" IN (0, 1))'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'Description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'Duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idRecipe, title, category, favorite, description, duration];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_recipe')) {
      context.handle(_idRecipeMeta,
          idRecipe.isAcceptableOrUnknown(data['id_recipe']!, _idRecipeMeta));
    }
    if (data.containsKey('Title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['Title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('Category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['Category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('Favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['Favorite']!, _favoriteMeta));
    } else if (isInserting) {
      context.missing(_favoriteMeta);
    }
    if (data.containsKey('Description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['Description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('Duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['Duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idRecipe};
  @override
  RecipeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeData(
      idRecipe: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_recipe'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Title'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Category'])!,
      favorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}Favorite'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Description'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}Duration'])!,
    );
  }

  @override
  $RecipeTable createAlias(String alias) {
    return $RecipeTable(attachedDatabase, alias);
  }
}

class RecipeData extends DataClass implements Insertable<RecipeData> {
  final int idRecipe;
  final String title;
  final String category;
  final bool favorite;
  final String description;
  final int duration;
  const RecipeData(
      {required this.idRecipe,
      required this.title,
      required this.category,
      required this.favorite,
      required this.description,
      required this.duration});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_recipe'] = Variable<int>(idRecipe);
    map['Title'] = Variable<String>(title);
    map['Category'] = Variable<String>(category);
    map['Favorite'] = Variable<bool>(favorite);
    map['Description'] = Variable<String>(description);
    map['Duration'] = Variable<int>(duration);
    return map;
  }

  RecipeCompanion toCompanion(bool nullToAbsent) {
    return RecipeCompanion(
      idRecipe: Value(idRecipe),
      title: Value(title),
      category: Value(category),
      favorite: Value(favorite),
      description: Value(description),
      duration: Value(duration),
    );
  }

  factory RecipeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeData(
      idRecipe: serializer.fromJson<int>(json['idRecipe']),
      title: serializer.fromJson<String>(json['title']),
      category: serializer.fromJson<String>(json['category']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      description: serializer.fromJson<String>(json['description']),
      duration: serializer.fromJson<int>(json['duration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idRecipe': serializer.toJson<int>(idRecipe),
      'title': serializer.toJson<String>(title),
      'category': serializer.toJson<String>(category),
      'favorite': serializer.toJson<bool>(favorite),
      'description': serializer.toJson<String>(description),
      'duration': serializer.toJson<int>(duration),
    };
  }

  RecipeData copyWith(
          {int? idRecipe,
          String? title,
          String? category,
          bool? favorite,
          String? description,
          int? duration}) =>
      RecipeData(
        idRecipe: idRecipe ?? this.idRecipe,
        title: title ?? this.title,
        category: category ?? this.category,
        favorite: favorite ?? this.favorite,
        description: description ?? this.description,
        duration: duration ?? this.duration,
      );
  @override
  String toString() {
    return (StringBuffer('RecipeData(')
          ..write('idRecipe: $idRecipe, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('favorite: $favorite, ')
          ..write('description: $description, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idRecipe, title, category, favorite, description, duration);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeData &&
          other.idRecipe == this.idRecipe &&
          other.title == this.title &&
          other.category == this.category &&
          other.favorite == this.favorite &&
          other.description == this.description &&
          other.duration == this.duration);
}

class RecipeCompanion extends UpdateCompanion<RecipeData> {
  final Value<int> idRecipe;
  final Value<String> title;
  final Value<String> category;
  final Value<bool> favorite;
  final Value<String> description;
  final Value<int> duration;
  const RecipeCompanion({
    this.idRecipe = const Value.absent(),
    this.title = const Value.absent(),
    this.category = const Value.absent(),
    this.favorite = const Value.absent(),
    this.description = const Value.absent(),
    this.duration = const Value.absent(),
  });
  RecipeCompanion.insert({
    this.idRecipe = const Value.absent(),
    required String title,
    required String category,
    required bool favorite,
    required String description,
    required int duration,
  })  : title = Value(title),
        category = Value(category),
        favorite = Value(favorite),
        description = Value(description),
        duration = Value(duration);
  static Insertable<RecipeData> custom({
    Expression<int>? idRecipe,
    Expression<String>? title,
    Expression<String>? category,
    Expression<bool>? favorite,
    Expression<String>? description,
    Expression<int>? duration,
  }) {
    return RawValuesInsertable({
      if (idRecipe != null) 'id_recipe': idRecipe,
      if (title != null) 'Title': title,
      if (category != null) 'Category': category,
      if (favorite != null) 'Favorite': favorite,
      if (description != null) 'Description': description,
      if (duration != null) 'Duration': duration,
    });
  }

  RecipeCompanion copyWith(
      {Value<int>? idRecipe,
      Value<String>? title,
      Value<String>? category,
      Value<bool>? favorite,
      Value<String>? description,
      Value<int>? duration}) {
    return RecipeCompanion(
      idRecipe: idRecipe ?? this.idRecipe,
      title: title ?? this.title,
      category: category ?? this.category,
      favorite: favorite ?? this.favorite,
      description: description ?? this.description,
      duration: duration ?? this.duration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idRecipe.present) {
      map['id_recipe'] = Variable<int>(idRecipe.value);
    }
    if (title.present) {
      map['Title'] = Variable<String>(title.value);
    }
    if (category.present) {
      map['Category'] = Variable<String>(category.value);
    }
    if (favorite.present) {
      map['Favorite'] = Variable<bool>(favorite.value);
    }
    if (description.present) {
      map['Description'] = Variable<String>(description.value);
    }
    if (duration.present) {
      map['Duration'] = Variable<int>(duration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeCompanion(')
          ..write('idRecipe: $idRecipe, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('favorite: $favorite, ')
          ..write('description: $description, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }
}

class $IngredientTable extends Ingredient
    with TableInfo<$IngredientTable, IngredientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idIngredientMeta =
      const VerificationMeta('idIngredient');
  @override
  late final GeneratedColumn<int> idIngredient = GeneratedColumn<int>(
      'id_ingredient', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idRecipeMeta =
      const VerificationMeta('idRecipe');
  @override
  late final GeneratedColumn<int> idRecipe = GeneratedColumn<int>(
      'id_recipe', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES recipe (id_recipe)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'Name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'Quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'Unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idIngredient, idRecipe, name, quantity, unit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredient';
  @override
  VerificationContext validateIntegrity(Insertable<IngredientData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_ingredient')) {
      context.handle(
          _idIngredientMeta,
          idIngredient.isAcceptableOrUnknown(
              data['id_ingredient']!, _idIngredientMeta));
    }
    if (data.containsKey('id_recipe')) {
      context.handle(_idRecipeMeta,
          idRecipe.isAcceptableOrUnknown(data['id_recipe']!, _idRecipeMeta));
    } else if (isInserting) {
      context.missing(_idRecipeMeta);
    }
    if (data.containsKey('Name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['Name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('Quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['Quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('Unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['Unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idIngredient};
  @override
  IngredientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientData(
      idIngredient: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_ingredient'])!,
      idRecipe: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_recipe'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Name'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}Quantity'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Unit'])!,
    );
  }

  @override
  $IngredientTable createAlias(String alias) {
    return $IngredientTable(attachedDatabase, alias);
  }
}

class IngredientData extends DataClass implements Insertable<IngredientData> {
  final int idIngredient;
  final int idRecipe;
  final String name;
  final int quantity;
  final String unit;
  const IngredientData(
      {required this.idIngredient,
      required this.idRecipe,
      required this.name,
      required this.quantity,
      required this.unit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_ingredient'] = Variable<int>(idIngredient);
    map['id_recipe'] = Variable<int>(idRecipe);
    map['Name'] = Variable<String>(name);
    map['Quantity'] = Variable<int>(quantity);
    map['Unit'] = Variable<String>(unit);
    return map;
  }

  IngredientCompanion toCompanion(bool nullToAbsent) {
    return IngredientCompanion(
      idIngredient: Value(idIngredient),
      idRecipe: Value(idRecipe),
      name: Value(name),
      quantity: Value(quantity),
      unit: Value(unit),
    );
  }

  factory IngredientData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientData(
      idIngredient: serializer.fromJson<int>(json['idIngredient']),
      idRecipe: serializer.fromJson<int>(json['idRecipe']),
      name: serializer.fromJson<String>(json['name']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unit: serializer.fromJson<String>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idIngredient': serializer.toJson<int>(idIngredient),
      'idRecipe': serializer.toJson<int>(idRecipe),
      'name': serializer.toJson<String>(name),
      'quantity': serializer.toJson<int>(quantity),
      'unit': serializer.toJson<String>(unit),
    };
  }

  IngredientData copyWith(
          {int? idIngredient,
          int? idRecipe,
          String? name,
          int? quantity,
          String? unit}) =>
      IngredientData(
        idIngredient: idIngredient ?? this.idIngredient,
        idRecipe: idRecipe ?? this.idRecipe,
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
      );
  @override
  String toString() {
    return (StringBuffer('IngredientData(')
          ..write('idIngredient: $idIngredient, ')
          ..write('idRecipe: $idRecipe, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idIngredient, idRecipe, name, quantity, unit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientData &&
          other.idIngredient == this.idIngredient &&
          other.idRecipe == this.idRecipe &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.unit == this.unit);
}

class IngredientCompanion extends UpdateCompanion<IngredientData> {
  final Value<int> idIngredient;
  final Value<int> idRecipe;
  final Value<String> name;
  final Value<int> quantity;
  final Value<String> unit;
  const IngredientCompanion({
    this.idIngredient = const Value.absent(),
    this.idRecipe = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unit = const Value.absent(),
  });
  IngredientCompanion.insert({
    this.idIngredient = const Value.absent(),
    required int idRecipe,
    required String name,
    required int quantity,
    required String unit,
  })  : idRecipe = Value(idRecipe),
        name = Value(name),
        quantity = Value(quantity),
        unit = Value(unit);
  static Insertable<IngredientData> custom({
    Expression<int>? idIngredient,
    Expression<int>? idRecipe,
    Expression<String>? name,
    Expression<int>? quantity,
    Expression<String>? unit,
  }) {
    return RawValuesInsertable({
      if (idIngredient != null) 'id_ingredient': idIngredient,
      if (idRecipe != null) 'id_recipe': idRecipe,
      if (name != null) 'Name': name,
      if (quantity != null) 'Quantity': quantity,
      if (unit != null) 'Unit': unit,
    });
  }

  IngredientCompanion copyWith(
      {Value<int>? idIngredient,
      Value<int>? idRecipe,
      Value<String>? name,
      Value<int>? quantity,
      Value<String>? unit}) {
    return IngredientCompanion(
      idIngredient: idIngredient ?? this.idIngredient,
      idRecipe: idRecipe ?? this.idRecipe,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idIngredient.present) {
      map['id_ingredient'] = Variable<int>(idIngredient.value);
    }
    if (idRecipe.present) {
      map['id_recipe'] = Variable<int>(idRecipe.value);
    }
    if (name.present) {
      map['Name'] = Variable<String>(name.value);
    }
    if (quantity.present) {
      map['Quantity'] = Variable<int>(quantity.value);
    }
    if (unit.present) {
      map['Unit'] = Variable<String>(unit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientCompanion(')
          ..write('idIngredient: $idIngredient, ')
          ..write('idRecipe: $idRecipe, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $RecipeTable recipe = $RecipeTable(this);
  late final $IngredientTable ingredient = $IngredientTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [recipe, ingredient];
}
